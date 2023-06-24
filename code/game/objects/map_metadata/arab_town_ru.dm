/obj/map_metadata/arab_town_ru
	ID = MAP_ARAB_TOWN_RU
	title = "Battle for Palmira"
	no_winner = "The chapel is still under the ISIS's control."
	lobby_icon = "icons/lobby/arab_town_ru.png"
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall, /area/caribbean/no_mans_land/invisible_wall/one, /area/caribbean/no_mans_land/invisible_wall/two)
	respawn_delay = 0
	victory_time = 21000
	no_hardcore = TRUE

	faction_organization = list(
		RUSSIAN,
		CIVILIAN,
		ARAB)

	roundend_condition_sides = list(
		list(RUSSIAN, CIVILIAN) = /area/caribbean/british,
		list(ARAB) = /area/caribbean/no_mans_land/capturable/one,
		)
	age = "2016"
	ordinal_age = 8
	faction_distribution_coeffs = list(RUSSIAN = 0.5, ARAB = 0.5)
	mission_start_message = "<font size=4>У всех сторон <b>5 minutes</b> перед началом битвы!<br><font color = 'red'>Российская Федерация</font> и <font color = 'green'>Правительство Сирии</font> победят, если возьмут под контроль Церковь Пальмиры. <br>The <b><font color = 'black'>Исламское Государство</font></b> победит, если сможет удержать контроль над Церковью</b>!</font>"
	faction1 = RUSSIAN
	faction2 = ARAB
	valid_weather_types = list(WEATHER_NONE, WEATHER_WET)
	songs = list(
		"Summer and crossbows - Akim Apachev:1" = 'lambda/legasy/jobs/wagners.ogg',)
	gamemode = "Siege"
	artillery_count = 0
	grace_wall_timer = 3000

/obj/map_metadata/arab_town_ru/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_syriawar)
		if (J.is_syriawar || J.is_syriawar || J.is_syriawar)
			. = TRUE
		if (J.title == "Syrian Commander")
			. = FALSE
		if (J.title == "ISIS Palmira Leader")
			J.max_positions = 10
			J.total_positions = 10
	else
		. = FALSE

/obj/map_metadata/arab_town_ru/short_win_time(faction)
	if (!(alive_n_of_side(faction1)) || !(alive_n_of_side(faction2)))
		return 600
	else
		return 3000 // 5 minutes

/obj/map_metadata/arab_town_ru/long_win_time(faction)
	if (!(alive_n_of_side(faction1)) || !(alive_n_of_side(faction2)))
		return 600
	else
		return 3000 // 5 minutes

/obj/map_metadata/arab_town_ru/roundend_condition_def2name(define)
	..()
	switch (define)
		if (RUSSIAN)
			return "Russian Federation"
		if (ARAB)
			return "ISIS"
/obj/map_metadata/arab_town_ru/roundend_condition_def2army(define)
	..()
	switch (define)
		if (RUSSIAN)
			return "Russian Federation"
		if (ARAB)
			return "ISIS"
		if (CIVILIAN)
			return "Syrian Armed Forces"

/obj/map_metadata/arab_town_ru/army2name(army)
	..()
	switch (army)
		if ("Russian Federation")
			return "Russian Federation"
		if ("ISIS")
			return "ISIS"
		if ("Syrian Armed Forces")
			return "Syrian Armed Forces"

/obj/map_metadata/arab_town_ru/cross_message(faction)
	if (faction == ARAB)
		return "<font size = 4>The <font color = 'red'>Российская Федерация, ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font> могут начинать штурм!</font>"
	else if (faction == RUSSIAN || faction == CIVILIAN)
		return "<font size = 4>The <font color = 'red'>Российская Федерация и ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font> могут начинать штурм!</font>"

/obj/map_metadata/arab_town_ru/reverse_cross_message(faction)
	if (faction == ARAB)
		return "<span class = 'userdanger'>The <font color = 'red'>Российская Федерация и ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font>  больше не могут идти на штурм!</span>"
	else if (faction == RUSSIAN)
		return ""
	else
		return ""

/obj/map_metadata/arab_town_ru/update_win_condition()
	if (world.time >= victory_time)
		if (win_condition_spam_check)
			return FALSE
		ticker.finished = TRUE
		var/message = "<font color = 'red'>Общие Силы Армий</font> и <font color = 'green'> взяли под контроль Церковь Пальмиры! Исламское Государство будет уничтожено в Пальмире!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		show_global_battle_report(null)
		win_condition_spam_check = TRUE
		return FALSE
	if ((current_winner && current_loser && world.time > next_win) && no_loop_o == FALSE)
		ticker.finished = TRUE
		var/message = "<font color = 'black'>ИГИЛ</font> успешно отстоял Пальмиру! Российская Федерация, ЧВК Вагнер и Правительство Сирии потерпели поражение! Они отступают!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		show_global_battle_report(null)
		win_condition_spam_check = TRUE
		no_loop_o = TRUE
		return FALSE
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "<font color = 'red'>Российская Федерация, ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font> взяли под контроль Церковь! Церковь будет под контролем в течении {time} минут."
				next_win = world.time + short_win_time(RUSSIAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "<font color = 'red'>Российская Федерация, ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font> взяли под контроль Церковь! Церковь будет под контролем в течении {time} минут."
				next_win = world.time + short_win_time(RUSSIAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "<font color = 'red'>Российская Федерация, ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font> взяли под контроль Церковь! Церковь будет под контролем в течении {time} минут."
				next_win = world.time + short_win_time(RUSSIAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "<font color = 'red'>Российская Федерация, ЧВК Вагнер</font>, а также <font color = 'green'>Правительство Сирии</font> взяли под контроль Церковь! Церковь будет под контролем в течении {time} минут."
				next_win = world.time + short_win_time(RUSSIAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	else
		if (current_win_condition != no_winner && current_winner && current_loser)
			world << "<font size = 3>The <font color = 'black'>ИГИЛ</font> перехватил контроль за Церковью!</font>"
			current_winner = null
			current_loser = null
		next_win = -1
		current_win_condition = no_winner
		win_condition.hash = 0
	last_win_condition = win_condition.hash
	return TRUE

/obj/map_metadata/arab_town_ru/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (istype(A, /area/caribbean/no_mans_land/invisible_wall))
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/one))
			if (H.faction_text == faction2)
				return TRUE
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/two))
			if (H.faction_text == faction1 || H.faction_text == CIVILIAN)
				return TRUE
		else
			return !faction1_can_cross_blocks()
			return !faction2_can_cross_blocks()
	return FALSE