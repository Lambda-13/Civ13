//////////////DRIVING WHEELS///////////////////////

/obj/item/vehicleparts/wheel/modular
	name = "vehicle wheel"
	desc = "Used to steer a vehicle."
	icon_state = "wheel_b"
	item_state = "wheel_b"
	worn_state = "wheel_b"
	var/obj/structure/bed/chair/drivers/drivingchair = null
	var/obj/structure/vehicleparts/frame/control = null
	var/lastdirchange = 0

/obj/item/vehicleparts/wheel/modular/Destroy()
	drivingchair = null
	control = null
	..()

/obj/item/vehicleparts/wheel/modular/proc/turndir(var/mob/living/mob = null, var/newdir = "left")
	if (world.time <= lastdirchange)
		return FALSE
	lastdirchange = world.time+control.axis.turntimer
	if (control && control.axis && (control.axis.moving == FALSE || control.axis.currentspeed == 0))
		return FALSE
	if (!control || !control.axis)
		return
	for(var/obj/effect/pseudovehicle/O in control.axis.components)
		for(var/obj/structure/vehicleparts/frame/VP in O.loc)
			if (VP.axis != control.axis)
				if (mob)
					mob << "<span class='warning'>You can't turn, something is in the way!</span>"
				return FALSE
		for(var/obj/effect/pseudovehicle/PV in O.loc)
			if (PV.link != control.axis)
				if (mob)
					mob << "<span class='warning'>You can't turn, something is in the way!</span>"
				return FALSE
	if (newdir == "left")
		if(!control.axis.do_matrix(dir,TURN_LEFT(control.axis.dir), newdir))
			return FALSE
	else
		if(!control.axis.do_matrix(dir,TURN_RIGHT(control.axis.dir), newdir))
			return FALSE
	return TRUE

/obj/structure/bed/chair/drivers/ex_act(severity)
	switch(severity)
		if (1.0)
			if (prob(40))
				Destroy()
				return
		if (2.0)
			if (prob(10))
				Destroy()
				return
		if (3.0)
			return

/obj/structure/bed/chair/drivers/Destroy()
	if (wheel)
		wheel.control.axis.wheel = null
		wheel.Destroy()
		wheel = null
	visible_message("<span class='danger'>The [name] gets destroyed!</span>")
	..()

/obj/item/vehicleparts/wheel/modular/attack_self(mob/living/human/H)
	if(!control)
		return
	if(!control.axis)
		return
	if (!(control.loc in range(1,loc)))
		H.remove_from_mob(src)
		src.forceMove(drivingchair)
		return
	if (!control.axis.engine || !control.axis.engine.fueltank)
		return
	if (!control.axis.engine.on && control.axis.engine.fueltank && control.axis.engine.fueltank.reagents && control.axis.engine.fueltank.reagents.total_volume > 0)
		control.axis.currentspeed = 0
		control.axis.engine.turn_on(H)
		if (isemptylist(control.axis.corners))
			control.axis.check_corners()
		if (isemptylist(control.axis.matrix))
			control.axis.check_matrix()
		playsound(loc, control.axis.engine.starting_snd, 35, FALSE, 2)
		spawn(40)
			if (control.axis.engine && control.axis.engine.on)
				control.axis.engine.running_sound()
		return
	else if (control.axis.engine && control.axis.engine.fueltank)
		if (control.axis && control.axis.engine.fueltank.reagents && control.axis.engine.fueltank.reagents.total_volume <= 0)
			H << "There is not enough fuel!"
			return
	if (control.axis.currentspeed < 0)
		control.axis.currentspeed = 0
	control.axis.currentspeed++
	if (control.axis.currentspeed>control.axis.speeds)
		control.axis.currentspeed = control.axis.speeds

	else
		var/spd = control.axis.get_speed()
		control.axis.vehicle_m_delay = spd
		if (control.axis.currentspeed == 1 && !control.axis.moving)
			control.axis.moving = TRUE
			H << "You put on the first gear."
			playsound(loc, 'sound/effects/lever.ogg',40, TRUE)
			control.axis.add_transporting()
			control.axis.startmovementloop()
		if (spd <= 0)
			return
		else
			H << "You increase the speed."
			playsound(loc, 'sound/effects/lever.ogg',40, TRUE)
			control.axis.vehicle_m_delay = spd
			return


/obj/item/vehicleparts/wheel/modular/secondary_attack_self(mob/living/human/user)
	if (!control || !control.axis)
		return
	if (control && control.axis && control.axis.engine && control.axis.engine.fueltank && (control.axis.currentspeed <= 0 || control.axis.engine.fueltank.reagents.total_volume <= 0))
		if (control.axis.engine.on)
			user << "You turn off the [control.axis.engine]."
			control.axis.engine.on = FALSE
			control.axis.moving = FALSE
			control.axis.currentspeed = 0
			control.axis.engine.update_icon()
			return

		return
	else
		var/spd = control.axis.get_speed()
		control.axis.currentspeed--
		spd = control.axis.get_speed()
		if (spd <= 0 || control.axis.currentspeed == 0)
			control.axis.moving = FALSE
			user << "You stop the [control.axis]."
			for (var/obj/structure/vehicleparts/movement/W in control.axis.wheels)
				W.update_icon()
			return
		else
			control.axis.vehicle_m_delay = spd
			user << "You reduce the speed."
			playsound(loc, 'sound/effects/lever.ogg',40, TRUE)
			return

/obj/structure/bed/chair/drivers
	name = "driver's seat"
	desc = "Where you drive the vehicle."
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "driver_car"
	anchored = FALSE
	var/obj/structure/vehicleparts/axis/axis = null
	var/obj/item/vehicleparts/wheel/modular/wheel = null
	New()
		..()
		wheel = new/obj/item/vehicleparts/wheel/modular(src)
		wheel.drivingchair = src

/obj/structure/bed/chair/drivers/tank
	name = "tank driver's seat"
	icon_state = "driver_tank"
	flammable = FALSE
/obj/structure/bed/chair/drivers/user_unbuckle_mob(mob/user)
	var/mob/living/M = unbuckle_mob()
	if (axis)
		axis.driver = null
	if (M)
		if (M != user)
			M.visible_message(\
				"<span class='notice'>[M.name] was unbuckled by [user.name]!</span>",\
				"<span class='notice'>You were unbuckled from [src] by [user.name].</span>",\
				"<span class='notice'>You hear metal clanking.</span>")
		else
			M.visible_message(\
				"<span class='notice'>[M.name] unbuckled themselves!</span>",\
				"<span class='notice'>You unbuckle yourself from [src].</span>",\
				"<span class='notice'>You hear metal clanking.</span>")
		add_fingerprint(user)
		for(var/obj/item/vehicleparts/wheel/modular/MW in M)
			M.remove_from_mob(MW)
			MW.forceMove(src)
			if (wheel && wheel.control && wheel.control.axis && wheel.control.axis.engine && wheel.control.axis.engine.on)
				wheel.control.axis.engine.on = FALSE
				wheel.control.axis.moving = FALSE
				wheel.control.axis.currentspeed = 0
				wheel.control.axis.engine.update_icon()
				user << "You stop the [wheel.control.axis]."
				for (var/obj/structure/vehicleparts/movement/W in wheel.control.axis.wheels)
					W.update_icon()
	return M

/obj/structure/bed/chair/drivers/update_icon()
	if(buckled_mob)
		buckled_mob.dir = dir
		buckled_mob.update_vision_cone()

/obj/structure/bed/chair/drivers/post_buckle_mob()
	if (axis)
		axis.driver = buckled_mob
	if(buckled_mob)
		buckled_mob.update_vision_cone()
	if (buckled_mob && istype(buckled_mob, /mob/living/human) && buckled_mob.put_in_active_hand(wheel) == FALSE)
		buckled_mob << "Your hands are full!"
		return

/obj/structure/bed/chair/drivers/attackby(var/obj/item/I, var/mob/living/human/H)
	if (buckled_mob && H == buckled_mob && istype(I, /obj/item/vehicleparts/wheel/modular))
		H.remove_from_mob(I)
		I.forceMove(src)
		user_unbuckle_mob(H)
		return
	else
		..()
/obj/structure/bed/chair/drivers/attack_hand( var/mob/living/human/H)
	if (wheel && buckled_mob && H == buckled_mob && wheel.loc != H)
		if (buckled_mob.put_in_active_hand(wheel))
			H << "You grab the wheel."
			if (map.ID == MAP_THE_ART_OF_THE_DEAL)
				if (H.stat != DEAD && H.civilization != "Sheriff Office" && H.civilization != "Paramedics" && H.civilization != "Government")
					for(var/list/L in map.vehicle_registations)
						if (L[1]==wheel.control.axis.reg_number && L[2] != H.civilization)
							if (!(H.real_name in map.warrants))
								var/reason = "Grand Theft Auto"
								if (L[2] == "Sheriff Office")
									reason = "Theft of a Law Enforcement Vehicle"
								if (L[2] == "Paramedics")
									reason = "Theft of an Ambulance"
								if (L[2] == "Government")
									reason = "Theft of a Government Vehicle"
								map.warrants += H.real_name
								H.gun_permit = 0
								var/obj/item/weapon/paper_bin/police/PAR = null
								for(var/obj/item/weapon/paper_bin/police/PAR2 in world)
									PAR = PAR2
									break
								if (PAR)
									var/obj/item/weapon/paper/police/warrant/SW = new /obj/item/weapon/paper/police/warrant(PAR.loc)
									SW.tgt_mob = H
									SW.tgt = H.real_name
									SW.tgtcmp = H.civilization
									SW.reason = reason
									PAR.add(SW)
									SW.spawntimer = 12000
								var/obj/item/weapon/paper/police/warrant/SW2 = new /obj/item/weapon/paper/police/warrant(null)
								SW2.tgt_mob = H
								SW2.tgt = H.real_name
								SW2.tgtcmp = H.civilization
								SW2.reason = reason
								map.pending_warrants += SW2
								SW2.forceMove(null)
								global_broadcast(FREQP,"<big>Attention, a stolen vehicle has been reported: <b>[L[1]]</b> - <b>[L[4]] [L[3]]</b> - registered to <b>[L[2]]</b><br>. A warrant has been issued for [SW2.tgt], please intervene immediately and detain the suspect.</big>")
								break
			return
	else
		..()


/obj/structure/bed/chair/mgunner
	name = "machinegunner's seat"
	desc = "a seat with a course machinegun."
	icon_state = "officechair_white"
	anchored = FALSE
	flammable = FALSE
	var/obj/item/weapon/gun/projectile/automatic/mg = null
	New()
		..()
		if(mg)
			mg.mount = src
			mg.nothrow = TRUE
			mg.nodrop = TRUE
			mg.recoil = 1

/obj/structure/bed/chair/mgunner/rotate_right()
	return

/obj/structure/bed/chair/mgunner/rotate_left()
	return

/obj/structure/bed/chair/mgunner/update_icon()
	if(buckled_mob)
		buckled_mob.dir = dir
		buckled_mob.update_vision_cone()

/obj/structure/bed/chair/mgunner/post_buckle_mob()
	if (buckled_mob && istype(buckled_mob, /mob/living/human) && mg)
		buckled_mob.update_vision_cone()
		if(buckled_mob.put_in_active_hand(mg) == FALSE)
			buckled_mob << "Your hands are full!"
			return

/obj/structure/bed/chair/mgunner/dt28/New()
		mg = new/obj/item/weapon/gun/projectile/automatic/dp28/dt28(src)
		..()

/obj/structure/bed/chair/mgunner/dtm28/New()
		mg = new/obj/item/weapon/gun/projectile/automatic/dp28/dt28/dtm28(src)
		..()

/obj/structure/bed/chair/mgunner/mg34/New()
		mg = new/obj/item/weapon/gun/projectile/automatic/mg34(src)
		..()

/obj/structure/bed/chair/mgunner/browning_lmg/New()
		mg = new/obj/item/weapon/gun/projectile/automatic/browning_lmg(src)
		..()

/obj/structure/bed/chair/mgunner/pkm/New()
		mg = new/obj/item/weapon/gun/projectile/automatic/pkm(src)
		..()

/obj/structure/bed/chair/mgunner/type99/New()
		mg = new/obj/item/weapon/gun/projectile/automatic/type99(src)
		..()

/obj/structure/bed/chair/mgunner/user_unbuckle_mob(mob/user)
	var/mob/living/M = unbuckle_mob()
	if (M)
		if (M != user)
			M.visible_message(\
				"<span class='notice'>[M.name] was unbuckled by [user.name]!</span>",\
				"<span class='notice'>You were unbuckled from [src] by [user.name].</span>",\
				"<span class='notice'>You hear metal clanking.</span>")
		else
			M.visible_message(\
				"<span class='notice'>[M.name] unbuckled themselves!</span>",\
				"<span class='notice'>You unbuckle yourself from [src].</span>",\
				"<span class='notice'>You hear metal clanking.</span>")
		add_fingerprint(user)
		if(mg)
			M.remove_from_mob(mg)
			mg.forceMove(src)
	return M

/obj/structure/bed/chair/forceMove(atom/destination, var/special_event)
	..()
	if(buckled_mob)
		buckled_mob.dir = dir
		buckled_mob.update_vision_cone()

/obj/structure/bed/chair/turret_seat
	name = "turret seat"
	icon_state = "officechair_white"
	anchored = FALSE
	flammable = FALSE
	var/obj/structure/turret/turret = null
	var/list/obj/item/weapon/devices = list()
	var/selected_device = 1
	var/image/hatch = null
	var/image/mg = null
	var/hatch_icon = null
	var/mg_icon = null
	var/is_open = FALSE
	var/facing_dir = 0
	var/seat_type = "none"

/obj/structure/bed/chair/turret_seat/update_icon()
	var/seat_x = 0
	var/seat_y = 0
	if(turret)
		seat_x = turret.positions[seat_type]["x"]
		seat_y = turret.positions[seat_type]["y"]
		if(facing_dir == 0)
			dir = turret.dir
		else
			dir = facing_dir
		switch(turret.dir)
			if(EAST)
				pixel_x = -seat_y - 1
				pixel_y = seat_x - 9
			if(NORTH)
				pixel_x = -seat_x + 1
				pixel_y = -seat_y - 7
			if(WEST)
				pixel_x = seat_y + 1
				pixel_y = -seat_x - 9
			if(SOUTH)
				pixel_x = seat_x
				pixel_y = seat_y - 1
		pixel_x += turret.pixel_x
		pixel_y += turret.pixel_y
	update_hatch_icon()
	update_mg_icon()
	if(buckled_mob)
		buckled_mob.dir = dir
		buckled_mob.update_vision_cone()
		buckled_mob.pixel_x = pixel_x
		buckled_mob.pixel_y = pixel_y

/obj/structure/bed/chair/turret_seat/post_buckle_mob()
	if(buckled_mob)
		buckled_mob.update_vision_cone()
		if(istype(buckled_mob, /mob/living/human))
			var/mob/living/human/H = buckled_mob
			H.process_turret_roofs()
		do_html(buckled_mob)
		select()
	update_icon()

/obj/structure/bed/chair/turret_seat/attackby(var/obj/item/I, var/mob/living/human/H)
	if (H == buckled_mob)
		deselect(H)
		H << browse(null, "window=seat_devices_window")
		user_unbuckle_mob(H)
		return
	else
		..()

/obj/structure/bed/chair/turret_seat/user_unbuckle_mob(mob/user)
	var/mob/living/M = unbuckle_mob()
	if (M)
		if (M != user)
			M.visible_message(\
				"<span class='notice'>[M.name] was unbuckled by [user.name]!</span>",\
				"<span class='notice'>You were unbuckled from [src] by [user.name].</span>",\
				"<span class='notice'>You hear metal clanking.</span>")
		else
			M.visible_message(\
				"<span class='notice'>[M.name] unbuckled themselves!</span>",\
				"<span class='notice'>You unbuckle yourself from [src].</span>",\
				"<span class='notice'>You hear metal clanking.</span>")
		add_fingerprint(user)
		deselect(user)
		if(istype(buckled_mob, /mob/living/human))
			var/mob/living/human/H = buckled_mob
			H.process_turret_roofs()
		if(turret)
			M.stop_using_turret()
			M << browse(null, "window=seat_devices_window")
	return M

/obj/structure/bed/chair/turret_seat/proc/switch_device()
	var/mob/living/M = buckled_mob
	deselect(M)
	if (selected_device + 1 > devices.len)
		selected_device = 1
	else
		selected_device += 1
	select()

/obj/structure/bed/chair/turret_seat/Topic(href, href_list, hsrc)
	if (href_list["switch_device"])
		switch_device()
	if (facing_dir != 0)
		switch(href_list["rotate_seat"])
			if("1")
				switch(facing_dir)
					if(NORTH)
						facing_dir = WEST
					if(WEST)
						facing_dir = SOUTH
					if(SOUTH)
						facing_dir = EAST
					if(EAST)
						facing_dir = NORTH
			if("-1")
				switch(facing_dir)
					if(NORTH)
						facing_dir = EAST
					if(EAST)
						facing_dir = SOUTH
					if(SOUTH)
						facing_dir = WEST
					if(WEST)
						facing_dir = NORTH
	if (href_list["toggle_hatch"])
		if (devices && devices.len >= selected_device)
			if (!istype(devices[selected_device], /obj/item/weapon/gun/projectile/automatic/stationary))
				is_open = !is_open
		else
			is_open = !is_open

	update_icon()
	do_html(buckled_mob)

/obj/structure/bed/chair/turret_seat/proc/setup(var/obj/structure/turret/origin_turret)
	turret = origin_turret
	update_icon()

/obj/structure/bed/chair/turret_seat/proc/select()
	var/mob/living/M = buckled_mob
	if(!buckled_mob)
		return
	if(devices.len == 0 || devices.len < selected_device)
		return
	var/obj/item/weapon/device = null
	device = devices[selected_device]
	if(!device)
		return
	for(var/obj/item/weapon/current_device in devices)
		M.remove_from_mob(current_device)
		current_device.forceMove(src)
	if(do_after(M, 5, can_move = FALSE))
		if(M.buckled != src)
			return
		if(M.put_in_active_hand(device) == FALSE)
			M << "Your hands are full!"
		else
			if(istype(device, /obj/item/turret_controls))
				var/obj/item/turret_controls/C = device
				if(turret)
					turret.draw_aiming_line(M)
				C.azoom.Grant(M)
			if(istype(device, /obj/item/weapon/gun/projectile/automatic/stationary))
				is_open = TRUE
	update_icon()

/obj/structure/bed/chair/turret_seat/proc/deselect(var/mob/living/M)
	if(!M || !istype(M, /mob/living/human))
		return
	for(var/obj/item/device in devices)
		M.remove_from_mob(device)
		device.forceMove(src)

/obj/structure/bed/chair/turret_seat/proc/do_html(var/mob/m)
	if(m != buckled_mob)
		return
	if(devices.len <= 0 && !hatch_icon)
		return
	var/menu = get_menu()
	if(!menu)
		return
	m << browse(menu,  "window=seat_devices_window;border=1;can_close=1;can_resize=1;can_minimize=0;titlebar=1;size=400x200")

/obj/structure/bed/chair/turret_seat/proc/get_menu()
	var/device_name = "Any device selected"
	if(devices.len >= selected_device)
		device_name = devices[selected_device].name
	var/rotate_buttons = ""
	var/hatch_button = ""
	if(facing_dir != 0)
		rotate_buttons = "<big><a href='?src=\ref[src];rotate_seat=1'> \< </a> | <a href='?src=\ref[src];rotate_seat=-1'> \> </a></big><br>"
	if(hatch_icon)
		var/hatch_state = "No hatch"
		if (hatch_icon)
			if (is_open)
				hatch_state = "Open"
			else
				hatch_state = "Closed"
			hatch_button = "<big><a href='?src=\ref[src];toggle_hatch=1'>[hatch_state]</a></big><br>"
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
	<big>Switch device:</big><br>
	<big><a href='?src=\ref[src];switch_device=1'>[device_name]</a></big><br>
	[rotate_buttons]
	[hatch_button]
	</body>
	</html>
	<br>
	"}
	return menu

/obj/structure/bed/chair/turret_seat/proc/update_hatch_icon()
	if(!hatch_icon)
		return
	if(!hatch)
		hatch = new/image(icon = 'icons/obj/vehicles/vehicles256x256.dmi', loc = src, icon_state = hatch_icon, layer=14)
	if(turret)
		hatch.loc = turret
		hatch.color = turret.turret_color
	if(turret)
		hatch.dir = turret.dir
	hatch.pixel_x = -112
	hatch.pixel_y = -112

/obj/structure/bed/chair/turret_seat/proc/update_mg_icon()
	if(!mg_icon)
		return
	if(!mg)
		mg = new/image(icon = 'icons/obj/vehicles/vehicles256x256.dmi', loc = src, icon_state = mg_icon, layer=15)
	if(facing_dir != 0)
		mg.dir = facing_dir
	else
		mg.dir = dir
	if(turret)
		mg.loc = turret
		var/seat_x = turret.positions[seat_type]["x"]
		var/seat_y = turret.positions[seat_type]["y"]
		switch(turret.dir)
			if(EAST)
				mg.pixel_x = -seat_y
				mg.pixel_y = seat_x
			if(NORTH)
				mg.pixel_x = -seat_x
				mg.pixel_y = -seat_y
			if(WEST)
				mg.pixel_x = seat_y
				mg.pixel_y = -seat_x
			if(SOUTH)
				mg.pixel_x = seat_x
				mg.pixel_y = seat_y
	mg.pixel_x -= 32
	mg.pixel_y -= 32
	switch(dir)
		if(EAST)
			mg.pixel_x += 20 
		if(NORTH)
			mg.pixel_y += 20
		if(WEST)
			mg.pixel_x += -20
		if(SOUTH)
			mg.pixel_y += -20

////////GUNNER///////////
/obj/structure/bed/chair/turret_seat/gunner
	name = "gunner's seat"
	seat_type = "gunner"

/obj/structure/bed/chair/turret_seat/gunner/setup(var/obj/structure/turret/origin_turret)
	..()
	var/obj/item/turret_controls/C = new/obj/item/turret_controls(src)
	C.turret = origin_turret
	devices.Add(C)

/obj/structure/bed/chair/turret_seat/gunner/t72
	hatch_icon = "t72_gunner_hatch"

/obj/structure/bed/chair/turret_seat/gunner/t80
	hatch_icon = "t80_gunner_hatch"

/obj/structure/bed/chair/turret_seat/gunner/t90
	hatch_icon = "t90_gunner_hatch"

/obj/structure/bed/chair/turret_seat/gunner/mtlb

////////LOADER///////////
/obj/structure/bed/chair/turret_seat/loader
	name = "loader's seat"
	seat_type = "loader"

/obj/structure/bed/chair/turret_seat/loader/t3485
	hatch_icon = "t3485_loader_hatch"

/obj/structure/bed/chair/turret_seat/loader/is2
	hatch_icon = "is2_loader_hatch"

/obj/structure/bed/chair/turret_seat/loader/m41
	hatch_icon = "m41_loader_hatch"

/obj/structure/bed/chair/turret_seat/loader/t55
	hatch_icon = "t55_loader_hatch"
	mg_icon = "dshk_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/loader/t62
	hatch_icon = "t62_loader_hatch"
	mg_icon = "dshk_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

////////COMMANDER///////////
/obj/structure/bed/chair/turret_seat/commander
	name = "commander's seat"
	seat_type = "commander"
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "commanders_seat"
	anchored = FALSE
	flammable = FALSE

/obj/structure/bed/chair/turret_seat/commander/New()
	..()
	facing_dir = dir
	var/obj/item/weapon/attachment/scope/adjustable/binoculars/periscope/P = new/obj/item/weapon/attachment/scope/adjustable/binoculars/periscope(src)
	P.commanderchair = src
	devices.Add(P)

/obj/structure/bed/chair/turret_seat/commander/t3485
	hatch_icon = "t3485_commander_hatch"

/obj/structure/bed/chair/turret_seat/commander/is2
	hatch_icon = "is2_commander_hatch"
	mg_icon = "dshk_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/commander/t55
	hatch_icon = "t55_commander_hatch"

/obj/structure/bed/chair/turret_seat/commander/t62
	hatch_icon = "t62_commander_hatch"

/obj/structure/bed/chair/turret_seat/commander/t72
	hatch_icon = "t72_commander_hatch"
	mg_icon = "dshk_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/commander/t80
	hatch_icon = "t80_commander_hatch"
	mg_icon = "kord_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/nsvt(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/commander/t90
	mg_icon = "kord_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/nsvt(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/commander/pziv
	hatch_icon = "pziv_commander_hatch"
	mg_icon = "mg34_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg34(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/commander/m4
	hatch_icon = "m4_commander_hatch"
	mg_icon = "m2_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/m2browning(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

/obj/structure/bed/chair/turret_seat/commander/m41
	hatch_icon = "m41_commander_hatch"
	mg_icon = "m2_mg"
	New()
		..()
		var/obj/item/weapon/gun/projectile/automatic/G = new/obj/item/weapon/gun/projectile/automatic/stationary/modern/m2browning(src)
		G.mount = src
		G.nothrow = TRUE
		G.nodrop = TRUE
		devices.Add(G)

////////TURRET CONTROLS///////////
/obj/item/turret_controls
	name = "Turret Controls"
	icon = 'icons/obj/device.dmi'
	icon_state = "turret_control"
	item_state = "turret_control"
	worn_state = "turret_control"
	nothrow = TRUE
	nodrop = TRUE
	var/datum/action/toggle_scope/azoom
	var/obj/item/weapon/attachment/scope/adjustable/binoculars/periscope/optics
	var/obj/structure/turret/turret = null
	var/is_rotating = FALSE
	var/rotating_dir = 0
	New()
		..()
		optics = new/obj/item/weapon/attachment/scope/adjustable/binoculars/periscope()
		build_zooming()

/obj/item/turret_controls/proc/get_zoom_amt()
	if(!optics)
		return ZOOM_CONSTANT
	return optics.zoom_amt

/obj/item/turret_controls/proc/build_zooming()
	azoom = new()
	azoom.scope = optics
	actions += azoom

/obj/item/turret_controls/scope/on_changed_slot()
	..()
	if (azoom)
		if (istype(loc, /obj/item))
			var/mob/M = loc.loc
			if (M && istype(M))
				azoom.Remove(M)
				if(loc == M.r_hand || loc == M.l_hand)
					azoom.Grant(M)

		else if (istype(loc, /mob))
			var/mob/M = loc
			if (istype(M))
				azoom.Remove(M)
				if (src == M.r_hand || src == M.l_hand)
					azoom.Grant(M)

/obj/item/turret_controls/dropped(mob/user)
	..()
	if (azoom)
		azoom.Remove(user)

/obj/item/turret_controls/proc/stop_rotation()
	rotating_dir = 0
	is_rotating = FALSE

/obj/item/turret_controls/proc/start_rotation(var/direction)
	rotating_dir = direction
	if(!is_rotating)
		is_rotating = TRUE
		rotate()

/obj/item/turret_controls/proc/rotate()
	if(!turret)
		return
	if(!is_rotating)
		rotating_dir = 0
		return
	if (rotating_dir > 0)
		turret.rotate_to_target(1)
	else if (rotating_dir < 0)
		turret.rotate_to_target(-1)

	spawn(0.1)
		rotate()

/obj/item/turret_controls/proc/increase_distance(var/distance)
	if(!turret)
		return
	if(distance > 0)
		turret.icrease_target_distance(1)
	else
		turret.icrease_target_distance(-1)

/obj/item/turret_controls/attack_self(mob/living/human/user)
	if(!turret)
		return
	turret.open_fire()

/obj/item/turret_controls/proc/stop_firing()
	if(!turret)
		return
	turret.is_firing = FALSE

/obj/item/turret_controls/secondary_attack_self(mob/living/human/user)
	if(!turret)
		return
	turret.switch_weapon(user)