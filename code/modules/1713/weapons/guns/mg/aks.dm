/obj/item/weapon/gun/projectile/submachinegun/ak101
	name = "AK-101"
	desc = "A modern Russian AK variant, chambered in NATO 5.56x45mm."
	icon_state = "ak101"
	item_state = "ak101"
	base_icon = "ak101"
	weight = 3.6
	var/folded = FALSE
	effectiveness_mod = 1.11
	caliber = "a556x45"
	icon = 'icons/obj/guns/assault_rifles.dmi'
	fire_sound = 'sound/weapons/guns/fire/AKM.ogg'
	magazine_type = /obj/item/ammo_magazine/ak101
	good_mags = list(/obj/item/ammo_magazine/ak101, /obj/item/ammo_magazine/ak101/drum)
	equiptimer = 15
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.7, recoil=0, move_delay=2, dispersion = list(0.1, 0.2, 0, 0.1, 0.2)),
		list(name = "full auto",	burst=1, burst_delay=1.2, recoil=0, move_delay=4, dispersion = list(1.1, 1.2, 1.2, 1.3, 1.4)),
		)
	sel_mode = 1
	attachment_slots = ATTACH_SILENCER|ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_ADV_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	accuracy = 2
	recoil = 30

/obj/item/weapon/gun/projectile/submachinegun/ak101/update_icon()
	if (folded)
		icon_state = "[base_icon]_folded"
	else
		icon_state = "[base_icon]"

	overlays -= mag_image
	overlays -= scope_image

	var/part_icon = 'icons/obj/guns/parts.dmi'
	var/part_icon_state

	if (sniper_scope)
		part_icon_state = "pso1"
		if (istype(part_icon_state, /obj/item/weapon/attachment/scope/adjustable/sniper_scope))
			part_icon_state = "pso1"
		if (istype(part_icon_state, /obj/item/weapon/attachment/scope/adjustable/advanced/holographic))
			part_icon_state = "holographic"
		if (istype(part_icon_state, /obj/item/weapon/attachment/scope/adjustable/advanced/reddot))
			part_icon_state = "reddot"
		scope_image = image(icon = part_icon, loc = src, icon_state = part_icon_state)
		overlays += scope_image

	if (ammo_magazine)
		part_icon_state = "ak47_magak"
		if (istype(ammo_magazine, /obj/item/ammo_magazine/rpk47))
			part_icon_state = "ak47_magrpk"
		if (istype(ammo_magazine, /obj/item/ammo_magazine/rpk47/drum))
			part_icon_state = "ak47_drum"
		if (istype(ammo_magazine, /obj/item/ammo_magazine/ak74))
			part_icon_state = "ak74m_magak"
		if (istype(ammo_magazine, /obj/item/ammo_magazine/ak74/ak74m))
			part_icon_state = "ak74m_magak"
		if (istype(ammo_magazine, /obj/item/ammo_magazine/rpk74))
			part_icon_state = "ak74_magrpk"
		if (istype(ammo_magazine, /obj/item/ammo_magazine/rpk74/drum))
			part_icon_state = "ak74_drum"
		mag_image = image(icon = part_icon, loc = src, icon_state = part_icon_state)
		overlays += mag_image
	update_held_icon()

	return

/obj/item/weapon/gun/projectile/submachinegun/ak101/verb/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		usr << "You extend the stock on \the [src]."
		equiptimer = 15
		set_stock()
		update_icon()
	else
		folded = TRUE
		usr << "You collapse the stock on \the [src]."
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/ak101/proc/set_stock()
	if (folded)
		slot_flags = SLOT_SHOULDER|SLOT_BELT
		effectiveness_mod *= 0.85
	else
		slot_flags = SLOT_SHOULDER
		effectiveness_mod /= 0.85


/obj/item/weapon/gun/projectile/submachinegun/ak101/ak102
	name = "AK-102"
	desc = "A modern Russian AK variant, chambered in NATO 5.56x45mm. This is a carbine version of the AK-101."
	icon_state = "ak101"
	item_state = "ak74m"
	base_icon = "ak101"
	weight = 3
	effectiveness_mod = 1.09
	magazine_type = /obj/item/ammo_magazine/ak101
	good_mags = list(/obj/item/ammo_magazine/ak101, /obj/item/ammo_magazine/ak101/drum)
	equiptimer = 12
	accuracy = 3
	recoil = 35

/obj/item/weapon/gun/projectile/submachinegun/ak101/ak103
	name = "AK-103"
	desc = "A modern Russian AK variant, chambered in 7.62x39mm."
	icon_state = "ak101"
	item_state = "ak101"
	base_icon = "ak101"
	weight = 3.6
	effectiveness_mod = 1.08
	caliber = "a762x39"
	magazine_type = /obj/item/ammo_magazine/ak47
	good_mags = list(/obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/makeshift)
	equiptimer = 15
	accuracy = 2
	recoil = 40


/obj/item/weapon/gun/projectile/submachinegun/ak101/ak103/ak104
	name = "AK-104"
	desc = "A modern Russian AK variant, chambered in 7.62x39mm. This is a carbine version of the AK-103."
	icon_state = "ak101"
	item_state = "ak74m"
	base_icon = "ak101"
	weight = 3.2
	effectiveness_mod = 1.07
	equiptimer = 12
	accuracy = 3
	recoil = 45

/obj/item/weapon/gun/projectile/submachinegun/ak101/ak105
	name = "AK-105"
	desc = "A modern Russian AK variant, chambered in 5.45x39mm. This is a carbine version of the AK-74M."
	icon_state = "ak101"
	item_state = "ak74m"
	base_icon = "ak101"
	caliber = "a545x39"
	weight = 3.2
	effectiveness_mod = 1.12
	equiptimer = 12
	magazine_type = /obj/item/ammo_magazine/ak74
	good_mags = list(/obj/item/ammo_magazine/rpk74, /obj/item/ammo_magazine/rpk74/drum, /obj/item/ammo_magazine/ak74, /obj/item/ammo_magazine/ak74/ak74m)
	accuracy = 2
	recoil = 25

