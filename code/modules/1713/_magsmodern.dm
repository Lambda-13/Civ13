/obj/item/ammo_magazine/ak47
	name = "AK магазин (7.62x39mm). Заряжен Т-ПС-ПС"
	icon_state = "ak47"
	attached_icon_state = "ak47_magak"
	mag_type = MAGAZINE
	caliber = "a762x39"
	ammo_type = list(
		/obj/item/ammo_casing/a762x39/tracer,
		/obj/item/ammo_casing/a762x39,
		/obj/item/ammo_casing/a762x39,
	)
	max_ammo = 30
	weight = 0.7
	multiple_sprites = TRUE

/obj/item/ammo_magazine/sksm
	name = "SKS-M магазин (7.62x39mm)"
	icon_state = "sksm"
	attached_icon_state = "sksm_mag"
	mag_type = MAGAZINE
	caliber = "a762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 20
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ak74
	name = "AK-74 магазин (5.45x39mm). Заряжены Т-ПС-ПС-ПС"
	icon_state = "ak74"
	attached_icon_state = "ak74_magak"
	mag_type = MAGAZINE
	caliber = "a545x39"
	ammo_type = list(
		/obj/item/ammo_casing/a545x39/tracer,
		/obj/item/ammo_casing/a545x39,
		/obj/item/ammo_casing/a545x39,
		/obj/item/ammo_casing/a545x39,
	)
	max_ammo = 30
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ak74/rubber
	name = "AK-74 магазин (5.45x39mm Rubber)"
	icon_state = "ak74"
	mag_type = MAGAZINE
	caliber = "a545x39"
	ammo_type = /obj/item/ammo_casing/a545x39/rubber
	max_ammo = 30
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ak74/box
	name = "magazine box (5.45x39mm)"
	icon_state = "ak74"
	mag_type = MAGAZINE
	caliber = "a545x39"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 65
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/ak101
	name = "AK-101 магазин (5.46x45mm). Заряжены T-FMJ-FMJ"
	icon_state = "ak47"
	attached_icon_state = "ak74m_magak"
	mag_type = MAGAZINE
	caliber = "a556x45"
	ammo_type = list(
		/obj/item/ammo_casing/a556x45/tracer,
		/obj/item/ammo_casing/a556x45,
		/obj/item/ammo_casing/a556x45,
	)
	max_ammo = 30
	weight = 0.35
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ak74/ak74m
	name = "AK-74M магазин (5.45x39mm). Заряжены Т-ПС-ПС-ПС"
	icon_state = "ak74m"
	attached_icon_state = "ak74m_magak"

/obj/item/ammo_magazine/bx7
	name = "BX-7 (.50 caliber)"
	icon_state = "bx7"
	mag_type = MAGAZINE
	caliber = "a50cal"
	ammo_type = /obj/item/ammo_casing/a50cal
	max_ammo = 20
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ak47/makeshift
	name = "самодельный магазин для AK-47 (7.62x39mm)"
	icon_state = "ak74"
	attached_icon_state = "ak47_magmakeshift"
	mag_type = MAGAZINE
	caliber = "a762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 28
	weight = 0.6
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m16
	name = "STANAG (5.56x45mm). Заряжены T-FMJ-FMJ"
	icon_state = "m16"
	attached_icon_state = "m16_mag"
	mag_type = MAGAZINE
	caliber = "a556x45"
	ammo_type = list(
		/obj/item/ammo_casing/a556x45/tracer,
		/obj/item/ammo_casing/a556x45,
		/obj/item/ammo_casing/a556x45,
	)
	max_ammo = 30
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m16/mag5_60
	name = "MAG5-60 STANAG (5.56x45mm). Заряжены T-FMJ-FMJ"
	icon_state = "mag5_60"
	attached_icon_state = "mag5_60_mag"
	mag_type = MAGAZINE
	caliber = "a556x45"
	ammo_type = list(
		/obj/item/ammo_casing/a556x45/tracer,
		/obj/item/ammo_casing/a556x45,
		/obj/item/ammo_casing/a556x45,
	)
	max_ammo = 60
	weight = 1
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m16/box
	name = "патронная коробка (5.56x45mm). Заряжены FMJ"
	icon_state = "556x45"
	mag_type = MAGAZINE
	caliber = "a556x45"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 65
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/ar10
	name = "AR-10 магазин (7.62x51mm). Заряжены T-FMJ"
	icon_state = "m16"
	mag_type = MAGAZINE
	caliber = "a762x51"
	attached_icon_state = "ar10_mag"
	ammo_type = list(
		/obj/item/ammo_casing/a762x51/tracer,
		/obj/item/ammo_casing/a762x51,
	)
	max_ammo = 20
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m14
	name = "M14 магазин (7.62x51mm). Заряжены FMJ"
	icon_state = "m14"
	attached_icon_state = "m14_mag"
	mag_type = MAGAZINE
	caliber = "a762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 20
	weight = 0.45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m14box
	name = "патронная коробка (7.62x51mm)"
	icon_state = "762x51"
	mag_type = MAGAZINE
	caliber = "a762x51"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 65
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/hk
	name = "G3 магазин (7.62x51mm)"
	icon_state = "hk"
	mag_type = MAGAZINE
	caliber = "a762x51"
	attached_icon_state = "hk_mag"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 20
	weight = 0.45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/fal
	name = "FN Fal магазин (7.62x51mm)"
	icon_state = "fal"
	attached_icon_state = "fal_mag"
	mag_type = MAGAZINE
	caliber = "a762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 30
	weight = 0.45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/mk18
	name = "MK18 магазин (5.56mm NATO)"
	icon_state = "hk"
	attached_icon_state = "m16_mag"
	mag_type = MAGAZINE
	caliber = "a556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 30
	weight = 0.45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/scarh
	name = "SCAR-H магазин (7.62x51mm)"
	icon_state = "scarh"
	attached_icon_state = "scarh_mag"
	mag_type = MAGAZINE
	caliber = "a762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 20
	weight = 0.75
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ar12
	name = "AR-12 магазин (12gauge)"
	icon_state = "scarh"
	attached_icon_state = "ar12_mag"
	mag_type = MAGAZINE
	caliber = "12gauge"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 12
	weight = 0.75
	multiple_sprites = TRUE

/obj/item/ammo_magazine/saiga12
	name = "Saiga-12K магазин (12gauge buckshot)"
	icon_state = "type99redtape"
	attached_icon_state = "saiga12_mag"
	mag_type = MAGAZINE
	caliber = "12gauge"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 10
	weight = 0.75
	multiple_sprites = TRUE

/obj/item/ammo_magazine/saiga12/slug
	name = "Saiga-12K магазин (12gauge slug)"
	icon_state = "type99"
	ammo_type = /obj/item/ammo_casing/shotgun/slug
	multiple_sprites = TRUE

/obj/item/ammo_magazine/usas12
	name = "USAS-12 magazine (buckshot)"
	icon_state = "usas12"
	attached_icon_state = "usas12_mag"
	mag_type = MAGAZINE
	caliber = "12gauge"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 10
	weight = 0.75
	multiple_sprites = TRUE

/obj/item/ammo_magazine/usas12/slug
	name = "USAS-12 magazine (slug)"
	icon_state = "usas12slug"
	attached_icon_state = "usas12"
	ammo_type = /obj/item/ammo_casing/shotgun/slug
	multiple_sprites = TRUE

/obj/item/ammo_magazine/usas12drum
	name = "USAS-12 magazine (buckshot)"
	icon_state = "usas12drum"
	attached_icon_state = "usas12_drum"
	mag_type = MAGAZINE
	caliber = "12gauge"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 20
	weight = 1.50
	multiple_sprites = TRUE

/obj/item/ammo_magazine/usas12drum/slug
	name = "USAS-12 magazine (slug)"
	icon_state = "usas12drumslug"
	ammo_type = /obj/item/ammo_casing/shotgun/slug
	multiple_sprites = TRUE

/obj/item/ammo_magazine/pkm
	name = "ПKM пулемётная лента (7.62x54mmR). Заряжены ЛПС-Т-ЛПС-ПС"
	icon_state = "maximbelt"
	attached_icon_state = "belt_"
	mag_type = MAGAZINE
	caliber = "a762x54"
	w_class = ITEM_SIZE_LARGE
	ammo_type = list(
		/obj/item/ammo_casing/a762x54/weak,
		/obj/item/ammo_casing/a762x54/tracer,
		/obj/item/ammo_casing/a762x54/weak,
		/obj/item/ammo_casing/a762x54
	)
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/pkm/c100
	name = "короб для пулемётной ленты (7.62x54mmR). Заряжены ЛПС-Т-ЛПС-ПС"
	icon_state = "b762x54"
	attached_icon_state = "pkm_mag"
	mag_type = MAGAZINE
	caliber = "a762x54"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = list(
		/obj/item/ammo_casing/a762x54/weak,
		/obj/item/ammo_casing/a762x54/tracer,
		/obj/item/ammo_casing/a762x54/weak,
		/obj/item/ammo_casing/a762x54
	)
	max_ammo = 100
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ammo127
	name = "Ammo can (12.7x108mm). Заряжены  БС-БТ"
	icon_state = "b127"
	attached_icon_state = "pkm_mag"
	mag_type = MAGAZINE
	caliber = "a127"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = list(/obj/item/ammo_casing/a127, /obj/item/ammo_casing/a127/tracer)
	max_ammo = 50
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ammo127/box
	name = "Ammo Box (12.7x108mm). Заряжены  БС-БТ"
	icon_state = "ab127"
	mag_type = MAGAZINE
	caliber = "a127"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = list(/obj/item/ammo_casing/a127, /obj/item/ammo_casing/a127/tracer)
	max_ammo = 100
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/rpd
	name = "RPD барабанный (7.62x39). Заряжены  Т-ПС-ПС"
	icon_state = "rpd"
	attached_icon_state = "rpd_mag"
	mag_type = MAGAZINE
	caliber = "a762x39"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = list(
		/obj/item/ammo_casing/a762x39/tracer,
		/obj/item/ammo_casing/a762x39,
		/obj/item/ammo_casing/a762x39,
	)
	max_ammo = 100
	multiple_sprites = TRUE

/obj/item/ammo_magazine/rpk74
	name = "RPK-74 магазин (7.62x39). Заряжены Т-ПС-ПС"
	icon_state = "rpk74mag"
	attached_icon_state = "rpk74_mag"
	mag_type = MAGAZINE
	caliber = "a545x39"

	w_class = ITEM_SIZE_SMALL
	ammo_type = list(
		/obj/item/ammo_casing/a545x39/tracer,
		/obj/item/ammo_casing/a545x39,
		/obj/item/ammo_casing/a545x39,
	)
	max_ammo = 45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/rpk74/drum
	name = "RPK-74 барабанный (5.45x39). Заряжены Т-ПС-ПС"
	icon_state = "rpk74"
	attached_icon_state = "drum"
	mag_type = MAGAZINE
	caliber = "a545x39"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = list(
		/obj/item/ammo_casing/a545x39/tracer,
		/obj/item/ammo_casing/a545x39,
		/obj/item/ammo_casing/a545x39,
	)
	max_ammo = 75
	multiple_sprites = TRUE

/obj/item/ammo_magazine/rpk47
	name = "RPK-47 magazine (7.62x39mm). Заряжены Т-ПС"
	icon_state = "rpk47mag"
	attached_icon_state = "rpk47_mag"
	mag_type = MAGAZINE

	w_class = ITEM_SIZE_SMALL
	caliber = "a762x39"
	ammo_type = list(
		/obj/item/ammo_casing/a762x39/tracer,
		/obj/item/ammo_casing/a762x39,
	)
	max_ammo = 45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/rpk47/drum
	name = "RPK-47 drum (7.62x39mm). Заряжены Т-ПС"
	icon_state = "rpk47"
	attached_icon_state = "drum"
	mag_type = MAGAZINE
	caliber = "a762x39"
	ammo_type = list(
		/obj/item/ammo_casing/a762x39/tracer,
		/obj/item/ammo_casing/a762x39,
	)
	w_class = ITEM_SIZE_NORMAL
	max_ammo = 75
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m9beretta
	name = "Beretta M9 магазин (9x19mm)"
	icon_state = "m9beretta"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 15
	weight = 0.33
	multiple_sprites = TRUE


/obj/item/ammo_magazine/m9beretta/box
	name = "патронная коробка (9x19mm)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a9x19"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 60
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/jericho
	name = "Jericho 941 магазин (9x19mm)"
	icon_state = "m9beretta"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 16
	weight = 0.35
	multiple_sprites = TRUE

/obj/item/ammo_magazine/negev
	name = "Negev Belt (5.56x45mm)"
	icon_state = "b762"
	attached_icon_state = "negev_mag"
	mag_type = MAGAZINE
	caliber = "a556x45"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 150
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m249
	name = "патронная лента (5.56x45mm)"
	icon_state = "b762"
	attached_icon_state = "m249_mag"
	mag_type = MAGAZINE
	caliber = "a556x45"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 100
	multiple_sprites = TRUE

/obj/item/ammo_magazine/m24
	name = "клипса (7.62x51mm)"
	icon_state = "clip"
	attached_icon_state = "none"
	ammo_type = /obj/item/ammo_casing/a762x51
	caliber = "a762x51"
	max_ammo = 5
	weight = 0.045
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/p90
	name = "P90 магазин (5.7x28mm)"
	icon_state = "p90"
	attached_icon_state = "p90_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a57x28
	caliber = "a57x28"
	max_ammo = 50
	weight = 0.045
	multiple_sprites = TRUE

/obj/item/ammo_magazine/makarov
	name = "PM Makarov magazine (9x18mm)"
	icon_state = "m1911"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x18
	caliber = "a9x18"
	max_ammo = 8
	multiple_sprites = TRUE
/obj/item/ammo_magazine/makarov/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/aps
	name = "Stechkin APS magazine (9x18mm)"
	icon_state = "m1911" //temporary, to be changed
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x18
	caliber = "a9x18"
	max_ammo = 20
	multiple_sprites = TRUE
/obj/item/ammo_magazine/aps/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/glock17
	name = "G17 Glock (9x19mm)"
	icon_state = "glock17"
	attached_icon_state = "victor_mag"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 17
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/glock17/victor
	name = "Vector магазин (9x19mm)"
	icon_state = "glock17"
	attached_icon_state = "victor_mag"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 33
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/sti2011
	name = "STI 2011 магазин (9x19mm)"
	icon_state = "sti2011"
	mag_type = MAGAZINE
	caliber = "a45acp"
	ammo_type = /obj/item/ammo_casing/a45acp
	max_ammo = 14
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/sig250
	name = "SIG 250 магазин (9x19mm)"
	icon_state = "glock17"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 17
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/pl14
	name = "PL-14 (9x19mm)"
	icon_state = "p220"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 16
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/mp443
	name = "MP-443 (9x19mm)"
	icon_state = "glock17"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 17
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/uzi
	name = "Uzi магазин (9x19mm Parabellum)"
	icon_state = "uzi"
	attached_icon_state = "uzi_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	caliber = "a9x19"
	max_ammo = 25
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/mac10
	name = "MAC-10 магазин (.45 ACP)"
	icon_state = "mac10"
	attached_icon_state = "mac10_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45acp
	caliber = "a45acp"
	max_ammo = 30
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/tec9
	name = "TEC-9 (9x19mm Parabellum)"
	icon_state = "tec9"
	attached_icon_state = "tec9_mag"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 32
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/skorpion
	name = "Skorpion магазин (9x19mm Parabellum)"
	icon_state = "skorpion"
	attached_icon_state = "skorpion_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	caliber = "a9x19"
	max_ammo = 20
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/p220
	name = "P220 (.45)"
	icon_state = "p220"
	mag_type = MAGAZINE
	caliber = "a45"
	ammo_type = /obj/item/ammo_casing/a45
	max_ammo = 7
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/tommy
	name = "thompson (.45 ACP)"
	icon_state = "tommydrum"
	attached_icon_state = "thompson_drum"
	mag_type = MAGAZINE
	caliber = "a45acp"
	ammo_type = /obj/item/ammo_casing/a45acp
	max_ammo = 100
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/colthammerless
	name = "Colt Hammerless (.32)"
	icon_state = "glock17"
	mag_type = MAGAZINE
	caliber = "a32acp"
	ammo_type = /obj/item/ammo_casing/a32acp
	max_ammo = 8
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/colthammerless/a380acp
	name = "Colt Hammerless (.380)"
	icon_state = "glock17"
	mag_type = MAGAZINE
	caliber = "a380acp"
	ammo_type = /obj/item/ammo_casing/a380acp
	max_ammo = 7
	weight = 0.36
	multiple_sprites = TRUE

/obj/item/ammo_magazine/bergmann
	name = "bergmann (8x22mm)"
	icon_state = "bergmann_ammo"
	mag_type = MAGAZINE
	caliber = "c8mmnambu"
	ammo_type = /obj/item/ammo_casing/c8mmnambu
	max_ammo = 5
	weight = 0.33
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ar15
	name = "AR15 магазин (5.56x45mm)"
	icon_state = "m16"
	attached_icon_state = "m16_mag"
	mag_type = MAGAZINE
	caliber = "a556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 20
	weight = 0.5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/sks
	name = "клипса (7.62x39mm)"
	icon_state = "clip"
	caliber = "a762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 5
	weight = 0.04
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/ptrs
	name = "клипса (14.5x114mm)"
	icon_state = "clip"
	caliber = "a145"
	ammo_type = /obj/item/ammo_casing/a145_ap
	max_ammo = 5
	weight = 0.1
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/vintorez
	name = "VSS Vintorez магазин (9x39mm)"
	icon_state = "g43"
	attached_icon_state = "vss_mag"
	caliber = "a9x39"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x39
	max_ammo = 10
	weight = 0.32
	multiple_sprites = TRUE

/obj/item/ammo_magazine/srm
	name = "SR-3 magazine (9x39mm)"
	icon_state = "srm"
	attached_icon_state = "srm_mag"
	caliber = "a9x39"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x39
	max_ammo = 30
	weight = 0.45
	multiple_sprites = TRUE

/obj/item/ammo_magazine/srm/box
	name = "Ammo Box (9x39mm)"
	icon_state = "srm"
	ammo_type = /obj/item/ammo_casing/a9x39
	caliber = "a9x39"
	max_ammo = 100
	weight = 0.8
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/srm/srms
	name = "SR-3 small magazine (9x39mm)"
	icon_state = "srms"
	attached_icon_state = "srms_mag"
	caliber = "a9x39"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x39
	max_ammo = 20
	weight = 0.39
	multiple_sprites = TRUE

/obj/item/ammo_magazine/a50cal
	name = "heavy bullet pouch (.50 BMG)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a50cal
	caliber = "a50cal"
	max_ammo = 10
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/a50cal_ap
	name = "heavy bullet pouch (.50 BMG)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a50cal_ap
	caliber = "a50cal"
	max_ammo = 10
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/a50cal_he
	name = "heavy bullet pouch (.50 BMG HE)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a50cal_he
	caliber = "a50cal"
	max_ammo = 10
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/barrett
	name = "magazine (.50 BMG)"
	icon_state = "a50cal"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "a50cal"
	ammo_type = /obj/item/ammo_casing/a50cal
	max_ammo = 10
	multiple_sprites = TRUE

/obj/item/ammo_magazine/bamr_ap
	name = "BAM AP magazine (15x115mm)"
	icon_state = "bamgreen"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "a15115"
	ammo_type = /obj/item/ammo_casing/a15115_ap
	max_ammo = 5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/bamr_aphe
	name = "BAM HE magazine (15x115mm)"
	icon_state = "bamred"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "a15115"
	ammo_type = /obj/item/ammo_casing/a15115_aphe
	max_ammo = 5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/bamr
	name = "BAM magazine (15x115mm)"
	icon_state = "bam"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "a15115"
	ammo_type = /obj/item/ammo_casing/a15115
	max_ammo = 5
	multiple_sprites = TRUE

/obj/item/ammo_magazine/ptrd_pouch
	name = "heavy bullet pouch (14.5x114mm)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a145
	caliber = "a145"
	max_ammo = 6
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/ptrd_pouch/ap
	name = "heavy bullet pouch (14.5x114mm AP)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a145_ap
	caliber = "a145"
	max_ammo = 6
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/ptrd_box
	name = "14.5x114mm cartridge box"
	icon_state = "145x114"
	ammo_type = /obj/item/ammo_casing/a145
	caliber = "a145"
	max_ammo = 20
	weight = 0.8
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/ptrd_box/ap
	name = "14.5x114mm AP cartridge box"
	icon_state = "145x114AP"
	ammo_type = /obj/item/ammo_casing/a145_ap
	caliber = "a145"
	max_ammo = 20
	weight = 0.8
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/pzb_case
	name = "7.92x94mm case"
	icon_state = "pzb39"
	ammo_type = /obj/item/ammo_casing/a792x94
	mag_type = MAGAZINE
	caliber = "a792x94"
	max_ammo = 10
	weight = 0.8
	multiple_sprites = TRUE

/obj/item/ammo_magazine/pzb_case_ap
	name = "7.92x94mm AP case"
	icon_state = "pzb39"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a792x94_ap
	caliber = "a792x94_ap"
	max_ammo = 10
	weight = 0.8
	multiple_sprites = TRUE

/obj/item/ammo_magazine/pzb_pouch
	name = "heavy bullet pouch (7.92x94mm)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a792x94
	caliber = "a792x94"
	max_ammo = 6
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/pzb_pouch_ap
	name = "heavy bullet pouch (7.92x94mm AP)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/a792x94_ap
	caliber = "a792x94"
	max_ammo = 6
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/a50cal_can
	name = ".50 BMG ammo can"
	icon_state = "b762x51"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a50cal/weak
	caliber = "a50cal"
	max_ammo = 150
	weight = 0.8
	multiple_sprites = TRUE
	belt = TRUE

///////////c6//////////
/obj/item/ammo_magazine/c6belt
	name = "C6 GPMG ammo belt"
	icon_state = "maximbelt"
	attached_icon_state = "belt_"
	mag_type = MAGAZINE
	caliber = "a762x51"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 110
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/c6can
	name = "C6 GPMG ammo can"
	icon_state = "b762x51"
	attached_icon_state = "c6_mag"
	mag_type = MAGAZINE
	caliber = "a762x51"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 220
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/qbz95
	name = "QBZ-95 магазин (5.8x42mm)"
	icon_state = "type99"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a58x42
	caliber = "a58x42"
	max_ammo = 30
	weight = 0.045
	multiple_sprites = TRUE

/obj/item/ammo_magazine/autocannon_ap
	name = "3UBR6 T-AP-HE ammo belt"
	icon_state = "maximbelt"
	worn_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a30"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_SHOULDER
	ammo_type = list(
		/obj/item/ammo_casing/a30mm_ap/tracer,
		/obj/item/ammo_casing/a30mm_ap,
		/obj/item/ammo_casing/frag/a30mm_he,
	)
	max_ammo = 200
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/autocannon_ap/small
	max_ammo = 10

/obj/item/ammo_magazine/autocannon_he
	name = "3UOR6 T-HE-HE ammo belt"
	icon_state = "maximbelt"
	worn_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a30"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_SHOULDER
	ammo_type = list(
		/obj/item/ammo_casing/a30mm_ap/tracer,
		/obj/item/ammo_casing/frag/a30mm_he,
		/obj/item/ammo_casing/frag/a30mm_he,
	)
	max_ammo = 200
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/autocannon_he/small
	max_ammo = 10

/obj/item/ammo_magazine/autocannon_he/m242he
	name = "M242 T-HE-HE ammo belt"
	caliber = "a25"
	ammo_type = list(
		/obj/item/ammo_casing/a25mm_ap/tracer,
		/obj/item/ammo_casing/a25mm_he,
		/obj/item/ammo_casing/a25mm_he,
	)

/obj/item/ammo_magazine/autocannon_ap/m242ap
	name = "M242 T-AP-HE ammo belt"
	caliber = "a25"
	ammo_type = list(
		/obj/item/ammo_casing/a25mm_ap/tracer,
		/obj/item/ammo_casing/a25mm_ap,
		/obj/item/ammo_casing/a25mm_he,
	)

/obj/item/ammo_magazine/flare
	name = "flare casing pouch (.50 BMG)"
	icon_state = "pouch_closed"
	ammo_type = /obj/item/ammo_casing/flare
	caliber = "flare"
	max_ammo = 8
	weight = 0.8
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/flare_pouch
	name = "flare pouch"
	desc = "A pouch for holding flares."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "flarepouch"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_POCKET|SLOT_BELT
	var/max = 6
	var/initial_amount = null
	var/opened = FALSE
	var/flare_type = null
	var/list/stored = list()

/obj/item/flare_pouch/verb/toggle_open()
	set category = null
	set src in view(1)
	set name = "Toggle Open"
	if (opened)
		opened=FALSE
		usr << "You close the [src]."
	else
		opened=TRUE
		usr << "You open the [src]."
	update_icon()
	return

/obj/item/flare_pouch/attack_hand(mob/user as mob)
	if (opened)
		if (stored.len > 0)
			var/obj/item/flashlight/flare/C = stored[stored.len]
			stored.len--
			user.put_in_hands(C)
			visible_message("[user] removes \a [C] from [src].", "<span class='notice'>You remove \a [C] from [src].</span>")
			update_icon()
			return
		else
			user << "<span class='warning'>[src] is empty.</span>"
			update_icon()
	else
		return ..()
	desc = "A pouch for holding flares. It currently holds [stored.len] flares."

/obj/item/flare_pouch/update_icon()
	if (!opened)
		icon_state = "[initial(icon_state)]"
	else
		if (stored.len > 0)
			icon_state = "[initial(icon_state)]-[stored.len]"
		else
			icon_state = "flarepouch-0"

/obj/item/flare_pouch/attackby(var/obj/item/W, mob/user as mob)
	if (W == src)
		return
	if (istype(W, flare_type))
		if (stored.len >= max)
			user << "<span class='warning'>[src] is full!</span>"
			return
		user.remove_from_mob(W)
		W.loc = src
		stored.Insert(1, W)
		update_icon()
	desc = "A pouch for holding flares. It currently holds [stored.len] flares."

/obj/item/flare_pouch/New()
	..()
	if (isnull(initial_amount) && flare_type != null)
		initial_amount = max

	if (initial_amount && flare_type != null)
		for (var/i in TRUE to initial_amount)
			stored += new flare_type(src)
	update_icon()

/obj/item/flare_pouch/normal_full
	flare_type = /obj/item/flashlight/flare

/obj/item/flare_pouch/white_full
	icon_state = "flarepouchW"
	flare_type = /obj/item/flashlight/flare/white