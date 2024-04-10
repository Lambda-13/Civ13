/obj/map_metadata/bay_of_pigs
	ID = MAP_BAY_OF_PIGS
	title = "Bay of Pigs"
	lobby_icon = 'icons/lobby/coldwar.png'
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/jungle/one,/area/caribbean/no_mans_land/invisible_wall/one)
	respawn_delay = 1200
	no_winner ="The bay is under control of Cuba."
	faction_organization = list(
		SPANISH,
		AMERICAN)
	roundend_condition_sides = list(
		list(SPANISH) = /area/caribbean/no_mans_land/capturable/one,
		list(AMERICAN) = /area/caribbean/british,
		)
	age = "1961"
	ordinal_age = 6
	faction_distribution_coeffs = list(SPANISH = 0.5, AMERICAN = 0.5)
	battle_name = "The Bay of Pigs Invasion"
	mission_start_message = "<font size=4>У вас есть <b>5 минут</b> для подготовки перед началом боя!<br>Кубинцы победят, если будут контролировать залив в течении <b>40 минут</b>. Американцы победят, если захватят главное здание у залива!</font>"
	faction1 = SPANISH
	faction2 = AMERICAN
	valid_weather_types = list(WEATHER_NONE, WEATHER_WET)
	songs = list(
		"Status Quo - In The Army Now:1" = 'sound/music/in_army.ogg')
	gamemode = "Siege"
	grace_wall_timer = 3000

/obj/map_metadata/bay_of_pigs/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_pigsbay == TRUE)
		. = TRUE
	else
		. = FALSE

/obj/map_metadata/bay_of_pigs/roundend_condition_def2name(define)
	..()
	switch (define)
		if (SPANISH)
			return "Cuban"
		if (AMERICAN)
			return "American"

/obj/map_metadata/bay_of_pigs/roundend_condition_def2army(define)
	..()
	switch (define)
		if (SPANISH)
			return "Cubans"
		if (AMERICAN)
			return "Americans"

/obj/map_metadata/bay_of_pigs/army2name(army)
	..()
	switch (army)
		if ("Cubans")
			return "Cuban"
		if ("Americans")
			return "American"


/obj/map_metadata/bay_of_pigs/cross_message(faction)
	if (faction == AMERICAN)
		return "<font size = 4>ВТОРЖЕНИЕ В ЗАЛИВ СВИНЕЙ НАЧИНАЕТСЯ!</font>"
	else if (faction == SPANISH)
		return ""
	else
		return ""

/obj/map_metadata/bay_of_pigs/reverse_cross_message(faction)
	if (faction == AMERICAN)
		return "<font size = 4>ВТОРЖЕНИЕ В ЗАЛИВ СВИНЕЙ НАЧИНАЕТСЯ!</font>"
	else if (faction == SPANISH)
		return ""
	else
		return ""

/obj/map_metadata/bay_of_pigs/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (istype(A, /area/caribbean/no_mans_land/invisible_wall/jungle/one))
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/one))
			if (H.faction_text == faction1)
				return TRUE
		else
			return !faction1_can_cross_blocks()
			return !faction2_can_cross_blocks()
	return FALSE

/obj/map_metadata/bay_of_pigs/update_win_condition()
	if (world.time >= 24000)
		if (win_condition_spam_check)
			return FALSE
		ticker.finished = TRUE
		var/message = "The <b>Кубинцы</b> успешно удержали залив! Американцы сворачивают операцию!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		show_global_battle_report(null)
		win_condition_spam_check = TRUE
		return FALSE
	if ((current_winner && current_loser && world.time > next_win) && no_loop_r == FALSE) //Needs to be looked into to prevent the bug of Germans "winning" by getting wiped and not respawning after 10 seconds.
		ticker.finished = TRUE
		var/message = "The <b>Американцы</b> захватили залив! Операция прошла успешно!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		show_global_battle_report(null)
		win_condition_spam_check = TRUE
		no_loop_r = TRUE
		return FALSE

	// cuban major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The <b>Американцы</b> достигли главного здания! Они захватят его в течении {time} минут."
				next_win = world.time + short_win_time(GERMAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	// cuban major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The <b>Американцы</b> достигли главного здания! Они захватят его в течении {time} минут."
				next_win = world.time + short_win_time(GERMAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	// american major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The <b>Американцы</b> достигли главного здания! Они захватят его в течении {time} минут."
				next_win = world.time + short_win_time(GERMAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	// american major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The <b>Американцы</b> достигли главного здания! Они захватят его в течении {time} минут."
				next_win = world.time + short_win_time(GERMAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	else
		if (current_win_condition != no_winner && current_winner && current_loser)
			world << "<font size = 3>The <b>Кубинцы</b> вернули под своё крыло главное здание!</font>"
			current_winner = null
			current_loser = null
		next_win = -1
		current_win_condition = no_winner
		win_condition.hash = 0
	last_win_condition = win_condition.hash
	return TRUE