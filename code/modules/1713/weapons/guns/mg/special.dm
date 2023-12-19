/obj/item/weapon/gun/projectile/special
	force = 10
	throwforce = 20
	fire_sound = 'sound/weapons/guns/fire/smg.ogg'
	var/base_icon = "tactical"
	icon = 'icons/obj/guns/assault_rifles.dmi'
	// more accuracy than MGs, less than everything else
	load_method = MAGAZINE
	slot_flags = SLOT_SHOULDER|SLOT_BELT
	equiptimer = 13
	gun_safety = TRUE
	load_delay = 8
	gun_type = GUN_TYPE_RIFLE
	gtype = "smg"

	accuracy_increase_mod = 1.00
	accuracy_decrease_mod = 1.50
	KD_chance = KD_CHANCE_HIGH+5
	stat = "machinegun"
	w_class = ITEM_SIZE_NORMAL
	attachment_slots = ATTACH_SILENCER|ATTACH_IRONSIGHTS
	var/jammed_until = -1
	var/jamcheck = 0
	var/last_fire = -1

/obj/item/weapon/gun/projectile/special/special_check(mob/user)
	if (gun_safety && safetyon)
		user << "<span class='warning'>You can't fire \the [src] while the safety is on!</span>"
		return FALSE
	if (!user.has_empty_hand(both = FALSE))
		user << "<span class='warning'>You need both hands to fire \the [src]!</span>"
		return FALSE
	if (jammed_until > world.time)
		user << "<span class = 'danger'>\The [src] has jammed! You can't fire it until it has unjammed.</span>"
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/special/update_icon()
	if (sniper_scope)
		if (!ammo_magazine)
			icon_state = "[base_icon]_scope_open"
			return
		else
			icon_state = "[base_icon]_scope"
			return
	else
		if (ammo_magazine)
			icon_state = base_icon
			item_state = base_icon
		else
			icon_state = "[base_icon]_open"
			item_state = "[base_icon]_open"
	update_held_icon()

	return

/obj/item/weapon/gun/projectile/special/mk18
	name = "MK-18"
	desc = "An american automatic rifle."
	icon_state = "mk18"
	item_state = "mk18"
	base_icon = "mk18"
	weight = 3.97
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/assault_rifle.ogg'
	magazine_type = /obj/item/ammo_magazine/mk18
	good_mags = list(/obj/item/ammo_magazine/mk18)
	full_auto = TRUE
	equiptimer = 12
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.8, move_delay=2, dispersion = list(0.3, 0.4, 0.5, 0.6, 0.7)),
		list(name = "burst fire",	burst=3, burst_delay=1.4, move_delay=3, dispersion = list(1, 1.1, 1.1, 1.3, 1.5)),
		list(name = "full auto",	burst=1, burst_delay=1.3, move_delay=4, dispersion = list(1.2, 1.2, 1.3, 1.4, 1.8)),
		)
	sel_mode = 1
	effectiveness_mod = 1.40
	accuracy = 1
	recoil = 20

/obj/item/weapon/gun/projectile/special/ak74mtactical
	name = "Tactical AK-74M"
	desc = "A russian tactical rifle used by the Spetsnaz."
	icon_state = "ak74mtactical"
	item_state = "ak74mtactical"
	base_icon = "ak74mtactical"
	weight = 3.97
	caliber = "a545x39"
	fire_sound = 'sound/weapons/guns/fire/assault_rifle.ogg'
	magazine_type = /obj/item/ammo_magazine/ak74
	good_mags = list(/obj/item/ammo_magazine/rpk74, /obj/item/ammo_magazine/rpk74/drum, /obj/item/ammo_magazine/ak74, /obj/item/ammo_magazine/ak74/ak74m)
	full_auto = TRUE
	equiptimer = 12
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.8, move_delay=2, dispersion = list(0.3, 0.4, 0.5, 0.6, 0.7)),
		list(name = "burst fire",	burst=3, burst_delay=1.4, move_delay=3, dispersion = list(1, 1.1, 1.1, 1.3, 1.5)),
		list(name = "full auto",	burst=1, burst_delay=1.3, move_delay=4, dispersion = list(1.2, 1.2, 1.3, 1.4, 1.8)),
		)
	sel_mode = 1
	effectiveness_mod = 1.40
	accuracy = 1
	recoil = 20
