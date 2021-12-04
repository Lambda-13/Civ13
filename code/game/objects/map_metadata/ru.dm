//Тут метаданные русских карт//
/obj/map_metadata/lobby
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
	civilizations = TRUE
	faction_distribution_coeffs = list(CIVILIAN = 1)
	battle_name = "PvE"
	mission_start_message = "<big>10/17/1997</big><br>The Earth is hungry. Its heart throbs and demands cleansing. <b>The Earth is also thirsty.</b>"
	ambience = list('sound/ambience/desert.ogg')
	faction1 = CIVILIAN
	availablefactions = list("Nomad")
	songs = list(
		"Untitled 2:1" = 'sound/music/untitled_2.ogg',)
	research_active = TRUE
	nomads = TRUE
	gamemode = "Postal - Nomads"
	ordinal_age = 8
	default_research = 230
	research_active = FALSE
	age1_done = TRUE
	age2_done = TRUE
	age3_done = TRUE
	age4_done = TRUE
	age5_done = TRUE
	age6_done = TRUE
	age7_done = TRUE
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
		. = FALSE

