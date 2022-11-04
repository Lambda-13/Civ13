/obj/structure/betting_box
	name = "ставочный ящик"
	desc = "Ящик для ставок."
	icon = 'icons/obj/storage.dmi'
	icon_state = "bet_box"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	var/odd = 2.0 //not used yet
	var/list/storedvalues = list()
	var/list/payvalues = list()
	var/bettingon = "none"
	var/lastodd = 2.0
	var/moneyname = "rubles"
	var/match_running = FALSE
/obj/structure/betting_box/red
	name = "красный ставочный ящик"
	icon_state = "bet_box_red"
	desc = "Ящик для ставок на красных."
	bettingon = "red"

/obj/structure/betting_box/blue
	name = "синий ставочный ящик"
	icon_state = "bet_box_blue"
	desc = "Ящик для ставок на синих."
	bettingon = "blue"

/obj/structure/betting_box/examine(mob/user)
	..()
	user << "<b>Тут всего [process_totals()] [moneyname] внутри.</b>"

/obj/structure/betting_box/proc/clear_bets()
	odd = 2.0
	storedvalues = list()
	return

/obj/structure/betting_box/proc/process_results(var/result = "none")
	if (result != "none" && result == bettingon)
		var/tmptotal = process_totals()
		var/totalreceived = transfer(result)
		for (var/i in storedvalues)
			var/pctg = i[2]/tmptotal
			i[2] += totalreceived*pctg
		payvalues = storedvalues
		lastodd = (totalreceived/tmptotal)+1
		clear_bets()
		return
	else
		clear_bets()
		return
/obj/structure/betting_box/proc/process_totals()
	if (!storedvalues.len)
		return 0
	var/tmptotal = 0
	for (var/i in storedvalues)
		tmptotal += i[2]
	return tmptotal

/obj/structure/betting_box/proc/transfer(var/result = "none")
	var/tmptotal_transfer = 0
	for(var/obj/structure/betting_box/BB in range(5,src))
		if (result != "none" && result == bettingon)
			tmptotal_transfer = BB.process_totals()
	return tmptotal_transfer

/obj/structure/betting_box/attack_hand(var/mob/living/human/H)
	if (!ishuman(H))
		return
	for(var/i in payvalues)
		if (i[1] == H && i[2]>0)
			var/obj/item/stack/money/rubles/RB = new /obj/item/stack/money/rubles(H)
			RB.amount = i[2]
			H.put_in_active_hand(RB)
			i[2]=0
			H << "Закидываю [RB] рублей."
			return
/obj/structure/betting_box/attackby(var/obj/item/I,var/mob/living/human/H)
	if (!istype(I, /obj/item/stack/money))
		return
	else if (match_running)
		return
	else
		var/obj/item/stack/money/M = I
		var/done = FALSE
		for(var/i in storedvalues)
			if (i[1] == H)
				i[2] += M.amount*M.value
				qdel(I)
				done = TRUE
				return
		if (!done)
			var/list/tlist = list(H, M.amount*M.value)
			storedvalues += list(tlist)
			qdel(I)
			return
	..()

////////////////////////////////////////////////////////////////
/obj/effect/bet_processor
	name = "bet processor"
	desc = "processes boxing matches in this area."
	icon = 'icons/mob/screen/effects.dmi'
	icon_state = "x"
	invisibility = 101
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	var/match_running = FALSE
	var/area/curr_area = null
	var/mob/living/human/red_player = null
	var/mob/living/human/blue_player = null

/obj/effect/bet_processor/New()
	..()
	curr_area = get_area(loc)
	process_combats()

/obj/effect/bet_processor/proc/process_combats()
	if (!match_running)
		var/found = 0
		var/found_players = 0
		red_player = null
		blue_player = null
		for(var/mob/living/human/H in curr_area)
			found++
			if (istype(H.w_uniform, /obj/item/clothing/under/blue_shorts))
				found_players++
				blue_player = H
			if (istype(H.w_uniform, /obj/item/clothing/under/red_shorts))
				found_players++
				red_player = H

		if (found == 2 && found_players == 2)
			match_running = TRUE
			start_match()
		else
			spawn(10)
				process_combats()
	else
		return

/obj/effect/bet_processor/proc/start_match()
	blue_player.visible_message("<big>Бой между [red_player.real_name] (красный) и [blue_player.real_name] (синий) начинается!</big>")
	for (var/obj/structure/betting_box/BB in range(5,src))
		BB.match_running = TRUE
	if (istype(map, /obj/map_metadata/gulag13))
		var/obj/map_metadata/gulag13/G = map
		G.gracedown1 = FALSE
		playsound(red_player, 'lambda/sanecman/sound/quake_3/feedback/fight.ogg', 50, TRUE)
		playsound(blue_player, 'lambda/sanecman/sound/quake_3/feedback/fight.ogg', 50, TRUE)
	process_match()
	return

/obj/effect/bet_processor/proc/process_match()
	if (match_running)
		for(var/mob/living/human/H in curr_area)
			if (H.stat != CONSCIOUS || H.surrendered)
				if (H == red_player)
					H.visible_message("<big>The <font color='blue'>Синий боец</font> ([blue_player.real_name]) побеждает!</big>")
					playsound(blue_player, 'lambda/sanecman/sound/quake_3/player/announce/youwin.ogg', 50, TRUE)
					match_running = FALSE
					for (var/obj/structure/betting_box/BB in range(5,src))
						BB.match_running = FALSE
						BB.process_results("blue")
					if (istype(map, /obj/map_metadata/gulag13))
						var/obj/map_metadata/gulag13/G = map
						G.gracedown1 = TRUE
					return
				else if (H == blue_player)
					H.visible_message("<big>The <font color='red'>Красный боец</font> ([red_player.real_name]) побеждает!</big>")
					playsound(red_player, 'lambda/sanecman/sound/quake_3/player/announce/youwin.ogg', 50, TRUE)
					match_running = FALSE
					for (var/obj/structure/betting_box/BB in range(5,src))
						BB.match_running = FALSE
						BB.process_results("red")
					if (istype(map, /obj/map_metadata/gulag13))
						var/obj/map_metadata/gulag13/G = map
						G.gracedown1 = TRUE
					return
		spawn(10)
			process_match()
	else
		return