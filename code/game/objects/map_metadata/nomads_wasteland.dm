
/obj/map_metadata/nomads_wasteland
	ID = MAP_NOMADS_WASTELAND
	title = "Wasteland"
	lobby_icon = "icons/lobby/civ13.gif"
	no_winner ="The round is proceeding normally."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 6000 // 10 minutes!
	has_hunger = TRUE

	faction_organization = list(
		CIVILIAN,)

	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/british
		)
	age = "2013"
	civilizations = TRUE
	var/tribes_nr = 1
	faction_distribution_coeffs = list(CIVILIAN = 1)
	battle_name = "the civilizations"
	mission_start_message = "<big>The world is on the verge of nuclear war... The nukes will drop in 2 to 3:30 hours. Then the world will become a wasteland. Can you survive?</big><br><b>Wiki Guide: https://civ13.github.io/civ13-wiki/Civilizations_and_Nomads</b>"
	ambience = list('sound/ambience/desert.ogg')
	faction1 = CIVILIAN
	availablefactions = list("Nomad")
	songs = list(
		"Words Through the Sky:1" = "sound/music/words_through_the_sky.ogg",)
	research_active = TRUE
	nomads = TRUE
	gamemode = "Nuclear Wasteland"
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
	age8_done = TRUE
	nonukes = FALSE

/obj/map_metadata/nomads_wasteland/New()
	..()
	spawn(18000)
		seasons()
		var/randtimer = rand(72000,108000)
		if (!nonukes)
			nuke_proc(randtimer)
			supplydrop_proc()
		else
			supplydrop_proc()

/obj/map_metadata/nomads_wasteland/cross_message(faction)
	return ""

/obj/map_metadata/nomads_wasteland/proc/nuke_proc(var/timer=72000)
	if (processes.ticker.playtime_elapsed > timer && !nonukes)
		var/vx = rand(25,world.maxx-25)
		var/vy = rand(25,world.maxy-25)
		var/turf/epicenter = get_turf(locate(vx,vy,2))
		world << "<font size=3 color='red'><center>ATTENTION<br>A nuclear missile is incoming! Take cover!</center></font>"
		var/warning_sound = sound('sound/misc/siren.ogg', repeat = FALSE, wait = TRUE, channel = 777)
		for (var/mob/M in player_list)
			M.client << warning_sound
		spawn(330)
			world << "<font size=3 color='red'>A nuclear explosion has happened! <br><i>(Game might freeze/lag for a while while processing, please wait)</i></font>"
			nuke_map(epicenter, 200, 180, 0)
			message_admins("Automatic nuke deployed at ([epicenter.x],[epicenter.y],[epicenter.z]) in area [epicenter.loc.name].")
			log_game("Automatic nuke deployed at ([epicenter.x],[epicenter.y],[epicenter.z]) in area [epicenter.loc.name].")
			return
	else
		spawn(600)
			nuke_proc(timer)
	return
/obj/map_metadata/nomads_wasteland/proc/supplydrop_proc()
	if ((world_radiation >= 280 && !nonukes)||is_zombie == TRUE)
		var/droptype = pick("supplies","food","weapons","military","medicine","rad","cold")
		var/turf/locationt = pick(supplydrop_turfs)
		switch(droptype)
			if("supplies")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Supplies have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/supplies(locationt)

			if("food")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Food and water have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/food(locationt)
				new/obj/item/weapon/reagent_containers/glass/barrel/modern/water(locationt)

			if("weapons")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Weapons and ammunition have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/weapons(locationt)

			if("military")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>military equipment has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/military(locationt)

			if("medicine")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Medicine has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/medicine(locationt)

			if("rad")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Radiation equipment has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/rads(locationt)

			if("cold")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Cold weather equipment has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/cold(locationt)

	spawn(rand(36000, 72000))
		supplydrop_proc()

/obj/map_metadata/nomads_wasteland/job_enabled_specialcheck(var/datum/job/J)
	if (J.is_nomad == TRUE)
		. = TRUE
	else
		. = FALSE


//////////////////////////////////
////////Wasteland 2///////////////

/obj/map_metadata/nomads_wasteland/two
	ID = MAP_NOMADS_WASTELAND_2
	title = "Wasteland II"
	gamemode = "Wasteland"
	nonukes = TRUE
	is_zombie = TRUE
	mission_start_message = "<big>Something has gone terribly wrong. Monsters roam the world, and society has fallen. Can you survive?</big><br><b>Wiki Guide: https://civ13.github.io/civ13-wiki/Civilizations_and_Nomads</b>"
	ambience = list('sound/ambience/desert.ogg')

/obj/map_metadata/nomads_wasteland/two/proc/zombies(var/start = TRUE)
	for(var/obj/effect/spawner/mobspawner/zombies/special/S in world)

/*/obj/map_metadata/nomads_wasteland/two/ru //чутка сломалось
	ID = MAP_NOMADS_WASTELAND_RU
	title = "Wasteland RU"
	gamemode = "Russian Wasteland"
	is_zombie = TRUE
	mission_start_message = "<big>Миру давно пришёл конец, сможете ли вы построить новую цивилизацию на остатках прошлых лет?</big><br><b>Вики https://civ13.github.io/civ13-wiki/Civilizations_and_Nomads</b>"
	ambience = list('sound/ambience/desert.ogg')*/

//Отдельная карта от вастеланда имеющая код вастеланда
//
//
//
/*/obj/map_metadata/nomads_scarlet_plague //сломалось
	ID = MAP_NOMADS_WASTELAND_SCARLET_PLAGUE
	title = "Scarlet Plague (Nomads)"
//	lobby_icon_state = "scarlet_plague"
	lobby_icon_state = "civ13"
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 6000 // 10 minutes!
	has_hunger = TRUE
	no_winner = "The round is proceeding normally."

	faction_organization = list(
		CIVILIAN,)

	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/british
		)
	age = "3021 A.D."
	civilizations = TRUE
	var/tribes_nr = 1
	faction_distribution_coeffs = list(CIVILIAN = 1)
//	battle_name = "the civilizations"
	battle_name = "Fallen Future"
	mission_start_message = "<big>Мир поглотила чума, что уничтожила цивилизацию и превратила расцветающий мир в руины...</b>"
	ambience = list(
		'sound/ambience/scarlet_plague/desert.ogg',
		'sound/ambience/scarlet_plague/ambigen19.ogg',
		'sound/ambience/scarlet_plague/ambigen22.ogg',
		'sound/ambience/scarlet_plague/ambigen23.ogg',
		'sound/ambience/scarlet_plague/ambigen24.ogg',,
		'sound/ambience/scarlet_plague/ambigen3.ogg',
		'sound/ambience/scarlet_plague/ambigen4.ogg',
		'sound/ambience/scarlet_plague/ambigen5.ogg',
		'sound/ambience/scarlet_plague/Cave4.ogg',,
		'sound/ambience/scarlet_plague/caves3.ogg',
		'sound/ambience/scarlet_plague/cave_ambient2.ogg',
		)
	faction1 = CIVILIAN
	availablefactions = list("Nomad")
	songs = list(
		"Ravenheart Fortress:1" = 'sound/music/menu5.ogg',
		"Wurmigstein Prison:2" = 'sound/music/wanderlust.ogg',)
	research_active = TRUE
	nomads = TRUE
	gamemode = "Classic (Stone Age Start)"
	var/list/arealist_r = list()
	var/list/arealist_g = list()
/obj/map_metadata/nomads_scarlet_plague/New()
	..()
	spawn(2500)
		for (var/i = 1, i <= 65, i++)
			var/turf/areaspawn = safepick(get_area_turfs(/area/caribbean/sea/sea))
			new/obj/structure/fish(areaspawn)
	spawn(2500)
		for (var/i = 1, i <= 30, i++)
			var/turf/areaspawn = safepick(get_area_turfs(/area/caribbean/nomads/forest/Jungle/river))
			new/obj/structure/piranha(areaspawn)
	spawn(18000)
		seasons()

/obj/map_metadata/nomads_scarlet_plague/faction2_can_cross_blocks()
	return (ordinal_age >= 2)

/obj/map_metadata/nomads_scarlet_plague/faction1_can_cross_blocks()
	return (ordinal_age >= 2)

/obj/map_metadata/nomads_scarlet_plague/cross_message(faction)
	if (faction == CIVILIAN)
		return "<big><b>As the world technological level advances, new shipbuilding techniques make us at last be able to navigate the oceans...</b></big>"


/obj/map_metadata/nomads_scarlet_plague/job_enabled_specialcheck(var/datum/job/J)
	if (J.is_nomad == TRUE)
		. = TRUE
	else
		. = FALSE*/