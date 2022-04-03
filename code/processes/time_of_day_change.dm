/process/time_of_day_change
	var/changeto = null
	var/admincaller = null
	var/announce = TRUE
	var/setup_lighting = FALSE
	var/times_of_day_ru = null

/process/time_of_day_change/setup()
	name = "time of day change process"
	schedule_interval = 1 SECONDS
	//start_delay = 0.5 SECONDS
	fires_at_gamestates = list() // this doesn't fire normally
	priority = PROCESS_PRIORITY_HIGH
	always_runs = TRUE
	processes.time_of_day_change = src

// only called in lighting_system.dm
/process/time_of_day_change/fire(var/special = FALSE)
	if (!special)
		return

	var/O_time_of_day = time_of_day
	time_of_day = changeto

	if (admincaller)
		admincaller << "<span class = 'notice'>Updated lights for [time_of_day].</span>"
		var/M = "[key_name(admincaller)] changed the time of day from [O_time_of_day] to [time_of_day]."
		log_admin(M)
		message_admins(M)

	if (!setup_lighting)
		for (var/lighting_overlay in lighting_overlay_list)
			var/atom/movable/lighting_overlay/LO = lighting_overlay
			if (LO.invisibility)
				LO.invisibility = 0
			CHECK_TICK
		setup_lighting = TRUE

	for (var/turf/T in turfs)
		if (T.z <= max_lighting_z())
			var/area/a = T.loc

			var/areacheck = TRUE
			if (map)
				for (var/area_type in map.areas_without_lighting)
					if (istype(a, area_type))
						areacheck = FALSE
						break

			if (a && a.dynamic_lighting && areacheck && (!map || !map.zlevels_without_lighting.Find(T.z)))
				T.adjust_lighting_overlay_to_daylight()

		// regardless of whether or not we use dynamic lighting here
		// we still need to change the TOD to prevent Vampire dusting
		for (var/atom/movable/lighting_overlay/LO in T.contents)
			LO.TOD = time_of_day

		CHECK_TICK

	switch(time_of_day)
		if ("Early Morning")
			times_of_day_ru = "восход"
		if ("Morning") //07-11
			times_of_day_ru = "утро"
		if ("Midday") //11-15
			times_of_day_ru = "день"
		if ("Afternoon") //15-19
			times_of_day_ru = "полдник"
		if ("Evening") //19-23
			times_of_day_ru = "вечер"
		if ("Night") //23-03
			times_of_day_ru = "ночь"

	if (announce)
		for (var/M in player_list)
			M << "<font size=3><span class = 'notice'>Наступает <b>[lowertext(capitalize(times_of_day_ru))]</b>.</span></font>"