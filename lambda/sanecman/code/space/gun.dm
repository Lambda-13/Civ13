/obj/item/ammo_magazine/tibannagas/space_war
	name = "ХУЙ"

/obj/item/weapon/gun/projectile/semiautomatic/laser/laser/lp40
	name = "ЛП-40"
	desc = "Икона Косморейха, поставляется повсеместно, работает почти безотказно."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "lp40"
	item_state = "lp40"
	base_icon = "lp40"
	weight = 3.97
	caliber = "laser"
	fire_sound = 'lambda/sanecman/sound/space/ml40.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/lp40
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/lp40)
	full_auto = TRUE
	equiptimer = 12
	firemodes = list(
		list(name = "full auto",	burst=1, burst_delay=1.1, recoil=0, move_delay=3, dispersion = list(0.7, 1.2, 1.2, 1.3, 1.5)),
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	sel_mode = 1
	effectiveness_mod = 1.05
	recoil = 25
	accuracy = 4
/obj/item/ammo_magazine/tibannagas/space_war/lp40
	name = "тибанновый блок питания LP40"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "lp40"
	mag_type = MAGAZINE
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser
	max_ammo = 32
	weight = 0.34
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/semiautomatic/laser/laser/pplsh
	name = "ППЛ-41"
	desc = "Пулемёт изобретённый Лазаровым на вид кажется старым но является достаточно мощным."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "pplsh"
	item_state = "pplsh"
	base_icon = "pplsh"
	caliber = "laser"
	fire_sound = 'lambda/sanecman/sound/space/pplsh.ogg'
	full_auto = TRUE
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/c762x25_pplsh
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/c762x25_pplsh)
	weight = 3.63
	equiptimer = 14
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.5, recoil=0, move_delay=1, dispersion = list(0.2, 0.4, 0.4, 0.4, 0.5)),
		list(name = "full auto",	burst=1, burst_delay=1.2, recoil=0, move_delay=3, dispersion = list(0.7, 1.2, 1.2, 1.3, 1.5)),
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	sel_mode = 1
	recoil = 20
	accuracy = 4

/obj/item/ammo_magazine/tibannagas/space_war/c762x25_pplsh
	name = "тибанновый блок питания ППЛ-41"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "pplsh"
	mag_type = MAGAZINE
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser/b
	max_ammo = 65
	weight = 1.3
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/semiautomatic/laser/laser/lg34
	name = "ЛГ-34"
	desc = "Немецкий автомат предназначенный для десанта."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "lg34"
	item_state = "lg34"
	base_icon = "lg34"
	weight = 4.2
	caliber = "laser"
	fire_sound = 'lambda/sanecman/sound/space/lg34.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/lg34
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/lg34)
	full_auto = TRUE
	equiptimer = 12
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.3, recoil=0, move_delay=1, dispersion = list(0.2, 0.4, 0.4, 0.4, 0.5)),
		list(name = "full auto",	burst=1, burst_delay=0.4, recoil=0, move_delay=3, dispersion = list(0.8, 1.3, 1.3, 1.4, 1.6)),
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	sel_mode = 1
	effectiveness_mod = 0.95
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_ADV_SCOPE
	recoil = 35
	accuracy = 4

/obj/item/weapon/gun/projectile/semiautomatic/laser/laser/lg34/scope/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/advanced/fg42/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/fg42(src)
	SP.attached(null,src,TRUE)

/obj/item/ammo_magazine/tibannagas/space_war/lg34
	name = "тибанновый блок питания ЛГ-34"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "lg34"
	mag_type = MAGAZINE
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser
	max_ammo = 20
	weight = 0.28
	multiple_sprites = TRUE


// Калаш
/obj/item/weapon/gun/projectile/semiautomatic/laser/laser/al47
	name = "АЛ-47"
	desc = "Автомат Лазарова является иконой Советской Республики."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "al47"
	item_state = "al47"
	base_icon = "al47"
	caliber = "laser"
	fire_sound = 'lambda/sanecman/sound/space/al47.ogg'
	reload_sound = 'lambda/sanecman/sound/space/reload.ogg'
	unload_sound = 'lambda/sanecman/sound/space/unload.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/al47
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/al47)
	weight = 2.93
	equiptimer = 12
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.8, move_delay=2, dispersion = list(0.2, 0.1, 0.2, 0.3, 0.1)),
		list(name = "full auto",	burst=1, burst_delay=1.3, move_delay=4, dispersion = list(1.2, 1.2, 1.3, 1.4, 1.8)),
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	effectiveness_mod = 1.20
	sel_mode = 1
	attachment_slots = ATTACH_SILENCER|ATTACH_IRONSIGHTS|ATTACH_BARREL
	recoil = 40
	accuracy = 2

/obj/item/ammo_magazine/tibannagas/space_war/al47
	name = "тибанновый магазин АЛ-47"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "al47"
	mag_type = MAGAZINE
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser/b
	max_ammo = 30
	weight = 0.7
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/semiautomatic/laser/laserez
	name = "ВЛС Лазерез"
	desc = "Винтовка лазерная специальная созданная в период существования Старой Советской Республики."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "laserez"
	item_state = "laserez"
	base_icon = "laserez"
	load_method = MAGAZINE
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser/b
	damage_modifier = 1.2
	w_class = ITEM_SIZE_LARGE
	fire_sound = 'lambda/sanecman/sound/space/laserez.ogg'
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/laserez
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/laserez)
	weight = 1.90
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=2, fire_delay=6)
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	gun_type = GUN_TYPE_RIFLE
	effectiveness_mod = 1.09
	equiptimer = 8
	attachment_slots = ATTACH_SILENCER|ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL

/obj/item/weapon/gun/projectile/semiautomatic/laser/laserez/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope(src)
	SP.attached(null,src,TRUE)

/obj/item/ammo_magazine/tibannagas/space_war/laserez
	name = "тибанновый блок питания ВЛС Лазерез"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "laserez"
	caliber = "laser"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/laser/b
	max_ammo = 10
	weight = 0.32
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/semiautomatic/laser/l43
	name = "Лаз 43"
	desc = "Немецкая полуавтоматическая винтовка."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "l43"
	item_state = "l43"
	base_icon = "l43"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	max_shells = 10
	load_delay = 8
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/Garand.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/laser
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/l43
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/l43)
	weight = 4.9
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=2, fire_delay=6)
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_SILENCER|ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	effectiveness_mod = 1.06

/obj/item/ammo_magazine/tibannagas/space_war/l43
	name = "тибанновый блок питания Лаз 43"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "l43"
	caliber = "laser"
	mag_type = MAGAZINE

	ammo_type = /obj/item/ammo_casing/laser
	max_ammo = 10
	weight = 0.32
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/pistol/laser/lazganov
	name = "Лазганов"
	desc = "Пистолет Лазганова является чудом Советской инженерии."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "lazganov"
	w_class = ITEM_SIZE_SMALL
	caliber = "laser"
	fire_sound = 'lambda/sanecman/sound/space/lazganov.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/lazganov
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/lazganov)
	weight = 0.704
	ammo_type = /obj/item/ammo_casing/laser/b
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	effectiveness_mod = 0.98
	bad_magazine_types = list(/obj/item/ammo_magazine/tibannagas/space_war/c762x25_pplsh)

/obj/item/weapon/gun/projectile/pistol/laser/lazganov/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "lazganov"
	else
		icon_state = "lazganov_open"
	return

/obj/item/ammo_magazine/tibannagas/space_war/lazganov
	name = "тибанновый блок питания Лазганова"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "lazganov"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/laser/b
	caliber = "laser"
	max_ammo = 8
	multiple_sprites = TRUE



/obj/item/weapon/gun/projectile/pistol/laser/laserp38
	name = "Лазгер П38"
	desc = "Лазгер Проекта 38 является пистолетом немецкой разработкой."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	icon_state = "laserp38"
	w_class = ITEM_SIZE_SMALL
	caliber = "laser"
	fire_sound = 'lambda/sanecman/sound/space/laserp38.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/laserp38
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/laser
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	effectiveness_mod = 0.96
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/laserp38)
	bad_magazine_types = list(/obj/item/ammo_magazine/tibannagas/space_war/lp40)

/obj/item/weapon/gun/projectile/pistol/laser/laserp38/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "laserp38"
	else
		icon_state = "laserp38_open"
	return

/obj/item/ammo_magazine/tibannagas/space_war/laserp38
	name = "тибанновый блок питания Лазгера П38"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "laserp38"
	mag_type = MAGAZINE
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser
	max_ammo = 8
	weight = 0.02
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/semiautomatic/laser/lshk
	name = "пулемёт ЛСК"
	desc = "Тяжёлый пулемёт ЛСК, питается от старого способа подключения блока питания через интерфейс платы."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	fire_sound = 'lambda/sanecman/sound/space/lshk.ogg'
	icon_state = "lshk"
	base_icon = "lshk"
	caliber = "laser"
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/lshk
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/lshk)
	firemodes = list(
		list(name = "full auto", burst=2, burst_delay=2, fire_delay=2, dispersion=list(0.8, 0.9, 1.0, 1.2, 1.3), accuracy=list(2))
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	ammo_type = /obj/item/ammo_casing/laser/b
	recoil = 25
	accuracy = 1

/obj/item/ammo_magazine/tibannagas/space_war/lshk
	name = "тибанновый блок питания пулемёта ЛСК"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "lshk"
	mag_type = MAGAZINE
	caliber = "laser"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/laser/b
	max_ammo = 200
	multiple_sprites = TRUE


/obj/item/weapon/gun/projectile/semiautomatic/laser/lg42
	name = "ЛГ-42"
	desc = "Улучшенная Косморейхом модель пулемёта ЛСК."
	icon = 'lambda/sanecman/icons/obj/guns/space.dmi'
	fire_sound = 'lambda/sanecman/sound/space/lg42.ogg'
	icon_state = "lg42"
	base_icon = "lg42"
	caliber = "laser"
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/lg42
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/lg42)
	firemodes = list(
		list(name = "full auto", burst=2, burst_delay=2, fire_delay=2, dispersion=list(0.3, 0.4, 0.7, 0.9, 1.2), accuracy=list(2))
		)
	item_icons = list(
		slot_l_hand_str = 'lambda/sanecman/icons/mob/space/lefthand_weapons.dmi',
		slot_r_hand_str = 'lambda/sanecman/icons/mob/space/righthand_weapons.dmi',
		slot_back_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		slot_shoulder_str = 'lambda/sanecman/icons/mob/space/shoulder_weapons.dmi',
		)
	ammo_type = /obj/item/ammo_casing/laser
	recoil = 25
	accuracy = 1

/obj/item/ammo_magazine/tibannagas/space_war/lg42
	name = "тибанновый блок питания ЛГ-42"
	icon = 'lambda/sanecman/icons/obj/guns/space_ammo.dmi'
	icon_state = "lg42"
	mag_type = MAGAZINE
	caliber = "laser"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/laser
	max_ammo = 200
	multiple_sprites = TRUE






/*
/obj/item/weapon/gun/projectile/automatic/laser/lasgun
	name = "Lasgun"
	desc = "The standard lasgun used by the imperial gaurd."
	icon = 'icons/obj/guns/wip.dmi'
	icon_state = "lasgunm36"
	item_state = "lasgunm36"
	base_icon = "lasgunm36"
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/lasgun.ogg'
	ammo_type = /obj/item/ammo_casing/laser
	magazine_type = /obj/item/ammo_magazine/tibannagas/space_war/tibannagas/lascgun
	good_mags = list(/obj/item/ammo_magazine/tibannagas/space_war/tibannagas/lasgun)
	firemodes = list(
		list(name = "semi auto",	burst=1, burst_delay=0.7, recoil=0, move_delay=2, dispersion = list(0.2, 0.4, 0.4, 0.5, 0.6)),
		list(name = "full auto",	burst=1, burst_delay=1.2, recoil=0, move_delay=4, dispersion = list(1.1, 1.2, 1.3, 1.3, 1.5)),
		)
	weight = 3.08
	force = 20
	throwforce = 30
	attachment_slots = ATTACH_BARREL
	slowdown = 0.2
	has_telescopic = FALSE
	slot_flags = SLOT_SHOULDER
*/