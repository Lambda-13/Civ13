// Около рабочая (Ещё один Араб Даун Ру, который запускается только на локалке)
/obj/map_metadata/skinheads
	ID = MAP_SKINHEADS
	title = "Skinheads"
	lobby_icon = 'icons/lobby/skinheads.png'
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/jungle,/area/caribbean/no_mans_land/invisible_wall/jungle/one,/area/caribbean/no_mans_land/invisible_wall/inside/two)
	respawn_delay = 300
	no_winner ="Противостояние будет продолжаться."
	faction_organization = list(RUSSIAN)

	faction_organization = list(RUSSIAN, CIVILIAN)
	grace_wall_timer = 1200
	roundend_condition_sides = list(
		list(RUSSIAN) = /area/caribbean/roofed,
		list(CIVILIAN) = /area/caribbean/roofed/taiga
		)
	no_hardcore = TRUE
	age = "2003"

	ordinal_age = 8
	battle_name = "Черепа ведут к победе."
	mission_start_message = "<font size=4>Скинхеды готовятся устроить разбой на улицах Уральска. Милиция должна устранить радикальный <b>контингент</b> и обеспечить безопасность на улицах этого славного городка. Меньше скинхедов - больше зарплата.<br></font>"
	faction1 = RUSSIAN
	faction2 = CIVILIAN
	valid_weather_types = list(WEATHER_WET, WEATHER_NONE, WEATHER_EXTREME)
	songs = list(
		"Bad To The Bonehead - Prodolzhay Borby:1" = 'lambda/legasy/music/borby.ogg',)
	scores = list(
		"Милиция" = 0,
		"Скинхеды" = 0,
	)
	New()
		..()
		spawn(600)
			points_check()

/obj/map_metadata/skinheads/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_skinhead)
		. = TRUE
	else if (J.is_mvd)
		. = TRUE
	else
		. = FALSE

/obj/map_metadata/skinheads/cross_message(faction)
	return "<font size = 4>На улицах Уральска начинаются столкновения!</font>"

/obj/map_metadata/skinheads/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (istype(A, /area/caribbean/no_mans_land/invisible_wall))
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/inside/two))
			if (H.nationality != "Милиция")
				return TRUE
		else if (istype(A, /area/caribbean/no_mans_land/invisible_wall/jungle/one))
			if (H.nationality != "Скинхеды")
				return TRUE
		return !faction2_can_cross_blocks() && !faction1_can_cross_blocks()
	return FALSE

/obj/map_metadata/skinheads/proc/points_check()
	world << "<big><b>Количество убитых:</big></b>"
	world << "<big>Скинхеды: [scores["Скинхеды"]]</big>"
	world << "<big>Милиция: [scores["Милиция"]]</big>"
	spawn(300)
		points_check()

/obj/map_metadata/skinheads/update_win_condition()
	if (processes.ticker.playtime_elapsed > 4800)
		if (win_condition_spam_check)
			return FALSE
		if (!(scores["Скинхеды"] >= 30 || scores["Милиция"] >= 30))
			return TRUE
		ticker.finished = TRUE
		var/message = ""
		message = "The round has ended!"
		if (scores["Скинхеды"] > scores["Милиция"])
			message = "The battle is over! The <font color='yellow'><b>Yellowagwana</b></font> were victorious over the <b>Blugisi</b> tribe!"
			world << "<font size = 4><span class = 'notice'>[message]</span></font>"
			win_condition_spam_check = TRUE
			return FALSE
		else if (scores["Милиция"] > scores["Скинхеды"])
			message = "The battle is over! The <font color='blue'><b>Blugisi</b></font> were victorious over the <b>Yellowagwana</b> tribe!"
			world << "<font size = 4><span class = 'notice'>[message]</span></font>"
			win_condition_spam_check = TRUE
			return FALSE
		else
			message = "The battle has ended in a <b>stalemate</b>!"
			world << "<font size = 4><span class = 'notice'>[message]</span></font>"
			win_condition_spam_check = TRUE
			return FALSE
		last_win_condition = win_condition.hash
		return TRUE
	return TRUE
