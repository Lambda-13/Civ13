/obj/structure/turret
	not_movable = TRUE
	anchored = TRUE
	density = TRUE
	layer = MOB_LAYER + 1 //just above mobs
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "tank_cannon"

	var/turret_x = 0
	var/turret_y = 0

	var/turret_color = "#4a5243"
	var/turret_icon
	var/image/turret_image
	var/image/turret_roof_image

	var/list/obj/structure/bed/chair/turret_seat/seats = list()
	var/list/positions = list()

	var/azimuth = 0
	var/distance = 5

	var/max_speed = 0.5
	var/current_speed = 0
	var/last_rotation = 1
	var/prev_direction = 1

	var/list/weapons = list()
	var/selected_weapon = 1
	var/is_firing = FALSE

	var/list/walls = list()

	var/broken = FALSE

/obj/structure/turret/New()
	..()
	switch(dir)
		if(EAST)
			azimuth = 0
		if(NORTH)
			azimuth = 90
		if(WEST)
			azimuth = 180
		if(SOUTH)
			azimuth = 270
	last_move = world.time
	create_seats()
	update_icon()

/obj/structure/turret/proc/get_wall_name(var/direction)
	var/w_dirs = list(NORTH, NORTHEAST, EAST, SOUTHEAST, SOUTH, SOUTHWEST, WEST, NORTHWEST)
	var/w_names = list("back", "backleft", "left", "frontleft", "front", "frontright", "right", "backright")
	while (dir != w_dirs[1])
		var/i = 8
		var/buf = w_dirs[i];
		for (, i > 1, i--)
			w_dirs[i] = w_dirs[i - 1]
		w_dirs[1] = buf
	var/i
	for (i = 1, i <= 8, i++)
		if (direction == w_dirs[i])
			return w_names[i]

/obj/structure/turret/proc/get_wall_armor(var/direction)
	var/wall_armor = 0
	switch(direction)
		if("frontleft")
			wall_armor = walls["front"] + walls["left"]
		if("frontright")
			wall_armor = walls["front"] + walls["right"]
		if("backleft")
			wall_armor = walls["back"] + walls["left"]
		if("backright")
			wall_armor = walls["back"] + walls["right"]
	if(wall_armor == 0)
		wall_armor = walls[direction]
	return wall_armor

/obj/structure/turret/course/get_wall_armor()
	return walls["front"]

/obj/structure/turret/bullet_act(obj/item/projectile/P)
	var/penloc = get_wall_name(P.get_direction())
	if (get_wall_armor(penloc) < P.heavy_armor_penetration)
		if(istype(P, /obj/item/projectile/shell))
			var/obj/item/projectile/shell/S = P
			S.initiated = TRUE
			S.initiate(get_turf(src))
		else
			P.impact_effect()
			P.loc = null
			qdel(P)
			return FALSE
	else if(istype(P, /obj/item/projectile/shell))
		var/obj/item/projectile/shell/S = P
		var/i = P.permutated.len
		while (i > 0) // Толщина крыши техники ещё не реализована поэтому в случае непробилия башни снаряд будет взрываться за пределами техники
			var/frame_located = FALSE
			for (var/obj/structure/vehicleparts/frame/F in P.permutated[i])
				frame_located = TRUE
			if(!frame_located)
				S.initiate(P.permutated[i])
				return FALSE
			i -= 1
	else
		P.impact_effect()
		P.loc = null
		qdel(P)
	return TRUE

/obj/structure/turret/proc/create_seats()
	if(!positions)
		return
	for(var/position in positions)
		var/seat_type = positions[position]["type"]
		var/obj/structure/bed/chair/turret_seat/S = new seat_type(src.loc)
		if(istype(S, /obj/structure/bed/chair/turret_seat))
			S.setup(src)
		seats.Add(S)

/obj/structure/turret/proc/get_seat(var/profession)
	for(var/list/obj/structure/bed/chair/turret_seat/S in seats)
		if(S.seat_type == profession)
			return S
	return FALSE

/obj/structure/turret/proc/get_crewman(var/profession)
	for(var/list/obj/structure/bed/chair/turret_seat/S in seats)
		if(S.seat_type == profession)
			return S.buckled_mob
	return FALSE

/obj/structure/turret/proc/clear_aiming_line(var/mob/operator)
	if(!operator)
		return
	for (var/image/img in operator.client.images)
		if (img.icon_state == "point")
			operator.client.images.Remove(img)
		if (img.icon_state == "cannon_target")
			operator.client.images.Remove(img)

/obj/structure/turret/proc/draw_aiming_line(var/mob/operator)
	if(!operator)
		return
	clear_aiming_line(operator)
	var/image/aiming_line
	var/i = 0
	var/point_x
	var/point_y
	for(i = 0, i < distance * 32, i+=32)
		point_x = trunc(i * cos(azimuth))
		point_y = trunc(i * sin(azimuth))
		if (point_x != 0 || point_y != 0)
			aiming_line = new('icons/effects/Targeted.dmi', loc = src, icon_state="point", pixel_x = point_x, pixel_y = point_y, layer = 14)
			aiming_line.alpha = 255 - (i / 4)
			operator.client.images += aiming_line
	aiming_line = new('icons/effects/Targeted.dmi', loc = src, icon_state="cannon_target", pixel_x = point_x, pixel_y = point_y, layer = 14)
	operator.client.images += aiming_line

/obj/structure/turret/update_icon()
	..()
	draw_aiming_line(get_crewman("gunner"))
	update_dir()
	pixel_x = 0
	pixel_y = 0
	var/vehicle_dir = 0
	for (var/obj/structure/vehicleparts/frame/F in loc)
		vehicle_dir = F.dir
	if(vehicle_dir != 0)
		switch(vehicle_dir)
			if(NORTH)
				pixel_x = -turret_x
				pixel_y = -turret_y
			if(WEST)
				pixel_x = turret_y
				pixel_y = -turret_x
			if(SOUTH)
				pixel_x = turret_x
				pixel_y = turret_y
			if(EAST)
				pixel_x = -turret_y
				pixel_y = turret_x
	update_seats()

	var/ic = 'icons/obj/vehicles/vehicles256x256.dmi'
	if(!turret_image)
		turret_image = image(icon=ic, loc=src, layer=12)
		turret_image.color = turret_color
	turret_image.icon_state="[turret_icon][broken]"
	turret_image.pixel_x = -112
	turret_image.pixel_y = -112
	if(!turret_roof_image)
		turret_roof_image = image(icon=ic, loc=src, layer=13)
		turret_roof_image.color = turret_color
	turret_roof_image.icon_state="[turret_icon]_roof[broken]"
	turret_roof_image.pixel_x = -112
	turret_roof_image.pixel_y = -112

/mob/var/obj/structure/turret/using_turret = null

/mob/proc/start_using_turret(o)
	stop_using_turret()
	if (o && istype(o, /obj/structure/turret))
		using_turret = o

/mob/proc/stop_using_turret()
	if (using_turret)
		using_turret.clear_aiming_line(src)
		src << "you are stopped using [using_turret.name]"
		src << browse(null, "window=artillery_window")
		using_turret = null

/obj/structure/turret/proc/place_user(var/mob/living/M)
	var/obj/structure/vehicleparts/axis/turret_vehicle = null
	var/obj/structure/vehicleparts/axis/mob_vehicle = null

	for (var/obj/structure/vehicleparts/frame/F in loc)
		turret_vehicle = F.axis

	for (var/obj/structure/vehicleparts/frame/F in M.loc)
		mob_vehicle = F.axis

	if(turret_vehicle != mob_vehicle)
		M << "You have to be in the same vehicle with the turret."
		return

	if (M.buckled)
		return
	M.forceMove(loc)
	if(get_seat("gunner") && !get_crewman("gunner"))
		get_seat("gunner").buckle_mob(M)
		M << "You are climbing on the gunner's seat."
	else if(get_seat("loader") && !get_crewman("loader"))
		get_seat("loader").buckle_mob(M)
		M << "You are climbing on the loader's seat."
	else if(get_seat("commander") && !get_crewman("commander"))
		get_seat("commander").buckle_mob(M)
		M << "You are climbing on the commander's seat."
	else
		M << "There are no free seats in the turret"
		return
	M.start_using_turret(src)

/obj/structure/turret/attack_hand(var/mob/attacker)
	place_user(attacker)
	if(attacker.using_turret == src)
		do_html(attacker)

/obj/structure/turret/proc/switch_weapon()
	selected_weapon += 1

	if(selected_weapon > weapons.len)
		selected_weapon = 1

/obj/structure/turret/proc/icrease_target_distance(var/value)
	distance += value
	if(distance < 5)
		distance = 5
	update_icon()

/obj/structure/turret/proc/update_dir()
	if(azimuth >= 45 && azimuth < 135)
		dir = NORTH
	else if(azimuth >= 135 && azimuth < 225)
		dir = WEST
	else if(azimuth >= 225 && azimuth < 315)
		dir = SOUTH
	else
		dir = EAST

/obj/structure/turret/proc/clamp_azimuth()
	if(azimuth >= 360)
		azimuth -= 360
	else if(azimuth < 0)
		azimuth += 360

/obj/structure/turret/proc/rotate_to_target(var/direction)
	var/dt = world.time - last_rotation
	current_speed -= dt * max_speed * 0.04

	if (current_speed < 0 || direction != prev_direction)
		current_speed = 0
	current_speed += max_speed * 0.04

	if (current_speed > max_speed)
		current_speed = max_speed
	azimuth += direction * current_speed

	clamp_azimuth(azimuth)
	update_icon()

	prev_direction = direction
	last_rotation = world.time

/obj/structure/turret/proc/update_seats()
	for (var/list/obj/structure/bed/chair/turret_seat/S in seats)
		S.update_icon()

/obj/structure/turret/proc/open_fire()
	if (weapons && weapons.len >= selected_weapon)
		if (istype(weapons[selected_weapon], /obj/item/weapon/gun/projectile/automatic))
			var/obj/item/weapon/gun/projectile/automatic/G = weapons[selected_weapon]
			var/stot_dt = world.time - G.last_fire
			if (stot_dt > G.firemodes[G.sel_mode].burst_delay && !is_firing)
				is_firing = TRUE
				fire()
		else if (!is_firing)
			is_firing = TRUE
			fire()

/obj/structure/turret/proc/fire()
	if (weapons.len < selected_weapon)
		return
	var/mob/gunner = get_crewman("gunner")
	if (!gunner)
		return

	var/next_shot_delay = 1

	var/target_x = ceil(distance * cos(azimuth))
	var/target_y = ceil(distance * sin(azimuth))

	if (istype(weapons[selected_weapon], /obj/item/weapon/gun/projectile/automatic))
		var/obj/item/weapon/gun/projectile/automatic/G = weapons[selected_weapon]
		G.recoil = 1
		G.dir = dir
		G.Fire(locate(x + target_x, y + target_y, z),gunner)

		next_shot_delay = G.firemodes[G.sel_mode].burst_delay
	else if (istype(weapons[selected_weapon], /obj/structure/cannon/modern/tank))
		var/obj/structure/cannon/modern/tank/C = weapons[selected_weapon]
		C.azimuth = azimuth
		C.distance = distance
		C.loc = loc
		C.do_tank_fire(gunner)
		C.forceMove(src)

	if (is_firing)
		spawn(next_shot_delay)
			fire()

/obj/structure/turret/attackby(obj/item/W as obj, mob/M as mob)
	if(weapons.len < selected_weapon)
		return

	if(istype(weapons[selected_weapon], /obj/item/weapon/gun/projectile/automatic))
		var/obj/item/weapon/gun/projectile/automatic/G = weapons[selected_weapon]
		M << "you started to loading [G.name]."
		G.attackby(W, M)
	else if(istype(weapons[selected_weapon], /obj/structure/cannon/modern/tank))
		var/obj/structure/cannon/modern/tank/C = weapons[selected_weapon]
		M << "you started to loading [C.name]."
		C.attackby(W, M)

/obj/structure/turret/Topic(href, href_list, hsrc)

	var/mob/user = usr

	if (href_list["switch_weapon"])
		switch_weapon()
	if (href_list["load_weapon"])
		if(weapons.len >= selected_weapon)
			if(istype(weapons[selected_weapon], /obj/item/weapon/gun/projectile/automatic))
				var/obj/item/weapon/gun/projectile/automatic/G = weapons[selected_weapon]
				G.unload_ammo(user)
			else if(istype(weapons[selected_weapon], /obj/structure/cannon/modern/tank))
				var/obj/structure/cannon/modern/tank/C = weapons[selected_weapon]
				if(C.loaded.len > 0)
					var/obj/item/cannon_ball/S = C.loaded[1]
					C.loaded -= S
					S.loc = get_turf(user)
					user << SPAN_NOTICE("You unload \the [src].")
				if(istype(weapons[selected_weapon], /obj/structure/cannon/modern/tank/autoloader))
					var/obj/structure/cannon/modern/tank/autoloader/A = weapons[selected_weapon]
					var/list/loadable = list()
					for (var/obj/structure/shellrack/autoloader/AL in range(1,src))
						if (AL.storage.contents)
							for (var/obj/item/cannon_ball/shell/tank/TS in AL.storage.contents)
								if (istype(TS, A.ammotype))
									if (A.caliber != TS.caliber && A.caliber != null && A.caliber != 0)
										user << SPAN_WARNING("\The [TS] is of the wrong caliber! You need [A.caliber] mm shells for this cannon.")
										continue
									loadable += TS

					playsound(loc, 'sound/machines/autoloader.ogg', 100, TRUE)
					var/obj/item/cannon_ball/shell/tank/chosen

					user << SPAN_NOTICE("The autoloader begins loading a shell.")
					spawn (6 SECONDS)
						if (!loadable.len)
							user << SPAN_WARNING("There are no shells to load.")
							return
						chosen = WWinput(usr, "Select a tank shell to load", "Load Tank Shell", loadable[1], WWinput_list_or_null(loadable))
						if (!chosen || chosen == "")
							return
						chosen.loc = src
						A.loaded += chosen
						user << SPAN_NOTICE("The autoloader loads \the [src].")
						return
	do_html(user)

/obj/structure/turret/proc/do_html(var/mob/m)
	if (!m)
		return
	if(m == get_crewman("gunner"))
		m << browse(get_gunner_menu(),  "window=artillery_window;border=1;can_close=1;can_resize=1;can_minimize=0;titlebar=1;size=400x400")

/obj/structure/turret/proc/get_gunner_menu()
	var/weapon_name = "Any weapon selected"
	var/loaded = "Nothing loaded"

	if(weapons.len >= selected_weapon)
		if(istype(weapons[selected_weapon], /obj/item/weapon/gun/projectile/automatic))
			var/obj/item/weapon/gun/projectile/automatic/G = weapons[selected_weapon]
			weapon_name = G.name
			if(G.ammo_magazine)
				loaded = G.ammo_magazine.name
		else if(istype(weapons[selected_weapon], /obj/structure/cannon/modern/tank))
			var/obj/structure/cannon/modern/tank/C = weapons[selected_weapon]
			weapon_name = C.name
			if(C.loaded.len >= 1)
				loaded = C.loaded[1].name
	var/menu = {"
	<br>
	<html>
	<head>
	[common_browser_style]
	</head>
	<body>
	<script language="javascript">
	function set(input) {
	  window.location="byond://?src=\ref[src];action="+input.name+"&value="+input.value;
	}
	</script>
	<center>
	<big><b>[name]</b></big><br>
	</center>
	<big>Switch weapon:</big><br>
	<big><a href='?src=\ref[src];switch_weapon=1'>[weapon_name]</a>|<a href='?src=\ref[src];load_weapon=1'>[loaded]</a></big><br>
	</body>
	</html>
	<br>
	"}
	return menu

/obj/structure/turret/bt7
	turret_color = "#5c784f"
	turret_icon = "bt7_turret"
	name = "BT-7"
	turret_x = -16
	turret_y = 0
	positions = list(
		"gunner" = list("x" = 9, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"commander" = list("x" = 9, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 15,
		"back" = 13,
		"right" = 15,
		"left" = 15,
	)
	max_speed = 1.1
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian45(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/t34
	turret_color = "#3d5931"
	turret_icon = "t34_turret"
	name = "T-34"
	positions = list(
		"gunner" = list("x" = 9, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"commander" = list("x" = -9, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 50,
		"back" = 50,
		"right" = 50,
		"left" = 50,
	)
	max_speed = 1.5
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian76(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/kv1
	turret_color = "#3d5931"
	turret_icon = "kv1_turret"
	name = "KV-1"
	positions = list(
		"gunner" = list("x" = 9, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -9, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = 0, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 90,
		"back" = 75,
		"right" = 75,
		"left" = 75,
	)
	max_speed = 0.84
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian76(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/t3485
	turret_color = "#4a5243"
	turret_icon = "t3485_turret"
	name = "T-34-85"
	positions = list(
		"gunner" = list("x" = 11, "y" = -10, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -11, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = 11, "y" = 7, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 90,
		"back" = 52,
		"right" = 75,
		"left" = 75,
	)
	max_speed = 2.3
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian85(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/course
	turret_color = "#4a5243"
	turret_icon = "su100_turret"
	name = "Course cannon"
	positions = list(
		"gunner" = list("x" = 12, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -6, "y" = 18, "type" = /obj/structure/bed/chair/turret_seat/loader),
	)

/obj/structure/turret/course/proc/turn_to_dir(var/tdir)
	if(tdir == "left")
		azimuth += 90
	else if(tdir == "right")
		azimuth -= 90
	clamp_azimuth()
	update_icon()

/obj/structure/turret/course/rotate_to_target(var/direction)
	var/dt = world.time - last_rotation
	current_speed -= dt * max_speed * 0.04

	if(current_speed < 0 || direction != prev_direction)
		current_speed = 0
	current_speed += max_speed * 0.04

	if(current_speed > max_speed)
		current_speed = max_speed
	azimuth += direction * current_speed

	clamp_azimuth(azimuth)

	switch(dir)
		if(NORTH)
			if(azimuth >= 135)
				azimuth = 134
			else if(azimuth < 45)
				azimuth = 45
		if(WEST)
			if(azimuth >= 225)
				azimuth = 224
			else if(azimuth < 135)
				azimuth = 135
		if(SOUTH)
			if(azimuth >= 315)
				azimuth = 314
			else if(azimuth < 225)
				azimuth = 225
		if(EAST)
			if(azimuth >= 45 && azimuth <= 180)
				azimuth = 44
			else if(azimuth <= 315 && azimuth > 180)
				azimuth = 316

	update_icon()

	prev_direction = direction
	last_rotation = world.time

/obj/structure/turret/course/su85m
	turret_color = "#4a5243"
	turret_icon = "su100_turret"
	name = "SU-85M"
	positions = list(
		"gunner" = list("x" = 12, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -6, "y" = 18, "type" = /obj/structure/bed/chair/turret_seat/loader),
	)
	walls = list (
		"front" = 130,
	)
	max_speed = 0.5
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian85(src))
		..()

/obj/structure/turret/course/su100
	turret_color = "#4a5243"
	turret_icon = "su100_turret"
	name = "SU-100"
	positions = list(
		"gunner" = list("x" = 12, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -6, "y" = 13, "type" = /obj/structure/bed/chair/turret_seat/loader),
	)
	walls = list (
		"front" = 130,
	)
	max_speed = 0.5
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian100(src))
		..()

/obj/structure/turret/is1
	turret_color = "#4a5243"
	turret_icon = "is1_turret"
	name = "IS-1"
	positions = list(
		"gunner" = list("x" = 14, "y" = -10, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -11, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = 13, "y" = 13, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 100,
		"back" = 100,
		"right" = 100,
		"left" = 100,
	)
	max_speed = 1.1
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian85(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/is2
	turret_color = "#4a5243"
	turret_icon = "is2_turret"
	name = "IS-2"
	positions = list(
		"gunner" = list("x" = 14, "y" = -10, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -14, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/loader/is2),
		"commander" = list("x" = 13, "y" = 18, "type" = /obj/structure/bed/chair/turret_seat/commander/is2),
	)
	walls = list (
		"front" = 120,
		"back" = 100,
		"right" = 100,
		"left" = 100,
	)
	max_speed = 0.98
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian122(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/is3
	turret_color = "#4a5243"
	turret_icon = "is3_turret"
	name = "IS-3"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 14, "y" = -12, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -14, "y" = 3, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = 14, "y" = 3, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 360,
		"back" = 120,
		"right" = 200,
		"left" = 200,
	)
	max_speed = 0.63
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian122(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src))
		..()

/obj/structure/turret/t55
	turret_color = "#5c5c4c"
	turret_icon = "t55_turret"
	name = "T-55"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 11, "y" = -17, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -13, "y" = 3, "type" = /obj/structure/bed/chair/turret_seat/loader/t55),
		"commander" = list("x" = 16, "y" = 2, "type" = /obj/structure/bed/chair/turret_seat/commander/t55),
	)
	walls = list (
		"front" = 250,
		"back" = 70,
		"right" = 170,
		"left" = 170,
	)
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian100(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk(src))
		..()

/obj/structure/turret/t62
	turret_color = "#5c5c4c"
	turret_icon = "t62a_turret"
	name = "T-62"
	turret_x = 0
	turret_y = 8
	positions = list(
		"gunner" = list("x" = 12, "y" = -16, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -18, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/loader/t62),
		"commander" = list("x" = 16, "y" = 5, "type" = /obj/structure/bed/chair/turret_seat/commander/t62),
	)
	walls = list (
		"front" = 250,
		"back" = 65,
		"right" = 140,
		"left" = 140,
	)
	max_speed = 0.95
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/russian115(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/t62/t62m
	turret_color = "#5c5c4c"
	turret_icon = "t62m_turret"
	name = "T-62M"
	max_speed = 0.89
	walls = list (
		"front" = 400,
		"back" = 65,
		"right" = 400,
		"left" = 400,
	)

/obj/structure/turret/t62/t62mv
	turret_color = "#5c5c4c"
	turret_icon = "t62mv_turret"
	name = "T-62MV"

/obj/structure/turret/t64bm
	turret_color = "#5c5c4c"
	turret_icon = "t64bm_turret"
	name = "T-64BM"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 16, "y" = 5, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"commander" = list("x" = -16, "y" = 6, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 600,
		"back" = 65,
		"right" = 400,
		"left" = 400,
	)
	max_speed = 1.43
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/autoloader/t90a(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/t72
	turret_color = "#5c5c4c"
	turret_icon = "t72_turret"
	name = "T-72"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 14, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/gunner/t72),
		"commander" = list("x" = -15, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/commander/t72),
	)
	walls = list (
		"front" = 500,
		"back" = 65,
		"right" = 300,
		"left" = 300,
	)
	max_speed = 1.2
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/autoloader/t90a(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/t72/t72m1
	turret_icon = "t72m1_turret"
	name = "T-72M1"
	max_speed = 1.4

/obj/structure/turret/t72/t72b3
	turret_icon = "t72b3_turret"
	name = "T-72B3"
	max_speed = 2.23

/obj/structure/turret/t80u
	turret_color = "#5c5c4c"
	turret_icon = "t80u_turret"
	name = "T-80U"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 16, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/gunner/t80),
		"commander" = list("x" = -14, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/commander/t80),
	)
	walls = list (
		"front" = 600,
		"back" = 65,
		"right" = 400,
		"left" = 400,
	)
	max_speed = 1.4
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/autoloader/t90a(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/t80u/t80uk
	turret_icon = "t80uk_turret"
	name = "T-80UK"
	max_speed = 1.4

/obj/structure/turret/t90a
	turret_color = "#4a5243"
	turret_icon = "t90a_turret"
	name = "T-90A"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 16, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/gunner/t90),
		"commander" = list("x" = -14, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/commander/t90),
	)
	walls = list (
		"front" = 600,
		"back" = 65,
		"right" = 400,
		"left" = 400,
	)
	max_speed = 1.4
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/autoloader/t90a(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/bmd2
	turret_color = "#787859"
	turret_icon = "bmd2_turret"
	name = "BMD-2"
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "autocannon"
	turret_x = 16
	turret_y = -16
	positions = list(
		"gunner" = list("x" = 4, "y" = 0, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"commander" = list("x" = -4, "y" = 0, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list ( // взял у БМП-2. Необходимо уточнить
		"front" = 40,
		"back" = 11,
		"right" = 30,
		"left" = 30,
	)
	max_speed = 1.79
	New()
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/shipunov(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/btr80
	turret_color = "#4a5243"
	turret_icon = "btr80_turret"
	name = "BTR-80"
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "autocannon"
	turret_x = 16
	turret_y = 0
	positions = list(
		"gunner" = list("x" = 0, "y" = 4, "type" = /obj/structure/bed/chair/turret_seat/gunner),
	)
	walls = list ( // взял у БМП-2. Необходимо уточнить
		"front" = 40,
		"back" = 11,
		"right" = 30,
		"left" = 30,
	)
	max_speed = 17.9
	New()
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/shipunov2a72(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/mtlb
	turret_color = "#4a5243"
	turret_icon = "mtlb_turret"
	name = "MTLB"
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "pkm"
	turret_x = 3
	turret_y = 12
	positions = list(
		"gunner" = list("x" = 0, "y" = 0, "type" = /obj/structure/bed/chair/turret_seat/gunner/mtlb),
	)
	walls = list ( // взял от фонаря. Необходимо уточнить
		"front" = 20,
		"back" = 20,
		"right" = 20,
		"left" = 20,
	)
	max_speed = 1
	New()
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/pkm(src))
		..()

/obj/structure/turret/pziv
	turret_color = "#585A5C"
	turret_icon = "pziv_turret"
	name = "PZ-IV"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 11, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -11, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = 0, "y" = 13, "type" = /obj/structure/bed/chair/turret_seat/commander/pziv),
	)
	walls = list (
		"front" = 50,
		"back" = 30,
		"right" = 30,
		"left" = 30,
	)
	max_speed = 0.9
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/german75(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg34(src))
		..()

/obj/structure/turret/pzvi
	turret_color = "#585A5C"
	turret_icon = "pziv_turret"
	name = "PZ-VI"
	positions = list(
		"gunner" = list("x" = 11, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -11, "y" = -2, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = 0, "y" = 11, "type" = /obj/structure/bed/chair/turret_seat/commander/pziv),
	)
	walls = list (
		"front" = 200,
		"back" = 85,
		"right" = 100,
		"left" = 100,
	)
	max_speed = 0.96
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/german88(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg34(src))
		..()

/obj/structure/turret/leo2a6
	turret_color = "#4a5243"
	turret_icon = "2a6_turret"
	name = "2A6"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 16, "y" = -16, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = -16, "y" = -16, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = -16, "y" = 16, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 700,
		"back" = 80,
		"right" = 300,
		"left" = 300,
	)
	max_speed = 2.38
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/leopard(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg3(src))
		..()

/obj/structure/turret/sherman
	turret_color = "#635931"
	turret_icon = "m4_turret"
	name = "M-4 Sherman"
	turret_x = 0
	turret_y = 8
	positions = list(
		"gunner" = list("x" = 9, "y" = -8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = 9, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = -13, "y" = 6, "type" = /obj/structure/bed/chair/turret_seat/commander/m4),
	)
	walls = list (
		"front" = 70,
		"back" = 50,
		"right" = 50,
		"left" = 50,
	)
	max_speed = 1.4
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/american75(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/browning_lmg(src))
		..()

/obj/structure/turret/m41
	turret_color = "#635931"
	turret_icon = "m41_turret"
	name = "M-41 Walker Bulldog"
	turret_x = -16
	turret_y = 0
	positions = list(
		"gunner" = list("x" = 9, "y" = -8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = 9, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/loader/m41),
		"commander" = list("x" = -8, "y" = 1, "type" = /obj/structure/bed/chair/turret_seat/commander/m41),
	)
	walls = list (
		"front" = 30,
		"back" = 25,
		"right" = 25,
		"left" = 25,
	)
	max_speed = 1.4
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/american76(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/browning_lmg(src))
		..()

/obj/structure/turret/m48
	turret_color = "#635931"
	turret_icon = "m48_turret"
	name = "M-48 Patton"
	positions = list(
		"gunner" = list("x" = 9, "y" = -8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = 9, "y" = 8, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = -12, "y" = 10, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 250,
		"back" = 55,
		"right" = 80,
		"left" = 80,
	)
	max_speed = 1.4
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/american90(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/browning_lmg(src))
		..()

/obj/structure/turret/bradley
	turret_color = "#787859"
	turret_icon = "bradley_turret"
	name = "Bradley"
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "autocannon"
	positions = list(
		"gunner" = list("x" = 9, "y" = -1, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"commander" = list("x" = 8, "y" = 0, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 60,
		"back" = 25,
		"right" = 40,
		"left" = 13,
	)
	max_speed = 3.7
	New()
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/bushmaster(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/m249(src))
		..()

/obj/structure/turret/technical_dshk //Типо пулемёт для технички, да
	turret_icon = ""
	name = "Cursed DSHK"
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "dshk"
	turret_x = 16
	turret_y = 7
	positions = list(
		"gunner" = list("x" = 0, "y" = 4, "type" = /obj/structure/bed/chair/turret_seat/gunner),
	)
	walls = list (
		"front" = 0,
		"back" = 0,
		"right" = 0,
		"left" = 0,
	)
	max_speed = 1
	New()
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk(src))
		..()

/obj/structure/turret/m1abrams
	turret_color = "#787859"
	turret_icon = "m1a1_turret"
	name = "M1A1_turret"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 16, "y" = -16, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = 16, "y" = 10, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = -10, "y" = 16, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 500,
		"back" = 60,
		"right" = 200,
		"left" = 200,
	)
	max_speed = 2.3
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/m1a1_abrams(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/m249(src))
		..()

/obj/structure/turret/challenger2
	turret_color = "#787859"
	turret_icon = "challenger2_turret"
	name = "Challenger-2"
	turret_x = 0
	turret_y = 16
	positions = list(
		"gunner" = list("x" = 16, "y" = -16, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = 16, "y" = 16, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = -16, "y" = 16, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 700,
		"back" = 60,
		"right" = 200,
		"left" = 200,
	)
	max_speed = 1.8
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/leopard(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg3(src))
		..()

/obj/structure/turret/chiha
	turret_color = "#787859"
	turret_icon = "jap_turret"
	name = "Chi-Ha"
	positions = list(
		"gunner" = list("x" = 0, "y" = -8, "type" = /obj/structure/bed/chair/turret_seat/gunner),
		"loader" = list("x" = 4, "y" = 0, "type" = /obj/structure/bed/chair/turret_seat/loader),
		"commander" = list("x" = -4, "y" = 0, "type" = /obj/structure/bed/chair/turret_seat/commander),
	)
	walls = list (
		"front" = 25,
		"back" = 25,
		"right" = 25,
		"left" = 25,
	)
	max_speed = 0.89
	New()
		weapons.Add(new/obj/structure/cannon/modern/tank/japanese57(src))
		weapons.Add(new/obj/item/weapon/gun/projectile/automatic/type99(src))
		..()