/obj/map_metadata/pervomaisk_crossing
	ID = MAP_PERVOMAISK_CROSSING
	title = "Первомайск"
	lobby_icon = "pervomaisk.png"
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/jungle,/area/caribbean/no_mans_land/invisible_wall,/area/caribbean/no_mans_land/invisible_wall/one,/area/caribbean/no_mans_land/invisible_wall/two,/area/caribbean/no_mans_land/invisible_wall/inside)
	respawn_delay = 300


	faction_organization = list(
		CIVILIAN,
		RUSSIAN)

	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/japanese/land/inside/command,
		list(RUSSIAN) = /area/caribbean/russian/land/inside/command
		)
	age = "2022"
	ordinal_age = 8
	faction_distribution_coeffs = list(CIVILIAN = 0.5, RUSSIAN = 0.5)
	battle_name = "Битва за Первомайськ"
	mission_start_message = "<font size=4>The <b>Українські війська</b> захищають Первомайськ від <b>Російських окупантів</b> <br> Обидва боки мають <b>5 хвилин</b> для підготовки.</font>"
	faction1 = CIVILIAN
	faction2 = RUSSIAN
	valid_weather_types = list(WEATHER_WET, WEATHER_NONE, WEATHER_EXTREME)
	songs = list(
		"Korobeiniki - Leonid Smetannikov:1" = 'lambda/sanecman/sound/pizdec/korobeiniki.ogg',) //troll
	artillery_count = 0

/obj/map_metadata/pervomaisk_crossing/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_ukrainerussowar == TRUE)
		. = TRUE
	else
		. = FALSE

/obj/map_metadata/pervomaisk_crossing/cross_message(faction)
	return "<font size = 4>Вперед, солдати! Захищайте батьківщину!</font>"

/obj/map_metadata/pervomaisk_crossing/roundend_condition_def2name(define)
	..()
	switch (define)
		if (CIVILIAN)
			return "Ukrainian Forces"
		if (RUSSIAN)
			return "Russian Federal Forces"
/obj/map_metadata/pervomaisk_crossing/roundend_condition_def2army(define)
	..()
	switch (define)
		if (CIVILIAN)
			return "Ukrainian Forces"
		if (RUSSIAN)
			return "Russian Federal Forces"

/obj/map_metadata/pervomaisk_crossing/army2name(army)
	..()
	switch (army)
		if ("Ukrainian Forces")
			return "Ukrainian"
		if ("Russians")
			return "Russian Federation"


/obj/map_metadata/pervomaisk_crossing/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3000 || admin_ended_all_grace_periods)

/obj/map_metadata/pervomaisk_crossing/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3000 || admin_ended_all_grace_periods)

/obj/map_metadata/pervomaisk_crossing/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (istype(A, /area/caribbean/no_mans_land/invisible_wall))
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/inside))
			if (H.faction_text == faction1)
				return TRUE
		else if (istype(A, /area/caribbean/no_mans_land/invisible_wall/one))
			if (H.faction_text == faction2)
				return TRUE
		else
			return !faction1_can_cross_blocks()
	return FALSE