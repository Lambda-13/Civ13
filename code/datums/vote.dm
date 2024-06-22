var/datum/vote/vote = new()

var/global/list/round_voters = list() //Keeps track of the individuals voting for a given round, for use in forcedrafting.

/datum/vote
	var/initiator = null
	var/started_time = null
	var/time_remaining = 0
	var/mode = null
	var/question = null
	var/default = null
	var/list/choices = list()
	var/list/gamemode_names = list()
	var/list/voted = list()
	var/list/voting = list()
	var/list/current_votes = list()
	var/list/additional_text = list()
	var/auto_muted = FALSE
	var/win_threshold = 0.65
	var/list/callback = null
	var/list/disabled[10]
	var/voted_epoch = "1713"
	var/voted_gamemode = "Classic (Stone Age Start)"
	var/autogamemode_triggered = FALSE
	New()
		if (vote != src)
			if (istype(vote))
				del(vote)
			vote = src

	proc/process()	//called by master_controller
		if (mode)
			// No more change mode votes after the game has started.
			// 3 is GAME_STATE_PLAYING, but that #define is undefined for some reason
			if (mode == "gamemode" && ticker.current_state >= 2)
				world << "<b>Начало раунда остановлено до окончания голосования.</b>"
				reset()
				return

			// Calculate how much time is remaining by comparing current time, to time of vote start,
			// plus vote duration
			time_remaining = round((started_time + config.vote_period - world.time)/10)

			if (time_remaining < 0)
				result()
				for (var/client/C in voting)
					if (C)
						C << browse(null,"window=vote")
				reset()
			else
				voting.Cut()
				for (var/client/C in voting)
					if (C)
						C << browse(vote.interface(C),"window=vote")

	proc/autogamemode()
		if (map.ID == MAP_NATIONSRP || map.ID == MAP_NATIONSRP_TRIPLE || map.ID == MAP_NATIONSRPMED || map.ID == MAP_NATIONSRP_WW2 || map.ID == MAP_NATIONSRP_COLDWAR || map.ID == MAP_NATIONSRP_COLDWAR_CAMPAIGN || map.ID == MAP_NOMADS_PERSISTENCE_BETA || map.ID == MAP_CAMPAIGN || map.ID == MAP_ROTSTADT || map.ID == MAP_GLADIATORS || map.ID == MAP_ALLEYWAY || map.ID == MAP_NOMADS_EXTENDED || map.ID == MAP_CIVILIZATIONS || map.ID == MAP_TRIBES || map.ID == MAP_JUNGLE_OF_THE_CHADS || map.ID == MAP_NOMADS_WASTELAND || map.ID == MAP_NOMADS_WASTELAND_2 || map.ID == MAP_TESTING || map.battleroyale || map.ID == MAP_THE_ART_OF_THE_DEAL || map.ID == MAP_FOUR_KINGDOMS)
			return
		if (map.persistence)
			return
		if (map.ID == MAP_CAPITOL_HILL && istype(map, /obj/map_metadata/capitol_hill/pla_offensive))
			return
		if (map.ID == MAP_CAPITOL_HILL || map.ID == MAP_YELTSIN)
			initiate_vote("gamemode","the server", TRUE)
			return
		if (!map.is_RP && autogamemode_triggered == FALSE)
			initiate_vote("gamemode","the server", TRUE)
			log_debug("The server has called a gamemode vote.")
			autogamemode_triggered = TRUE
			return
		else
			return


	proc/reset()
		initiator = null
		time_remaining = 0
		mode = null
		question = null
		choices.Cut()
		voted.Cut()
		voting.Cut()
		current_votes.Cut()
		additional_text.Cut()
		disabled.Cut()

	proc/get_result()
		//get the highest number of votes
		var/greatest_votes = 0
		var/total_votes = 0
		for (var/option in choices)
			var/votes = choices[option]
			total_votes += votes
			if (votes > greatest_votes)
				greatest_votes = votes

		var/vote_threshold = total_votes * win_threshold


		//get all options with that many votes and return them in a list
		. = list()
		if (greatest_votes && greatest_votes >= vote_threshold)
			for (var/option in choices)
				if (choices[option] == greatest_votes)
					. += option
		return .

	proc/announce_result()
		var/list/winners = get_result()
		var/text
		if (!winners.len)
			if (default)
				winners += default
		if (winners.len)
			if (winners.len > 1)
			//	if (mode != "gamemode") // Here we are making sure we don't announce potential game modes
				text = "<b>Голоса разделились:</b>\n"
				for (var/option in winners)
					text += "\t[option]\n"
			var/newwinner = pick(winners)
			. = newwinner

			for (var/key in current_votes)
				if (choices[current_votes[key]] == newwinner)
					round_voters += key // Keep track of who voted for the winning round.
			text += "<b>Результат: <span class = 'ping'>[newwinner]</span></b><br>"
			text += "<b>Голосование окончено. </b>"
			if (callback)
				if (callback.len == 2)
					call(callback[1], callback[2])(newwinner)
				callback = null
		else
			text += "<b>Результат: <span class = 'ping'>Нет</span> - Недостаточно голосов за yes (надо больше 59% проголосовавших за yes)</b>"
		log_vote(text)
		world << "<font color='purple'>[text]</font>"
		world << sound('lambda/sanecman/sound/tf2/vote_success.ogg', repeat = FALSE, wait = FALSE, volume = 50, channel = 3)
		return .

	proc/result()
		. = announce_result()
		if (.)
			switch(mode)
				if ("restart")
					if (. == "Restart Round")
						world << "Пытаюсь закончить раунд."
						log_game("Ending the round due to restart vote.")
						map.next_win = world.time - 100
						processes.epochswap.admin_triggered = FALSE
						processes.epochswap.ready = TRUE
						processes.epochswap.fire()
						log_admin("Restart Vote triggered an epoch vote.")
						message_admins("Restart Vote triggered an epoch vote.")
				if ("epoch")
					ticker.finished = TRUE
					processes.mapswap.admin_triggered = FALSE
					processes.mapswap.ready = TRUE
					processes.mapswap.fire()
				if ("map")
					ticker.finished = TRUE
					processes.mapswap.finished_at = world.time
					var/F = file("SQL/gamedata.txt")
					if (fexists("SQL/gamedata.txt"))
						fdel(F)
					var/string1 = "map:[processes.mapswap.next_map_title]\n"
					var/string2 = "players:[clients.len]\n"
					text2file("[string1][string2]","SQL/gamedata.txt")
				if ("gamemode")
					processes.gamemode.swap(.)
		return .

	proc/submit_vote(var/ckey, var/vote)
		if (mode)
			if (vote && vote >= 1 && vote <= choices.len)
				usr.client << sound('lambda/sanecman/sound/tf2/Vote_1.ogg', repeat = FALSE, wait = FALSE, volume = 50, channel = 3)
				if (current_votes[ckey])
					choices[choices[current_votes[ckey]]]--
					usr.client << sound('lambda/sanecman/sound/tf2/Vote_2.ogg', repeat = FALSE, wait = FALSE, volume = 50, channel = 3)
				voted += usr.ckey
				choices[choices[vote]]++	//check this
				current_votes[ckey] = vote
				return vote
		return FALSE

	proc/initiate_vote(var/vote_type, var/initiator_key, var/automatic = FALSE, var/list/_callback = list())
		if (!mode)
			if (started_time != null && !(check_rights(R_ADMIN) || automatic))
				var/next_allowed_time = (started_time + config.vote_delay)
				if (next_allowed_time > world.time)
					return FALSE

			reset()
			win_threshold = 0.00
			default = null

			switch(vote_type)
				if ("restart")
					choices.Add("Restart Round","Continue Playing")
					win_threshold = 0.59
				if ("epoch")
					for (var/epoch in processes.epochswap.epochs)
						if (!default)
							default = epoch
						choices.Add(epoch)
						choices[epoch] = 0
					for (var/epoch in processes.epochswap.epochs)
						if (clients.len < processes.epochswap.epochs[epoch])
							disabled[epoch] = "необходимо [processes.epochswap.epochs[epoch]] игроков"
				if ("map")
					for (var/map in processes.mapswap.maps)
						if (!default)
							default = map
						map = capitalize(lowertext(map))
						choices.Add(map)
						choices[map] = 0
					for (var/map in processes.mapswap.maps)
						if (clients.len < processes.mapswap.maps[map])
							disabled[capitalize(lowertext(map))] = "необходимо [processes.mapswap.maps[map]] игроков"
				if ("custom")
					question = input(usr,"What is the vote for?") as text|null
					if (!question)	return FALSE
					for (var/i=1,i<=10,i++)
						var/option = capitalize(input(usr,"Please enter an option or hit cancel to finish") as text|null)
						if (!option || mode || !usr.client)	break
						choices.Add(option)
					if (!choices.len)
						choices.Add("Yes")
						choices.Add("No")
				if ("gamemode")
					var/list/options = list()
					if (map.ID == MAP_CAPITOL_HILL || map.ID == MAP_YELTSIN)
						options = list("Protect the VIP", "Siege",/* "Area Capture",*/ "Kills")
						if (!default)
							default = "Siege"
					else if (map.ID == MAP_WACO)
						options = list("Protect the VIP", "Siege",/* "Area Capture",*/ /*"Kills"*/)
						if (!default)
							default = "Siege"
					else if (map.ID == MAP_EFT_FACTORY)
						options = list("Hardcore")
						if (!default)
							default = "Hardcore"
					else if (!map.is_RP && !map.nomads && !map.civilizations)
						if (clients.len < 10)
							options = list("Easy", "Normal", "Competitive")
						else if  (clients.len < 14)
							options = list("Easy", "Normal", "Competitive", "Hardcore")
						else
							options = list("Easy", "Normal", "Competitive", "Hardcore", "RealLive")
						if (!default)
							default = "Normal"
					else if (map.is_wasteland)
						options = list("After the Fall", "Nuclear","Zombie Apocalypse")
					else if (map.nomads || map.civilizations)
						options = list("Classic (Stone Age Start)", "Auto-Research Mode", "Resource-Based Research", "Bronze Age (No Research)", "Medieval (No Research)", "Imperial Age (No Research)", "Industrial Age (No Research)", "Early Modern Age (No Research)", "WW2 Age (No Research)", "Modern Age (No Research)")
						if (!default)
							default = "Classic (Stone Age Start)"
					choices.Add(options)

				else
					return FALSE
			mode = vote_type
			initiator = initiator_key
			started_time = world.time
			var/text = "[capitalize(mode)] начат [initiator]."
			if (mode == "custom")
				text += "\n[question]"

			log_vote(text)
			world << "<span class = 'deadsay'><b>[text]</b>\nЖми <a href='?src=\ref[src]'>сюда</a> что-бы отдать свой голос. \nДо конца голосования [config.vote_period/10] секунд.</span>"

			world << sound('lambda/sanecman/sound/tf2/Vote_started.ogg', repeat = FALSE, wait = FALSE, volume = 50, channel = 3)
			if (mode == "gamemode" && round_progressing)
				round_progressing = FALSE
				world << "<font color='red'><b>Старт раунда остановлен.</b></font>"
			time_remaining = round(config.vote_period/10)
			callback = _callback
			return TRUE
		return FALSE

	proc/interface(var/client/C)
		if (!C)	return
		var/admin = FALSE
		if (C.holder)
			if (C.holder.rights & R_ADMIN)
				admin = TRUE
		voting |= C
		. = "<meta charset='utf-8'><head><title>Панель Голосований</title></head><body>"
		if (mode)
			if (question)	. += "<h2>Голосование: '[question]'</h2>"
			else			. += "<h2>Голосование: [capitalize(mode)]</h2>"
			. += "Осталось: [time_remaining] секунд<hr>"
			. += "<table width = '100%'><tr><td align = 'center'><b>Выбор</b></td><td align = 'center'><b>Голоса</b></td>"
			for (var/i = 1, i <= choices.len, i++)
				var/votes = choices[choices[i]]
				if (!votes)	votes = 0
				. += "<tr>"

				if (disabled.Find(choices[i]))
					. += "<td><font color = 'grey'>DISABLED ([disabled[choices[i]]]): [choices[i]]</td><td align = 'center'>[votes]</font></td>"
				else if (current_votes[C.ckey] == i)
					. += "<td><b><a href='?src=\ref[src];vote=[i]'>[choices[i]]</a></b></td><td align = 'center'>[votes]</td>"
				else
					. += "<td><a href='?src=\ref[src];vote=[i]'>[choices[i]]</a></td><td align = 'center'>[votes]</td>"
				if (additional_text.len >= i)
					. += additional_text[i]
				. += "</tr>"

			. += "</table><hr>"
			if (admin && mode != "map")
				. += "(<a href='?src=\ref[src];vote=cancel'>Отменить Голосование</a>) "
		else
			. += "<h2>Начать голосование:</h2><hr><ul><li>"
			//restart
			if (admin || config.allow_vote_restart)
				. += "<a href='?src=\ref[src];vote=restart'>Рестарт</a>"
			else
				. += "<font color='grey'>Рестарт</font>"
			. += "</li><li>"
			if (admin)
				. += "\t(<a href='?src=\ref[src];vote=toggle_restart'>Воут на рестарт [config.allow_vote_restart?"включён":"выключен"]</a>)"
				. += "</li><li>"
				. += "<a href='?src=\ref[src];vote=gamemode'>Игровой Режим</a></li>"
			//custom
			if (admin)
				. += "<li><a href='?src=\ref[src];vote=custom'>Своё</a></li>"
			. += "</ul><hr>"
		. += "<a href='?src=\ref[src];vote=close' style='position:absolute;right:50px'>Закрыть</a></body></html>"

		return .


	Topic(href,href_list[],hsrc)
		if (!usr || !usr.client)	return	//not necessary but meh...just in-case somebody does something stupid
		switch(href_list["vote"])
			if ("close")
				voting -= usr.client
				usr << browse(null, "window=vote")
				return
			if ("cancel")
				log_admin("[key_name(usr)] отменяет воут.")
				message_admins("<span class = 'notice'>[key_name_admin(usr)] отменяет воут.</span>", TRUE)
				if (usr.client.holder)
					reset()
				world << sound('lambda/sanecman/sound/tf2/Vote_failure.ogg', repeat = FALSE, wait = FALSE, volume = 50, channel = 3)
			if ("toggle_restart")
				if (usr.client.holder)
					config.allow_vote_restart = !config.allow_vote_restart
			if ("toggle_gamemode")
				if (usr.client.holder)
					config.allow_vote_mode = !config.allow_vote_mode
			if ("restart")
				if (config.allow_vote_restart || usr.client.holder)
					if (processes.ticker.playtime_elapsed < 9000) //30 минут
						usr << "Раунд активен менее 15 минут, увы"
						return FALSE
					if (config.vote_no_dead && usr.stat == DEAD && !usr.client.holder)
						usr << "Если ты не играешь то какой может быть рестарт?"
						return FALSE
					if (!config.allowedgamemodes == "TDM")
						if ((map.nomads || map.is_RP) && clients.len < 5 && ((world.time-round_start_time)>108000) && !usr.client.holder)
							usr << "Вы не можете начать голосование за перезапуск, если игроков на сервере меньше 5, а раунд длится более 3 часов."
							return FALSE
					initiate_vote("restart",usr.key)
			if ("custom")
				if (usr.client.holder)
					initiate_vote("custom",usr.key)
			if ("gamemode")
				if (usr.client.holder)
					initiate_vote("gamemode",usr.key)
			else
				var/t = round(text2num(href_list["vote"]))
				if (t) // It starts from TRUE, so there's no problem
					submit_vote(usr.ckey, t)
		usr.vote()


/mob/verb/vote()
	set category = "ООС"
	set name = "Vote"

	if (vote)
		src << browse(vote.interface(client),"window=vote;size=400x600")
