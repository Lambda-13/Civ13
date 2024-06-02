/*
obj/map_metadata/camp_blugo
	ID = MAP_CAMP_BLUGO
	title = "Blugoslavia Camp"
	lobby_icon = 'icons/lobby/campaign.png'
	no_winner ="The round is proceeding normally."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 7200 // 12 minutes!
	has_hunger = TRUE

	faction_organization = list(
		CIVILIAN)
	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/british)
	age = "2024"
	ordinal_age = 9
	faction_distribution_coeffs = list(CIVILIAN = 0.4)
	battle_name = "camp"
	mission_start_message = "<big>Blugoslavs</b> activated! The <b>Blugoslavs</b> must build their villages. The gracewall will be up after 25 minutes.</big><br><span class = 'notice'><i>THIS IS A RP MAP - NATIVES AND COLONISTS ARE FRIENDLY BY DEFAULT.</b> No griefing will be tolerated. If you break the rules, you will be banned from this gamemode!<i></span>" // to be replaced with the round's main event
	ambience = list('sound/ambience/jungle1.ogg')
	faction1 = INDIANS
	faction2 = CIVILIAN
	songs = list(
		"Nassau Shores:1" = 'sound/music/nassau_shores.ogg',)
	gamemode = "Training polygon"
	is_RP = TRUE
	grace_wall_timer = 15000

/obj/map_metadata/camp_blugo/New()
	..()
	spawn(600)
		seasons()

obj/map_metadata/camp_blugo/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (J.is_bluga == TRUE)
		. = TRUE
	else
		. = FALSE

/obj/map_metadata/camp_blugo/cross_message(faction)
	return ""

/obj/map_metadata/camp_blugo/continental/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 15000 || admin_ended_all_grace_periods)

/obj/map_metadata/camp_blugo/continental/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 15000 || admin_ended_all_grace_periods)
*/