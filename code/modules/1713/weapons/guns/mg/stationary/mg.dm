
////////////////////////
////Stationary maxim////
////////////////////////
/obj/item/weapon/gun/projectile/automatic/stationary/modern
	name = "Maxim 1895"
	desc = "Heavy Maxim machinegun on cart mount."
	icon_state = "maxim"
	base_icon = "maxim"
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	caliber = "a762x54"
	magazine_type = /obj/item/ammo_magazine/maxim
	ammo_type = /obj/item/ammo_casing/a762x54

	max_shells = FALSE
	anchored = FALSE
	auto_eject = TRUE
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	firemodes = list(
		list(name = "full auto", burst=6, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	full_auto = TRUE
	fire_delay = 0
	recoil = 5
	accuracy = 1

/obj/item/weapon/gun/projectile/automatic/stationary/modern/maxim
	name = "Maxim 1895"
	desc = "Russian version of the original Maxim machinegun, on cart mount. Uses Russian 7.62x54mm rounds."
	icon_state = "maxim"
	base_icon = "maxim"
	caliber = "a762x54"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/maxim
	good_mags = list(/obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "full auto", burst=4, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 5
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/modern/maxim/ww2
	name = "Maxim"
	desc = "Russian version of the original Maxim machinegun, on cart mount. Uses Russian 7.62x54mm rounds."
	icon_state = "maxim_ww2"
	base_icon = "maxim_ww2"
	hardness = 90
	caliber = "a762x54"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/maxim
	good_mags = list(/obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "full auto", burst=4, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg08
	name = "Maschinengewehr 08"
	desc = "German Heavy Maxim machinegun, based on the original Maxim. Uses 7.92x57mm Mauser rounds."
	icon_state = "mg08"
	base_icon = "mg08"
	caliber = "a792x57"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/mg08
	good_mags = list(/obj/item/ammo_magazine/mg08)
	firemodes = list(
		list(name = "full auto", burst=6, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/dt
	name = "DT-28 machine gun"
	desc = "Soviet machinegun. Uses 7.62x54mm rounds."
	icon_state = "dt28"
	base_icon = "dt28"
	caliber = "a762x54"
	magazine_type = /obj/item/ammo_magazine/dp
	good_mags = list(/obj/item/ammo_magazine/dp, /obj/item/ammo_magazine/dp/dt)
	firemodes = list(
		list(name = "full auto", burst=3, burst_delay=1.3, fire_delay=1.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/pkm
	name = "PKM machine gun"
	desc = "Soviet Heavy PKM machinegun. Uses 7.62x54mm rounds."
	icon_state = "pkm"
	base_icon = "pkm"
	caliber = "a762x54"
	magazine_type = /obj/item/ammo_magazine/pkm
	good_mags = list(/obj/item/ammo_magazine/pkm, /obj/item/ammo_magazine/pkm/c100, /obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "full auto", burst=3, burst_delay=1.3, fire_delay=1.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/dshk
	name = "DShK machine gun"
	desc = "Soviet Heavy DShK machinegun, can also be as anti vehicle gun against some lightly armored vehicles. Uses 12.7x108mm rounds."
	fire_sound = 'sound/weapons/guns/fire/ptrd.ogg'
	icon_state = "dshk"
	base_icon = "dshk"
	caliber = "a127"
	magazine_type = /obj/item/ammo_magazine/ammo127
	good_mags = list(/obj/item/ammo_magazine/ammo127)
	firemodes = list(
		list(name = "full auto", burst=2, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a127
	recoil = 10
	accuracy = 1

/obj/item/weapon/gun/projectile/automatic/stationary/modern/nsvt
	name = "NSVT machine gun"
	desc = "Modern Soviet Heavy NSVT machinegun, can also be as anti vehicle gun against some lightly armored vehicles. Uses 12.7x108mm rounds."
	fire_sound = 'sound/weapons/guns/fire/ptrd.ogg'
	zoom_amount = 18
	icon_state = "nsvt"
	base_icon = "nsvt"
	caliber = "a127"
	magazine_type = /obj/item/ammo_magazine/ammo127
	good_mags = list(/obj/item/ammo_magazine/ammo127)
	firemodes = list(
		list(name = "full auto", burst=1, burst_delay=0.8, recoil = 0),
	)
	ammo_type = /obj/item/ammo_casing/a127
	recoil = 15
	accuracy = 0

/obj/item/weapon/gun/projectile/automatic/stationary/modern/foldable
	anchored = TRUE
	var/path

/obj/item/weapon/gun/projectile/automatic/stationary/modern/foldable/verb/Retrieve()
	set category = null
	set name = "Retrieve"
	set src in range(1, usr)
	if (usr.l_hand && usr.r_hand)
		usr << "<span class = 'warning'>You need to have a hand free to do this.</span>"
		return
	usr.face_atom(src)

	visible_message("<span class = 'warning'>[usr] starts to get the [src] from the ground.</span>")
	if (do_after(usr, 40, get_turf(usr)))
		unload_ammo(usr)
		qdel(src)
		usr.put_in_any_hand_if_possible(new path, prioritize_active_hand = TRUE)
		visible_message("<span class = 'warning'>[usr] retrieves the [src] from the ground.</span>")

/obj/item/weapon/gun/projectile/automatic/stationary/modern/foldable/pkm
	name = "Foldable PKM machine gun"
	desc = "Soviet Heavy foldable PKM machinegun. Uses 7.62x54mm rounds."
	icon_state = "pkm_foldable"
	base_icon = "pkm_foldable"
	caliber = "a762x54"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/pkm
	good_mags = list(/obj/item/ammo_magazine/pkm, /obj/item/ammo_magazine/pkm/c100, /obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "full auto", burst=4, burst_delay=1.3, fire_delay=1.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 5
	accuracy = 2

	path = /obj/item/weapon/foldable/pkm

/obj/item/weapon/gun/projectile/automatic/stationary/modern/vickers
	name = "Vickers machine gun"
	desc = "A water-cooled heavy machinegun, using .303 british rounds."
	icon_state = "vickers"
	base_icon = "vickers"
	caliber = "a303"
	fire_sound = 'sound/weapons/guns/fire/Vickers.ogg'
	magazine_type = /obj/item/ammo_magazine/vickers
	good_mags = list(/obj/item/ammo_magazine/vickers)
	firemodes = list(
		list(name = "full auto", burst=6, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a303/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/hotchkiss1914
	name = "Hotchkiss M1914 machine gun"
	desc = "A french heavy machinegun, using 8x50mm Lebel rounds."
	icon_state = "hotchkiss1914"
	base_icon = "hotchkiss1914"
	caliber = "a8x50"
	magazine_type = /obj/item/ammo_magazine/hotchkiss
	good_mags = list(/obj/item/ammo_magazine/hotchkiss)
	ammo_type = /obj/item/ammo_casing/a8x50/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/type3
	name = "Type 3 machine gun"
	desc = "A japanese heavy machinegun based on the French Hotchkiss. Uses 6.5x50mm Arisaka rounds."
	icon_state = "type3"
	base_icon = "type3"
	caliber = "a65x50"
	magazine_type = /obj/item/ammo_magazine/type3
	good_mags = list(/obj/item/ammo_magazine/type3)
	ammo_type = /obj/item/ammo_casing/a65x50/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/type98
	name = "Type 92 machine gun"
	desc = "A japanese heavy machinegun. Uses 7.7x58mm Arisaka rounds."
	icon_state = "type92hmg"
	base_icon = "type92hmg"
	caliber = "a77x58"
	fire_sound = 'sound/weapons/guns/fire/Type92.ogg'
	magazine_type = /obj/item/ammo_magazine/type92
	good_mags = list(/obj/item/ammo_magazine/type92)
	firemodes = list(
		list(name = "full auto", burst=3, burst_delay=1.8, fire_delay=1.8, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a77x58
	attachment_slots = ATTACH_SCOPE
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/type98/update_icon()
	icon_state = "type92hmg[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 5) : "_empty"]"

/obj/item/weapon/gun/projectile/automatic/stationary/modern/browning
	name = "M1919A1 browning machine gun"
	desc = "An american heavy machinegun. Uses 30-06. rounds."
	icon_state = "browning"
	base_icon = "browning"
	caliber = "a3006"
	fire_sound = 'sound/weapons/guns/fire/M1919.ogg'
	magazine_type = /obj/item/ammo_magazine/browning
	good_mags = list(/obj/item/ammo_magazine/browning)
	firemodes = list(
		list(name = "full auto", burst=5, burst_delay=1.8, fire_delay=1.1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a3006
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/browning/update_icon()
	icon_state = "browning[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 50) : "_empty"]"

/obj/item/weapon/gun/projectile/automatic/stationary/modern/m2browning
	name = "M2HB browning machine gun"
	desc = "An american heavy machinegun. Uses .50 cal rounds."
	icon_state = "m2"
	base_icon = "m2"
	caliber = "a50cal"
	fire_sound = 'sound/weapons/guns/fire/M1919.ogg'
	magazine_type = /obj/item/ammo_magazine/a50cal_can
	good_mags = list(/obj/item/ammo_magazine/a50cal_can)
	firemodes = list(
		list(name = "full auto", burst=5, burst_delay=1.8, fire_delay=1.1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a50cal/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg34
	name = "MG 34 machine gun"
	desc = "A german heavy machinegun, using 7.92x57 Mauser rounds."
	icon_state = "mg34hmg"
	base_icon = "mg34hmg"
	caliber = "a792x57"
	magazine_type = /obj/item/ammo_magazine/mg34belt
	good_mags = list(/obj/item/ammo_magazine/mg34belt, /obj/item/ammo_magazine/mg34)
	firemodes = list(
		list(name = "full auto", burst=4, burst_delay=1, fire_delay=1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	recoil = 5
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/modern/mg3
	name = "MG 3 machine gun"
	desc = "A german heavy machinegun, using 7.62x51 NATO rounds."
	icon_state = "mg3hmg"
	base_icon = "mg3hmg"
	caliber = "a792x57"
	magazine_type = /obj/item/ammo_magazine/mg3belt
	good_mags = list(/obj/item/ammo_magazine/mg3belt)
	firemodes = list(
		list(name = "full auto", burst=4, burst_delay=1, fire_delay=1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x51/weak
	recoil = 5
	accuracy = 2

// Autocannons

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon
	name = "30mm Autocannon"
	desc = "An autocannon capable of firing 600 rounds a minute! It fires 30mm rounds."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/autocannon_ap
	good_mags = list(/obj/item/ammo_magazine/autocannon_ap, /obj/item/ammo_magazine/autocannon_he)
	firemodes = list(
		list(name = "single shot", burst=1, fire_delay=1, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	is_hmg = TRUE
	full_auto = FALSE
	recoil = 5
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/process_projectile(obj/projectile, mob/user, atom/target, var/target_zone, var/params=null)
	var/obj/item/projectile/P = projectile
	P.loc = get_turf(user)
	P.dispersion = clamp(rand(-accuracy, accuracy), -30, 30)
	if(!P.launch(target, user, src))
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/bushmaster
	name = "25mm M242 'Bushmaster' Autocannon"
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a25"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/autocannon_ap
	good_mags = list(/obj/item/ammo_magazine/autocannon_ap/m242ap, /obj/item/ammo_magazine/autocannon_he/m242he)
	firemodes = list(
		list(name = "full auto", burst=1, burst_delay=1.1, fire_delay=3, accuracy=list(2))
		)
	//ammo_type = /obj/item/ammo_casing/a25mm_ap

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/shipunov
	name = "30mm 2A42 'Shipunov' Autocannon"
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/autocannon_ap
	good_mags = list(/obj/item/ammo_magazine/autocannon_ap, /obj/item/ammo_magazine/autocannon_he)
	firemodes = list(
		list(name = "full auto", burst=1, burst_delay=1.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/shipunov2a72 // BTR-80
	name = "Shipunov 2A72 30mm autocannon"
	desc = "A lighter simplified variant of the 2A42 with a lower number of parts, a longer barrel, and higher muzzle velocity, but also a lower rate of fire. It fires 30mm rounds."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/autocannon_ap
	good_mags = list(/obj/item/ammo_magazine/autocannon_ap, /obj/item/ammo_magazine/autocannon_he)
	firemodes = list(
		list(name = "full auto", burst=1, burst_delay=2, fire_delay=2.5, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	full_auto = TRUE

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/red
	name = "30mm Autocannon"
	desc = "An autocannon capable of firing 20 rounds per minute."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/autocannon_ap
	good_mags = list(/obj/item/ammo_magazine/autocannon_ap, /obj/item/ammo_magazine/autocannon_ap/small, /obj/item/ammo_magazine/autocannon_he, /obj/item/ammo_magazine/autocannon_he/small)
	firemodes = list(
		list(name = "single shot", burst=1, fire_delay=2, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	is_hmg = TRUE
	full_auto = FALSE

// ATGMs

/obj/item/weapon/gun/projectile/automatic/stationary/atgm
	name = "Stationary ATGM"
	desc = "An ATGM system capable of taking out armored targets. This one is firmly bolted to the ground."
	icon_state = "atgm"
	base_icon = "atgm"
	caliber = "rocket"
	fire_sound = 'sound/weapons/guns/fire/rpg7.ogg'
	load_method = SINGLE_CASING
	handle_casings = REMOVE_CASINGS
	magazine_type = /obj/item/ammo_magazine/mosin
	firemodes = list(
		list(name = "single shot", burst=1, fire_delay=20, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/rocket/atgm
	is_hmg = TRUE
	full_auto = FALSE
	anchored = TRUE

	var/atgm_ammo = /obj/item/ammo_casing/rocket/atgm
	var/max_rockets = 1
	var/list/rockets = new/list()
	var/release_force = 0
	var/throw_distance = 30

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/attackby(obj/item/I as obj, mob/user as mob)
	if (istype(I, atgm_ammo))
		if (rockets.len < max_rockets && do_after(user, load_delay, src, can_move = TRUE))
			user.remove_from_mob(I)
			I.loc = src
			rockets += I
			user.visible_message("[user] loads a rocket in the [src].","You load a rocket into the [src]")
			update_icon()
		else
			usr << "The ATGM cannot hold more rockets."

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/handle_click_empty(mob/user)
	if (rockets.len <= 0)
		if (user)
			user.visible_message("*click click*", "<span class='danger'>*click*</span>")
		else
			visible_message("*click click*")
		playsound(loc, 'sound/weapons/empty.ogg', 100, TRUE)

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/consume_next_projectile()
	if (rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/projectile/shell/missile/M = new I.projectile_type(src)
		playsound(get_turf(src), 'sound/weapons/guns/fire/rpg7.ogg', 100, TRUE)
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired an ATGM at [target].", key_name_admin(user))
	log_game("[key_name_admin(user)] used an ATGM at [target].")
	update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	projectile.loc = get_turf(user)

	if(istype(projectile, /obj/item/projectile/shell))
		var/obj/item/projectile/shell/P = projectile
		P.dir = SOUTH
		P.launch(target, user, src, 0, 0)
		return TRUE

	return FALSE

// Foldable ATGMs

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable
	name = "Foldable ATGM"
	desc = "An ATGM system capable of taking out armored targets. You can move this one around by right-clicking it and pressing 'Retrieve'"
	icon_state = "foldable_atgm"
	base_icon = "foldable_atgm"
	var/path = /obj/item/weapon/foldable/atgm

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable/verb/Retrieve()
	set category = null
	set name = "Retrieve"
	set src in range(1, usr)
	if (usr.l_hand && usr.r_hand)
		usr << "<span class = 'warning'>You need to have a hand free to do this.</span>"
		return
	usr.face_atom(src)
	visible_message("<span class = 'warning'>[usr] starts to get the [src] from the ground.</span>")
	if (do_after(usr, 40, get_turf(usr)))
		for (var/obj/item/ammo_casing/rocket/I in rockets)
			I.loc = get_turf(src)
			rockets -= I
		qdel(src)
		usr.put_in_any_hand_if_possible(new path, prioritize_active_hand = TRUE)
		visible_message("<span class = 'warning'>[usr] retrieves the [src] from the ground.</span>")
