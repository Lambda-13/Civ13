//Тут метаданные русских карт//

/*/obj/map_metadata/lobby //сломалось
	ID = MAP_LOBBY
	title = "Home"
	lobby_icon = 'icons/_LOBBYHM.dmi'
	lobby_icon_state = "hm"
	no_winner ="The round is proceeding normally."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 10
	has_hunger = TRUE

	faction_organization = list(
		CIVILIAN,)

	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/british
		)
	age = "10/17/1997"
	ordinal_age = 7
	faction_distribution_coeffs = list(CIVILIAN = 1)
	battle_name = "PvPvE"
	mission_start_message = "<big>10/17/1997</big><br>The Earth is hungry. Its heart throbs and demands cleansing. <b>The Earth is also thirsty.</b>"
	ambience = list('sound/ambience/desert.ogg')
	faction1 = CIVILIAN
	songs = list(
		"Untitled 2:1" = 'sound/music/untitled_2.ogg',)
	gamemode = "Postal - Nomads"
	is_singlefaction = TRUE
	force_mapgen = TRUE
	is_RP = TRUE

/obj/map_metadata/lobby/New()
	..()
	spawn(18000)
		seasons()

/obj/map_metadata/lobby/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 0 || admin_ended_all_grace_periods)

/obj/map_metadata/lobby/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 0 || admin_ended_all_grace_periods)

/obj/map_metadata/lobby/cross_message(faction)
	return ""

/obj/map_metadata/lobby/job_enabled_specialcheck(var/datum/job/J)
	if (J.is_lobby == TRUE)
		. = TRUE
	else
		. = FALSE*/

//Чёт на 9 мая
/obj/map_metadata/codmwww3
	ID = MAP_COD_MW_WW3
	title = "Dust to Dust"
	lobby_icon = 'icons/_LOBBYRUS.dmi'
	lobby_icon = "cod.png"
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
	battle_name = "Invasion of the US Eastern Coast"
	mission_start_message = "<font size=4>The <b>Українські війська</b> захищають Первомайськ від <b>Російських окупантів</b> <br> Обидва боки мають <b>5 хвилин</b> для підготовки.</font>"
	faction1 = CIVILIAN
	faction2 = RUSSIAN
	valid_weather_types = list(WEATHER_WET, WEATHER_NONE, WEATHER_EXTREME)
	songs = list(
		"Korobeiniki - Leonid Smetannikov:1" = 'sound/pizdec/korobeiniki.ogg',) //troll
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








/*/obj/map_metadata/colony/lfwb
	ID = MAP_LFWB
	title = "Аscension"
	lobby_icon = "lfwb.png"
	no_winner ="Ещё один день миновал..."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 18000 // 30 minutes!
	has_hunger = TRUE

	faction_organization = list(
		CIVILIAN,
		INDIANS,
		PIRATES,
		SPANISH)
	roundend_condition_sides = list(
		list(INDIANS) = /area/caribbean/british,
		list(CIVILIAN) = /area/caribbean/british,
		list(PIRATES) = /area/caribbean/british,
		list(SPANISH) = /area/caribbean/british,
		)
	age = "1713"
	ordinal_age = 3
	faction_distribution_coeffs = list(INDIANS = 0.4, CIVILIAN = 0.4, PIRATE = 0.1, SPANISH = 0.1)
	battle_name = "lifeweb simulator"
	mission_start_message = ""
	ambience = list('sound/ambience/jungle1.ogg')
	faction1 = INDIANS
	faction2 = CIVILIAN
	songs = list(
		"Nassau Shores:1" = "sound/music/nassau_shores.ogg",)
	gamemode = "Secret"
	is_RP = TRUE

/obj/map_metadata/colony/New()
	..()
	spawn(18000)
		seasons()

obj/map_metadata/colony/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_1713 == TRUE)
		. = TRUE
	else
		. = FALSE

/obj/map_metadata/colony/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3000 || admin_ended_all_grace_periods)

/obj/map_metadata/colony/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3000 || admin_ended_all_grace_periods)

/obj/map_metadata/colony/cross_message(faction)
	return ""

/obj/map_metadata/testshit
	ID = MAP_TEST_RU
	title = "null"
	lobby_icon = "icons/lobby/core.png"
	no_winner ="Всё?"
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 7200 // 12 minutes!
	has_hunger = TRUE

	faction_organization = list(
		GERMAN)

	roundend_condition_sides = list(
		list(GERMAN) = /area/caribbean/british,
		)
	age = "2022"
	ordinal_age = 8
	faction_distribution_coeffs = list( GERMAN = 1)
	battle_name = "test map"
	mission_start_message = "Если вы бы знали насколько я от пизды сделал эту карту."
	ambience = list('sound/ambience/jungle1.ogg')
	faction1 = CIVILIAN
	songs = list(
		"Core:1" = "sound/music/test/core.ogg",
		)
	gamemode = "null"
	is_singlefaction = TRUE
	force_mapgen = TRUE
	is_RP = TRUE
/obj/map_metadata/testshit/New()
	..()
	spawn(18000)
		seasons()

/obj/map_metadata/testshit/job_enabled_specialcheck(var/datum/job/J)
	..()
	if ((istype(J, /datum/job/german)) && (J.is_medieval == TRUE) && (J.is_rp == TRUE))
		. = TRUE
	else
		. = FALSE*/