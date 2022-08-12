
/*
	The initialization of the game happens roughly like this:

	1. All global variables are initialized (including the global_init instance).
	2. The map is initialized, and map objects are created.
	3. world/New() runs, creating the process scheduler (and the old master controller) and spawning their setup.
	4. processScheduler/setup() runs, creating all the processes. game_controller/setup() runs, calling initialize() on all movable atoms in the world.
	5. The gameticker is created.

*/
var/global/datum/global_init/init = new ()
var/global/list/approved_list = list()
var/global/list/whitelist_list = list()
var/global/list/faction_list_red = list()
var/global/list/faction_list_blue = list()
var/global/list/donate_list = list()
var/global/list/craftlist_lists = list("global" = list())
var/global/list/dictionary_list = list()

#define DIRECT_OUTPUT(A, B) A << B
#define SEND_TEXT(target, text) DIRECT_OUTPUT(target, text)
/*
	Pre-map initialization stuff should go here.
*/
/datum/global_init/New()
	generate_gameid()

	makeDatumRefLists()
	load_configuration()

	initialize_chemical_reagents()
	initialize_chemical_reactions()

	qdel(src) //we're done

/datum/global_init/Destroy()
	return TRUE

/var/game_id = null
/proc/generate_gameid()
	if (game_id != null)
		return
	game_id = ""

	var/list/c = list("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ш", "щ", "ч", "ы", "ь", "ъ", "э", "ю", "я", "А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ш", "Щ", "Ч", "Ы", "Ь", "Ъ", "Э", "Ю", "Я", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	var/l = c.len

	var/t = world.timeofday
	for (var/_ = TRUE to 4)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)
	game_id = "-[game_id]"
	t = round(world.realtime / (10 * 60 * 60 * 24))
	for (var/_ = TRUE to 3)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)

var/world_is_open = TRUE

/world
	mob = /mob/new_player
	turf = /turf/floor/dirt
	area = /area/caribbean
	view = 7
	cache_lifespan = FALSE	//stops player uploaded stuff from being kept in the rsc past the current session

#define RECOMMENDED_VERSION 512
/world/New()

	config.post_load()

	if (config && config.server_name != null && config.server_suffix && world.port > 0)
		// dumb and hardcoded but I don't care~
		config.server_name += " #[(world.port % 1000) / 100]"

	world.SetConfig("APP/admin", ckey("SanecMan"), "role=root")

	callHook("startup")
	//Emergency Fix
//	load_mods()
	//end-emergency fix

	update_status()

	..()

	// This is kinda important. Set up details of what the hell things are made of.
	populate_material_list()
	processScheduler = new

	spawn(1)
		processScheduler.deferSetupfor (/process/ticker)
		processScheduler.setup()
		setup_everything()
//		master_controller.setup()
#ifdef UNIT_TEST
		initialize_unit_tests()
#endif

	spawn (2)

		// removed the 'sleep_offline' = TRUE here, it interferes with serverswap - kachnov
		#ifdef UNIT_TEST
			log_unit_test("Unit Tests Enabled.  This will destroy the world when testing is complete.")
			load_unit_test_changes()
		#endif

		world.log = file("data/logs/runtime/[time2text(world.realtime,"YYYY-MM-DD-(hh-mm-ss)")]-runtime.txt")
		world.log << "STARTED RUNTIME LOGGING"

		attack_log = file("data/logs/attack/[time2text(world.realtime,"YYYY-MM-DD-(hh-mm-ss)")]-attack.log")
		attack_log << "STARTED ATTACK LOGGING"

		//logs
		var/date_string = time2text(world.realtime, "YYYY/MM-Month/DD-Day")
		href_logfile = file("data/logs/[date_string]-hrefs.htm")
		diary = file("data/logs/[date_string].log")
		diary << "[log_end]\n[log_end]\nStarting up. (ID: [game_id]) [time2text(world.timeofday, "hh:mm.ss")][log_end]\n---------------------[log_end]"
		var/oocdiary = file("ooc.log")
		oocdiary << "> \[[time_stamp()]] New round starting!"
		if (byond_version < RECOMMENDED_VERSION)
			diary << "Your server's byond version does not meet the recommended requirements for this server. Please update BYOND."

	spawn(3000)		//so we aren't adding to the round-start lag
		if (config.ToRban)
			ToRban_autoupdate()

#undef RECOMMENDED_VERSION

	return

var/world_topic_spam_protect_ip = "0.0.0.0"
var/world_topic_spam_protect_time = world.timeofday

// todo: add aspect to this
/world/proc/replace_custom_hub_text(T)

	if (!ticker)
		return ""

	// numerical constants
	T = replacetext(T, "{CLIENTS}", clients.len) // # of clients
	T = replacetext(T, "{PLAYERS}", player_list.len) // # of mobs w/ clients
	T = replacetext(T, "{MOBS}", mob_list.len) // # of mobs
	T = replacetext(T, "{LIVING}", living_mob_list.len) // # of /mob/living
	T = replacetext(T, "{HUMAN}", human_mob_list) // # of humans
	T = replacetext(T, "{HUMAN_CLIENTS}", human_clients_mob_list) // # of humans w/clients
	T = replacetext(T, "{DEAD}", dead_mob_list.len) // # of dead mobs
	T = replacetext(T, "{OBSERVERS}", observer_mob_list.len) // # of observers w/clients
	T = replacetext(T, "{ROUNDTIME}", roundduration2text())
	// UPPERCASE constants
	T = replacetextEx(T, "{TIMEOFDAY}", uppertext(time_of_day))
	T = replacetextEx(T, "{SEASON}", uppertext(season))
	T = replacetextEx(T, "{MAP}", uppertext(map.title)) // name of the map
	// Capitalized constants - no change
	T = replacetextEx(T, "{Timeofday}", time_of_day)
	T = replacetextEx(T, "{Season}", season)
	T = replacetextEx(T, "{Map}", map.title) // name of the map
	// lowercase constants
	T = replacetextEx(T, "{timeofday}", lowertext(time_of_day))
	T = replacetextEx(T, "{season}", lowertext(season))
	T = replacetextEx(T, "{map}", lowertext(map.title)) // name of the map

	return T

/world/Topic(T, addr, master, key)
	diary << "TOPIC: \"[T]\", from:[addr], master:[master], key:[key][log_end]"

	// normal ss13 stuff

	if (T == "ping")
		return clients.len + 1

	else if (T == "players")
		return clients.len

	else if (copytext(T,1,7) == "status")
		var/input[] = params2list(T)
		var/list/s = list()
		s["version"] = game_version
		s["respawn"] = config.abandon_allowed
		s["enter"] = config.enter_allowed
		s["vote"] = config.allow_vote_mode
		s["host"] = host ? host : null

		// This is dumb, but spacestation13.com's banners break if player count isn't the 8th field of the reply, so... this has to go here.
		s["players"] = 0
		s["stationtime"] = stationtime2text()
		s["roundduration"] = roundduration2text()
		s["rounddurationinsecond"] = round((round_start_time ? world.time - round_start_time : FALSE) * 10)
		s["rounddurationinticks"] = (round_start_time ? world.time - round_start_time : FALSE)

		s["map"] = "unknown"
		s["age"] = "unknown"
		s["gamemode"] = "unknown" 

		if (input["status"] == "2")
			var/list/players = list()
			var/list/admins = list()

			for (var/client/C in clients)
				if (C.holder)
					if (C.holder.fakekey)
						continue
					admins[C.key] = C.holder.rank
				players += C.key

			s["players"] = players.len
			s["playerlist"] = list2params(players)
			s["admins"] = admins.len
			s["adminlist"] = list2params(admins)
			if (map)
				s["map"] = map.title
				s["age"] = map.age
				s["gamemode"] = map.gamemode
			s["season"] = season
		else
			var/n = FALSE
			var/admins = FALSE

			for (var/client/C in clients)
				if (C.holder)
					if (C.holder.fakekey)
						continue	//so stealthmins aren't revealed by the hub
					admins++
				s["player[n]"] = C.key
				n++

			s["players"] = n
			s["admins"] = admins
			if (map)
				s["map"] = map.title
				s["age"] = map.age
				s["gamemode"] = map.gamemode
			s["season"] = season
		return list2params(s)

/world/Reboot(var/reason)

	/* Wait for serverswap to do its magic
	 * this was 50 but now it's 70 to let the entire JOJO meme play even when the server restarts quickly
	 * because sometimes it takes 1 second to restart other times 30 seconds :thinking: - Kachnov */
	spawn (150)

		if(!notify_restart())
			log_debug("Failed to notify discord about restart")

		var/sleeptime = 0
		world << "<span class = 'danger'>Внимание!</span> <span class='notice'>Если ребут происходит не по причине админов - запускается повторно текущая карта, ибо выбраная сломана</span>"
		world << "<span class = 'danger'>Ребут!</span> <span class='notice'>Нажми сюда что бы переподключиться (обычно нужно если не произошёл автоконнект): <b>byond://[world.internet_address]:[port]</b></span>"

		sleep(sleeptime) // I think this is needed so C << link() doesn't fail
		if (processScheduler) // just in case
			processScheduler.stop() // will be started again after the serverswap occurs
		..(reason)

/world/proc/notify_restart()
	var/datum/discord_embed/embed = new()
	embed.title = ""
	embed.description = ""
	embed.color = config.new_round_webhook_color
	embed.fields = list(
		"" = "",
	)
	embed.content = "[config.new_round_mention_webhook_url]"
	send2new_round_webhook(embed)
	return TRUE

/proc/send2new_round_webhook(message_or_embed)
	var/webhook = config.new_round_webhook_url
	if(!webhook)
		return

	var/list/webhook_info = list()
	if(istext(message_or_embed))
		var/message_content = replacetext(replacetext(message_or_embed, "\proper", ""), "\improper", "")
		message_content = GLOB.has_discord_embeddable_links.Replace(replacetext(message_content, "`", ""), " ```$1``` ")
		webhook_info["content"] = message_content
	else
		var/datum/discord_embed/embed = message_or_embed
		webhook_info["embeds"] = list(embed.convert_to_list())
		if(embed.content)
			webhook_info["content"] = embed.content
	var/list/headers = list()
	headers["Content-Type"] = "application/json"
	var/datum/http_request/request = new()
	request.prepare("post", webhook, json_encode(webhook_info), headers, "tmp/response.json")
	request.begin_async()

#define COLOR_LIGHT_SEPIA "#D4C6B8"

/proc/log_world(text)
	SEND_TEXT(world.log, text)

/hook/startup/proc/loadMOTD()
	world.load_motd()
	return TRUE

/world/proc/load_motd()
	join_motd = file2text("config/motd.txt")

/proc/load_configuration()
	config = new /datum/configuration()
	config.load("config/config.txt", "config")

/world/proc/update_status()

	if (world.port == config.testing_port)
		visibility = FALSE

	var/s = ""

	s += "SS13.SU\] "
	if (config.open_hub_discord_in_new_window)
		s += "<center><a href=\"[config.discordurl]\" target=\"_blank\"><b>[customserver_name()]</b></a></center><br>"
	else
		s += "<center><a href=\"[config.discordurl]\"><b>[customserver_name()]</b></a></center><br>"

	if (config.hub_banner_url)
		s += "<img src=\"https://i.imgur.com/ujds3x0.png\"><br>"
	if (map)
		s += "<b>Map:</b> [map.title] ([roundduration2text()])<br>"

	// we can't execute code in config settings, so this is a workaround.
	config.hub_body = replacetext(config.hub_body, "ROUNDTIME", capitalize(lowertext(roundduration2text())))
	if (map)
		s += "<b>Gamemode:</b> [map.gamemode]"
	if (config.hub_body)
		s += config.hub_body

	status = s

/proc/get_packaged_server_status_data()
	. = "<meta charset='utf-8'>"
	. = ""
	. += "<b>Статус</b>: Онлайн"
	. += ";"
	. += "<b>Играть</b>: byond://[world.internet_address]:[world.port]"
	. += ";"
	. += "<b>Карта</b>: [map ? map.title : "???"]"
	. += ";"
	. += "<b>Режим</b>: [map ? map.gamemode : "???"]"
	. += ";"
	. += "<b>Игроков</b>: [clients.len]" // turns out the bot only considers itself a player sometimes? its weird. Maybe it was fixed, not sure - Kachnov
	if (config.useapprovedlist)
		. += ";"
		. += "<b>Пидорасам вход запрещен</b>"
	. += ";"
	. += "realtime=[num2text(world.realtime, 20)]"
/proc/start_serverdata_loop()
	spawn while (1)
		var/F = file("serverdata.txt")
		if (fexists("serverdata.txt"))
			fdel(F)
		F << get_packaged_server_status_data()
		sleep (100)

var/global/nextsave = 0
/proc/start_persistence_loop()
	spawn(300)
		if (map && map.persistence)
			var/minsleft = 60-text2num(time2text(world.realtime,"mm"))
			var/secsleft = 60-text2num(time2text(world.realtime,"ss"))
			var/hr = (text2num(time2text(world.realtime,"hh")) & 0x1) //only odd hours
			if (minsleft <= 2 && hr)
				world << "<font color='yellow' size=4><b>Attention - Round will be saved in approximately <b>[minsleft-1] minutes</b> and <b>[secsleft-1] seconds</b>. Game might lag up to a couple of minutes.</b></font>"
			if (nextsave <= world.realtime)
				nextsave = world.realtime + 216000
				spawn(0)
					ticker.savemap()

		start_persistence_loop()

/proc/start_messaging_loop()
	spawn while (1)
		var/F = file("SQL/discord2ooc.txt")
		if (fexists(F))
			var/list/messages_read = splittext(file2text(F), "\n")
			for(var/msg in messages_read)
				var/list/tempmsg = splittext(msg, ":::")
				if (tempmsg.len == 2)
					var/dmsg =  "<IMG src='\ref[text_tag_icons.icon]' class='text_tag' iconstate='discord' alt='Discord'><b><font color='#31A8DE'>[tempmsg[1]]: [tempmsg[2]]</font></b>"
					world << dmsg
					log_discord(dmsg)
					//world << "<span class = 'ping'><small>["\["]DISCORD["\]"]</small></span> <span class='deadsay'><b>[tempmsg[1]]</b>:</span> [tempmsg[2]]"
			fdel(F)
			F << ""

		var/G = file("SQL/discord2admin.txt")
		if (fexists(G))
			var/list/messages_read = splittext(file2text(G), "\n")
			for(var/msg in messages_read)
				var/list/tempmsg = splittext(msg, ":::")
				if (tempmsg.len == 2)

					for (var/client/C in admins)
						if (R_MENTOR & C.holder.rights || R_MOD & C.holder.rights)
							C << "<span class='admin_channel'><IMG src='\ref[text_tag_icons.icon]' class='text_tag' iconstate='a-discord' alt='ASAY-Discord'> <span class='name'>[tempmsg[1]]</span>(Discord): <span class='message'>[tempmsg[2]]</span></span>"
					log_discord_asay(msg)
			fdel(G)
			G << ""

		var/H = file("SQL/discord2dm.txt")
		if (fexists(H))
			var/list/messages_read = splittext(file2text(H), "\n")
			for(var/msg in messages_read)
				var/list/tempmsg = splittext(msg, ":::")
				if (tempmsg.len == 3)
					var/temp_ckey = lowertext(tempmsg[2])
					temp_ckey = replacetext(temp_ckey," ", "")
					temp_ckey = replacetext(temp_ckey,"_", "")
					for(var/client/C in clients)
						if (C.ckey == temp_ckey)
							cmd_admin_pm_fromdiscord(C, tempmsg[3], tempmsg[1])
			fdel(H)
			H << ""

		var/I = file("SQL/discord2ban.txt")
		if (fexists(I))
			var/list/messages_read = splittext(file2text(I), "\n")
			for(var/msg in messages_read)
				var/list/tempmsg = splittext(msg, ":::")
				if (tempmsg.len == 4)
					var/temp_ckey = lowertext(tempmsg[2])
					temp_ckey = replacetext(temp_ckey," ", "")
					temp_ckey = replacetext(temp_ckey,"_", "")
					//ckey to ban, duration, ban reason, who banned
					if (quickBan_discord(temp_ckey, tempmsg[3], tempmsg[4], tempmsg[1]) == "successful.")
						discord_admin_ban(tempmsg[1],temp_ckey,tempmsg[3],tempmsg[4])
			fdel(I)
			I << ""
		var/J = file("SQL/discord2unban.txt")
		if (fexists(J))
			var/list/messages_read = splittext(file2text(J), "\n")
			for(var/msg in messages_read)
				var/list/tempmsg = splittext(msg, ":::")
				if (tempmsg.len == 2)
					var/temp_ckey = lowertext(tempmsg[2])
					temp_ckey = replacetext(temp_ckey," ", "")
					temp_ckey = replacetext(temp_ckey,"_", "")
					discord_admin_unban(tempmsg[1],temp_ckey)
			fdel(J)
			J << ""
		var/Z = file("SQL/discord2announce.txt")
		if (fexists(Z))
			var/list/messages_read = splittext(file2text(Z), "\n")
			for(var/msg in messages_read)
				var/list/tempmsg = msg
				var/dmsg = "<IMG src='\ref[text_tag_icons.icon]' class='text_tag' iconstate='ooc' alt='Discord'><b><font color='#b82e00'> Система: [tempmsg]</font></b>"
				world << dmsg
				log_discord(dmsg)
			fdel(Z)
		sleep (30)

/proc/start_serverswap_loop()
	spawn while (1)

		try

			// make sure processScheduler is running when the world starts up
			if (!processScheduler.isRunning)
				processScheduler.start()
				message_admins("The process scheduler has been started. There are [processes.get_num_processes()] active processes.")
				log_admin("processScheduler.start() was called at start_serverswap_loop().")

			// some sanity for the processScheduler
			if (processScheduler.last_process != -1 && world.time - processScheduler.last_process >= processScheduler.scheduler_sleep_interval*300)
				processScheduler.start()


			// make sure movementMachine is running when the world starts up
			if (!movementMachine)
				movementMachine = new
				movementMachine.start()
				message_admins("The movement scheduler has been started.")
				log_admin("movementMachine.start() was called at start_serverswap_loop().")

			// some sanity for the movementMachine
			if (movementMachine.last_run != -1 && world.time - movementMachine.last_run >= movementMachine.interval*300)
				movementMachine.start()

		catch(var/exception/e)
			log_debug("Exception in serverswap loop: [e.name]/[e.desc]")

		sleep(10)

/world/proc/on_tickrate_change()
	SStimer.reset_buckets()

/world/proc/change_fps(new_value = 20)
	if(new_value <= 0)
		CRASH("change_fps() called with [new_value] new_value.")
	if(fps == new_value)
		return //No change required.

	fps = new_value
	on_tickrate_change()