/obj/item/ammo_magazine/arisaka99
	name = "клипса (7.7x58mm)"
	icon_state = "kclip"
	caliber = "a77x58"

	ammo_type = /obj/item/ammo_casing/a77x58
	max_ammo = 5
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/arisakabox99
	name = "патронная коробка (7.7x58mm)"
	icon_state = "arisaka_ammo"
	mag_type = MAGAZINE
	caliber = "a77x58"
	w_class = 3

	ammo_type = /obj/item/ammo_casing/a77x58
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/arisaka99_training
	name = "клипса (7.7x58mm)"
	icon_state = "kclip"
	caliber = "a77x58_wood"

	ammo_type = /obj/item/ammo_casing/a77x58_wood
	max_ammo = 5
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/type100
	name = "Type 100 Magazine"
	icon_state = "type100"
	mag_type = MAGAZINE
	caliber = "c8mmnambu"
	ammo_type = /obj/item/ammo_casing/c8mmnambu
	max_ammo = 30
	weight = 0.38
	multiple_sprites = TRUE

/obj/item/ammo_magazine/type99
	name = "Type-99 Magazine"
	icon_state = "type99"
	mag_type = MAGAZINE
	caliber = "a77x58"
	ammo_type = /obj/item/ammo_casing/a77x58
	max_ammo = 32
	weight = 0.40
	multiple_sprites = TRUE

/obj/item/ammo_magazine/type92
	name = "Type 92 ammo belt"
	icon_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a77x58"
	w_class = 4

	ammo_type = /obj/item/ammo_casing/a77x58
	max_ammo = 30
	multiple_sprites = TRUE
	var/slot = "decor"
	var/obj/item/clothing/under/has_suit = null		//the suit the tie may be attached to
	var/image/inv_overlay = null	//overlay used when attached to clothing.
	var/image/mob_overlay = null
	var/overlay_state = null

/obj/item/ammo_magazine/mp40
	name = "MP40 магазин (9x19mm)"
	icon_state = "mp40"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 32
	weight = 0.34
	multiple_sprites = TRUE

/obj/item/ammo_magazine/mp40/mp5
	name = "MP5 магазин (9x19mm)"
	icon_state = "mp5"

/obj/item/ammo_magazine/mg34
	name = "MG34 магазин (7.92x57mm)"
	icon_state = "mg34"
	mag_type = MAGAZINE
	caliber = "a792x57_weak"
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	max_ammo = 50
	weight = 0.34
	multiple_sprites = TRUE

/obj/item/ammo_magazine/greasegun
	name = "M3A1 магазин (.45 ACP)"
	icon_state = "greasegun"
	mag_type = MAGAZINE
	caliber = "a45acp"
	ammo_type = /obj/item/ammo_casing/a45acp
	max_ammo = 30
	weight = 0.4
	multiple_sprites = TRUE

/obj/item/ammo_magazine/greasegun/box
	name = "патронная коробка (.45 ACP)"
	icon_state = "oldbox"
	mag_type = MAGAZINE
	caliber = "a45acp"
	w_class = 3
	ammo_type = /obj/item/ammo_casing/a45acp
	max_ammo = 65
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/c762x25_pps
	name = "PPS-43 магазин (7.62x25mm)"
	icon_state = "pps"
	mag_type = MAGAZINE
	caliber = "a762x25"
	ammo_type = /obj/item/ammo_casing/a762x25
	max_ammo = 35
	weight = 0.56
	multiple_sprites = TRUE

/obj/item/ammo_magazine/c762x25_ppsh
	name = "PPSh-41 барабанный магазин (7.62x25mm)"
	icon_state = "ppsh"
	mag_type = MAGAZINE
	caliber = "a762x25"
	ammo_type = /obj/item/ammo_casing/a762x25
	max_ammo = 65
	weight = 1.3
	multiple_sprites = TRUE

obj/item/ammo_magazine/dp
	name = "барабанный магазин (7.62x54mmR)"
	icon_state = "dpdisk"
	mag_type = MAGAZINE
	caliber = "a762x54_weak"
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	max_ammo = 47
	weight = 0.40
	multiple_sprites = FALSE

/obj/item/ammo_magazine/stg
	name = "StG 44 магазин (7.92x33mm)"
	icon_state = "stg"
	mag_type = MAGAZINE
	caliber = "a792x33"
	ammo_type = /obj/item/ammo_casing/a792x33
	max_ammo = 30
	weight = 0.32
	multiple_sprites = TRUE

/obj/item/ammo_magazine/g43
	name = "G43 магазин (7.92x57mm)"
	icon_state = "g43"
	caliber = "a792x57"
	mag_type = MAGAZINE

	ammo_type = /obj/item/ammo_casing/a792x57
	max_ammo = 10
	weight = 0.32
	multiple_sprites = TRUE

/obj/item/ammo_magazine/svd
	name = "SVD магазин (7.62x54mmR)"
	icon_state = "g43"
	caliber = "a762x54"
	mag_type = MAGAZINE

	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 10
	weight = 0.32
	multiple_sprites = TRUE

/obj/item/ammo_magazine/avtomat
	name = "avtomat магазин (6.5x50mm)"
	icon_state = "g43"
	caliber = "a65x50"
	mag_type = MAGAZINE

	ammo_type = /obj/item/ammo_casing/a65x50
	max_ammo = 25
	weight = 0.44
	multiple_sprites = TRUE

/obj/item/ammo_magazine/svt
	name = "SVT-40 магазин (7.62x54mm)"
	icon_state = "svt"
	caliber = "a762x54"
	mag_type = MAGAZINE

	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 10
	weight = 0.3
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m1911
	name = "M1911 магазин (.45)"
	icon_state = "m1911"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45acp
	caliber = "a45acp"
	max_ammo = 7
	multiple_sprites = TRUE
/obj/item/ammo_magazine/m1911/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/a45acpbox
	name = "патронная коробка (.45)"
	icon_state = "oldbox"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45acp
	caliber = "a45acp"
	w_class = 3
	max_ammo = 30
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/tt30
	name = "TT-33 магазин (7.62x25mm)"
	icon_state = "m1911"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a762x25
	caliber = "a762x25"
	max_ammo = 8
	multiple_sprites = TRUE
/obj/item/ammo_magazine/tt30/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/tt30ll/rubber
	name = "TT-33 магазин (wooden)"
	icon_state = "m1911"
	mag_type = MAGAZINE
	ammo_type =  /obj/item/ammo_casing/a762x25/rubber
	caliber = "a762x25"
	max_ammo = 8
	multiple_sprites = TRUE
/obj/item/ammo_magazine/tt30/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/makarov
	name = "PM Makarov магазин (9x18mm)"
	icon_state = "m1911"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x18
	caliber = "a9x18"
	max_ammo = 8
	multiple_sprites = TRUE
/obj/item/ammo_magazine/makarov/empty/New()
	..()
	stored_ammo.Cut()


/obj/item/ammo_magazine/garand
	name = "клипса (30-06) на 8 патронов"
	icon_state = "g-clip"
	caliber = "a3006"

	ammo_type = /obj/item/ammo_casing/a3006
	max_ammo = 8
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/m3006box
	name = "патронная коробка (30-06)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a3006"
	w_class = 3
	ammo_type = /obj/item/ammo_casing/a3006
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/springfield
	name = "клипса (30-06)"
	icon_state = "clip"
	caliber = "a3006"

	ammo_type = /obj/item/ammo_casing/a3006
	max_ammo = 5
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/browning
	name = "лента с патронами Браунинг"
	icon_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a3006"
	w_class = 4

	ammo_type = /obj/item/ammo_casing/a3006
	max_ammo = 250
	multiple_sprites = TRUE
	var/slot = "decor"
	var/obj/item/clothing/under/has_suit = null		//the suit the tie may be attached to
	var/image/inv_overlay = null	//overlay used when attached to clothing.
	var/image/mob_overlay = null
	var/overlay_state = null

/obj/item/ammo_magazine/bar
	name = "BAR магазин (30-06)"
	icon_state = "bar"
	caliber = "a3006_weak"

	ammo_type = /obj/item/ammo_casing/a3006/weak
	max_ammo = 20
	weight = 0.038
	mag_type = MAGAZINE
	multiple_sprites = TRUE

/obj/item/ammo_magazine/thompson
	name = "Thompson магазин (.45)"
	icon_state = "thompson"
	caliber = "a45acp"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45acp
	max_ammo = 20
	multiple_sprites = TRUE

/obj/item/ammo_magazine/deagle
	name = "Desert eagle магазин (50cal)"
	icon_state = "deagle"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a50cal
	caliber = "a50cal"
	max_ammo = 7
	multiple_sprites = TRUE

/obj/item/ammo_magazine/deaglemagnum
	name = "Desert eagle магазин (44.magnum)"
	icon_state = "deagle"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a44magnum
	caliber = "a44magnum"
	max_ammo = 8
	multiple_sprites = TRUE

/obj/item/ammo_magazine/browninghp
	name = "Browning hi-power магазин (9mm Parabellum)"
	icon_state = "browning_hp"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	caliber = "a9x19"
	max_ammo = 13
	multiple_sprites = TRUE