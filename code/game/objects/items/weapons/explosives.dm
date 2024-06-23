/obj/item/weapon/plastique
	name = "plastic explosives"
	desc = "Used to put holes in specific areas without too much extra hole."
	gender = PLURAL
	icon = 'icons/obj/grenade.dmi'
	icon_state = "plastic-explosive0"
	item_state = "zippo"
	flags = NOBLUDGEON | CONDUCT
	w_class = ITEM_SIZE_SMALL
	var/timer = 5
	var/atom/target = null
	var/open_panel = FALSE
	var/image_overlay = null

/obj/item/weapon/plastique/c4
	name = "C4 explosive"


/obj/item/weapon/plastique/attackby(var/obj/item/I, var/mob/user)
	if (istype(I, /obj/item/weapon/wrench))
		open_panel = !open_panel
		user << "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>"
		..()

/obj/item/weapon/plastique/attack_self(mob/user as mob)
	var/newtime = WWinput(usr, "Please set the timer.", "Timer", 5, "num")
	if (user.get_active_hand() == src)
		newtime = Clamp(newtime, 3, 60000)
		timer = newtime
		user << "Timer set for [timer] seconds."

/obj/item/weapon/plastique/afterattack(atom/movable/target, mob/user, flag)
	if (!flag)
		return

	if (istype(target, /obj/item/weapon/storage) || istype(target, /obj/item/clothing/accessory/storage) || istype(target, /obj/item/clothing/under))
		return

	user << "Planting explosives..."
	user.do_attack_animation(target)

	if (do_after(user, 10, target) && in_range(user, target))
		user.drop_item()
		target = target
		loc = null

		if (ismob(target))
			add_logs(user, target, "planted [name] on")
			user.visible_message("<span class='danger'>[user.name] finished planting an explosive on [target.name]!</span>")
			message_admins("[key_name(user, user.client)](<A HREF='?_src_=holder;adminmoreinfo=\ref[user]'>?</A>) planted [name] on [key_name(target)](<A HREF='?_src_=holder;adminmoreinfo=\ref[target]'>?</A>) with [timer] second fuse", key_name(user, user.client))
			log_game("[key_name(user)] planted [name] on [key_name(target)] with [timer] second fuse")

		else
			message_admins("[key_name(user, user.client)](<A HREF='?_src_=holder;adminmoreinfo=\ref[user]'>?</A>) planted [name] on [target.name] at ([target.x],[target.y],[target.z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[target.x];Y=[target.y];Z=[target.z]'>JMP</a>) with [timer] second fuse", key_name(user, user.client))
			log_game("[key_name(user)] planted [name] on [target.name] at ([target.x],[target.y],[target.z]) with [timer] second fuse")

		target.overlays += image_overlay
		user << "Bomb has been planted. Timer counting down from [timer]."
		user << 'sound/effects/bombplant.ogg'
		spawn(timer)
			explode(get_turf(target))

/obj/item/weapon/plastique/proc/explode(var/turf/location)
	var/original_mobs = list()
	var/original_objs = list()

	if (location)
		explosion(location, 1, 1, 3, 3)
		for (var/mob/living/L in location.contents)
			original_mobs += L
			if (L.client)
				L.canmove = FALSE
		for (var/obj/O in location.contents)
			original_objs += O
		playsound(location, "explosion", 100, TRUE)
		spawn (1)
			for (var/mob/living/L in original_mobs)
				if (L)
					L.maim()
					if (L)
						L.overlays -= image_overlay
						L.canmove = TRUE
			for (var/obj/O in original_objs)
				if (O)
					O.overlays -= image_overlay
					O.ex_act(1.0)
			location.overlays -= image_overlay
			location.ex_act(1.0)
	qdel(src)

/obj/item/weapon/plastique/bullet_act(var/obj/item/projectile/proj)
	if (proj && !proj.nodamage)
		return explode(get_turf(src))

/obj/item/weapon/plastique/attack(mob/M as mob, mob/user as mob, def_zone)
	return


/obj/item/weapon/plastique/New()
	image_overlay = image(icon, "plastic-explosive2")
	..()

/obj/item/weapon/plastique/russian
	name = "explosive charge"
	icon_state = "russian_charge"

/obj/item/weapon/plastique/russian/New()
	image_overlay = image(icon, "russian_charge_placed")
	..()

/obj/item/weapon/plastique/remote
	name = "Remote explosive charge"
	icon_state = "remote_charge_inactive"
	var/base_icon = "remote_charge"
	var/connected = FALSE

/obj/item/weapon/plastique/remote/explode()
	explosion(get_turf(loc), 2, 3, 4, 3)
	playsound(get_turf(loc), "explosion", 100, TRUE)
	qdel(src)

/obj/item/weapon/plastique/remote/update_icon()
	..()
	if(connected)
		icon_state = "[base_icon]_active"
	else
		icon_state = "[base_icon]_inactive"

/obj/item/weapon/plastique/remote/afterattack(atom/movable/target, mob/user, flag)
	if (!flag)
		return
	if(!istype(target, /obj/item/weapon/detonator))
		return
	var/obj/item/weapon/detonator/D = target

	var/connected_target = D.connect(src)
	if(connected && connected_target)
		user << "you connected [name] to the [D]"
	else
		user << "you disconnected [name] from the [D]"

	update_icon()

/obj/item/weapon/detonator
	name = "Remote detonator"
	desc = "Used to remotely launch explosive charges."
	gender = PLURAL
	icon = 'icons/obj/device.dmi'
	icon_state = "remote_detonator_inactive"
	item_state = "zippo"
	flags = NOBLUDGEON | CONDUCT
	w_class = ITEM_SIZE_SMALL
	var/remote_range = 10
	var/base_icon = "remote_detonator"
	var/list/obj/item/weapon/plastique/remote/connected = list()

/obj/item/weapon/detonator/New()
	..()
	desc += " Valid at a distance of up to [remote_range] meters."

/obj/item/weapon/detonator/update_icon()
	..()
	if(connected.len > 0)
		icon_state = "[base_icon]_active"
	else
		icon_state = "[base_icon]_inactive"

/obj/item/weapon/detonator/proc/connect(var/obj/item/weapon/plastique/remote/charge)
	if(!istype(charge, /obj/item/weapon/plastique/remote))
		return FALSE
	if(!connected.Find(charge))
		connected += charge
		update_icon()
		return TRUE
	else
		connected -= charge
		update_icon()
		return FALSE

/obj/item/weapon/detonator/attack_self(mob/user as mob)
	if(connected.len > 0)
		user << "you pull the trigger"
	else
		user << "there are no connected charges"
		return
	for(var/obj/item/weapon/plastique/remote/charge in connected)
		if(get_dist(charge, src) <= remote_range)
			connected -= charge
			charge.explode()
	update_icon()