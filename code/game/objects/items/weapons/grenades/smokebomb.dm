/obj/item/weapon/grenade/smokebomb
	name = "дымовая граната"
	desc = "Пускает дым, взорвётся через 2 секунды."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "smoke_grenade"
	det_time = 20
	item_state = "smoke_grenade"
	slot_flags = SLOT_BELT
	armsound = 'lambda/sanecman/sound/grenade/generic_checkout_2.ogg'
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/weapon/grenade/smokebomb/New()
	..()
	smoke = PoolOrNew(/datum/effect/effect/system/smoke_spread/bad)
	smoke.attach(src)

/obj/item/weapon/grenade/smokebomb/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/weapon/grenade/smokebomb/prime()
	if (active)
		playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		smoke.set_up(10, FALSE, usr ? usr.loc : loc)
		spawn(0)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()

		sleep(80)
		qdel(src)
		return

/obj/item/weapon/grenade/smokebomb/fast_activate()
	spawn(round(det_time/10))
		visible_message(SPAN_WARNING("[src] испускает дым!"))
		active = TRUE
		prime()

/obj/item/weapon/grenade/smokebomb/m18smoke
	name = "дымовая граната M18"
	desc = "Дымовая граната, взорвётся через 3 секунды."
	icon_state = "m18smoke"
	det_time = 30
	item_state = "m18smoke"

/obj/item/weapon/grenade/smokebomb/rdg1
	desc = "It is set to detonate in 4 seconds."
	name = "RDG-1 smoke grenade"
	icon_state = "rdg1"
	det_time = 40
	item_state = "rdg1"

/obj/item/weapon/grenade/smokebomb/rdg2
	desc = "It is set to detonate in 3 seconds."
	name = "RDG-2 smoke grenade"
	icon_state = "rdg2"
	det_time = 30
	item_state = "rdg2"

//////////Signal Smoke//////////////////////////////////////////

/obj/item/weapon/grenade/smokebomb/signal
	name = "дымовая сигнальная граната M18"
	desc = "Дымовая граната, взорвётся через 5 секунды. Вертолет сбросит на место активации гранаты ящик с припасами."
	icon_state = "m18smoke_purple"
	det_time = 50
	item_state = "m18smoke_purple"
	var/smoke_color = /datum/effect/effect/system/smoke_spread/purple
	var/triggered = FALSE

/obj/item/weapon/grenade/smokebomb/signal/New()
	..()
	smoke = PoolOrNew(smoke_color)
	smoke.attach(src)

/obj/item/weapon/grenade/smokebomb/signal/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/weapon/grenade/smokebomb/signal/attack_self(mob/living/human/user as mob)
	if (!active)
		if (user.faction_text == "AMERICAN")
			if (time_of_day != "Night")
				var/list/options = list()
				options["Ammunition"] = list(/obj/structure/closet/crate/ww2/vietnam/us_ammo)
				options["Medical supplies"] = list(/obj/structure/closet/crate/ww2/vietnam/us_medical)
				options["Explosives"] = list(/obj/structure/closet/crate/ww2/vietnam/us_explosives)
				options["Engineering supplies"] = list(/obj/structure/closet/crate/ww2/vietnam/us_engineering)
				options["AP mines"] = list(/obj/structure/closet/crate/ww2/vietnam/us_ap_mines)
				var/choice = input(user,"What type of supply drop?") as null|anything in options
				if(src && choice)
					var/list/things_to_spawn = options[choice]
					for(var/new_type in things_to_spawn)
						user << "<span class='warning'>Активирую [name]! [det_time/10] до взрыва!</span>"
						firer = user
						activate(user)
						add_fingerprint(user)
						if (ishuman(user))
							var/mob/living/human/H = user
							if(istype(H) && !H.in_throw_mode)
								H.throw_mode_on()
						triggered = TRUE
						sleep(500)
						new new_type(get_turf(src))
			else
				visible_message("<span class = 'danger'>Нет достаточной видимости дыма для падения ящиков снабжения!</span>")
		else if (user.faction_text == "DUTCH")
			if (time_of_day != "Night")
				var/list/options = list()
				options["Ammunition"] = list(/obj/structure/closet/crate/ww2/un/m16ammo)
				options["Medical supplies"] = list(/obj/structure/closet/crate/ww2/airdrops/medical)
				options["Engineering supplies"] = list(/obj/structure/closet/crate/ww2/airdrops/engineering)
				options["Area denial"] = list(/obj/structure/closet/crate/ww2/airdrops/ap)
				var/choice = input(user,"Что заказываем?") as null|anything in options
				if(src && choice)
					var/list/things_to_spawn = options[choice]
					for(var/new_type in things_to_spawn)
						user << "<span class='warning'>Активирую [name]! [det_time/10] секунд до пуска дыма!</span>"
						firer = user
						activate(user)
						add_fingerprint(user)
						if (ishuman(user))
							var/mob/living/human/H = user
							if(istype(H) && !H.in_throw_mode)
								H.throw_mode_on()
						triggered = TRUE
						sleep(500)
						new new_type(get_turf(src))
			else
				visible_message("<span class = 'danger'>Нет достаточной видимости дыма для падения ящиков снабжения!</span>")
		else if (user.faction_text == "RUSSIAN")
			if (time_of_day != "Night")
				var/list/options = list()
				options["Ammunition"] = list(/obj/structure/closet/crate/ww2/russian/ammo)
				options["Medical supplies"] = list(/obj/structure/closet/crate/ww2/airdrops/medical)
				options["Engineering supplies"] = list(/obj/structure/closet/crate/ww2/airdrops/engineering)
				options["Area denial"] = list(/obj/structure/closet/crate/ww2/airdrops/ap)
				var/choice = input(user,"Что заказываем?") as null|anything in options
				if(src && choice)
					var/list/things_to_spawn = options[choice]
					for(var/new_type in things_to_spawn)
						user << "<span class='warning'>Активирую [name]! [det_time/10] секунд до пуска дыма!</span>"
						firer = user
						activate(user)
						add_fingerprint(user)
						if (ishuman(user))
							var/mob/living/human/H = user
							if(istype(H) && !H.in_throw_mode)
								H.throw_mode_on()
						triggered = TRUE
						sleep(500)
						new new_type(get_turf(src))
			else
				visible_message("<span class = 'danger'>Нет достаточной видимости дыма для падения ящиков снабжения!</span>")
		else
			firer = user
			activate(user)
			add_fingerprint(user)
			if (ishuman(user))
				var/mob/living/human/H = user
				if(istype(H) && !H.in_throw_mode)
					H.throw_mode_on()

/obj/item/weapon/grenade/smokebomb/signal/prime(mob/living/human/user as mob)
	if (active)
		if (user)
			playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
			smoke.set_up(5, FALSE, usr ? usr.loc : loc)
			spawn(0)
				smoke.start()
			if (triggered)
				sleep(300)
				if (time_of_day != "Night")
					world << "Слышу как летит вертолёт..."
					if (map.ID == "ROAD_TO_DAK_TO" || map.ID == "COMPOUND" || map.ID == "HUE" || map.ID == "ONG_THAHN")
						playsound(get_turf(src), 'sound/effects/aircraft/uh1.ogg', 100, TRUE, extrarange = 70)
						sleep(200)
						visible_message(SPAN_NOTICE("Вертолёт \"Ирокез\" сбросил на место дыма ящик с припасами."))
					else if (user.faction_text == "RUSSIAN")
						playsound(get_turf(src), 'sound/effects/aircraft/mi8.ogg', 100, TRUE, extrarange = 70)
						sleep(200)
						visible_message(SPAN_NOTICE("Вертолёт Ми-8 сбросил на место дыма ящик с припасами."))
					else if (user.faction_text == "DUTCH")
						playsound(get_turf(src), 'sound/effects/aircraft/ch47.ogg', 100, TRUE, extrarange = 70)
						sleep(200)
						visible_message(SPAN_NOTICE("Самолёт Боинг-747 сбросил на место дыма ящик с припасами."))
					else
						playsound(get_turf(src), 'sound/effects/aircraft/uh60.ogg', 100, TRUE, extrarange = 70)
						sleep(200)
						visible_message(SPAN_NOTICE("Вертолёт \"Блэк Хоук\" сбросил на место дыма ящик с припасами."))
			sleep(20)
			qdel(src)
			return

/obj/item/weapon/grenade/smokebomb/signal/fast_activate()
	spawn(round(det_time/10))
		visible_message(SPAN_WARNING("[src] испускает сигнальный дым!"))
		active = TRUE
		prime()
///////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/grenade/smokebomb/signal/rdg2_yellow
	desc = "It is set to detonate in 5 seconds. A helicopter will drop a crate of supplies at its location."
	name = "RDG-2 yellow signal smoke grenade (supplies)"
	icon_state = "rdg2_yellow"
	det_time = 50
	item_state = "rdg2_yellow"
	smoke_color = /datum/effect/effect/system/smoke_spread/yellow

/obj/item/weapon/grenade/smokebomb/signal/m18_red
	desc = "It is set to detonate in 5 seconds. A helicopter will drop a crate of supplies at its location."
	name = "M18 signal smoke grenade (supplies)"
	icon_state = "m18smoke_red"
	det_time = 50
	item_state = "m18smoke_red"
	smoke_color = /datum/effect/effect/system/smoke_spread/red

///////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/grenade/incendiary
	name = "зажигательная граната"
	desc = "Поджигает вокруг себя всё, взорвётся через 6 секунд."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "incendiary"
	det_time = 60
	item_state = "incendiary"
	slot_flags = SLOT_BELT
	var/spread_range = 2

/obj/item/weapon/grenade/incendiary/incendiarydetonator
	name = "термальный детонатор типа \"А\""
	desc = "Созданый по заказу БласТех Индастриз, данная термальная граната может уничтожить всё вокруг себя в довольно большом радиусе. Данная версия гранаты помимо взрыва ещё и поджигает всё вокруг благодаря большому количеству барадия внутри неё."
	icon_state = "detonator"
	det_time = 35
	throw_range = 12

/obj/item/weapon/grenade/incendiary/anm14
	name = "зажигательная граната AN/M14"

/obj/item/weapon/grenade/incendiary/prime()
	if (active)
		var/turf/LT = get_turf(src)

		playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		explosion(LT,0,1,1,3)

		if (!ismob(loc))
			for (var/turf/floor/T in circlerangeturfs(spread_range, LT))
				ignite_turf(T, 12, 35)
		else
			ignite_turf(LT, 12, 90)
		spawn(5)
			qdel(src)

/obj/item/weapon/grenade/incendiary/fast_activate()
	spawn(round(det_time/10))
		visible_message(SPAN_WARNING("[src] испускает жгучий дым!</span>"))
		active = TRUE
		prime()


/obj/item/weapon/grenade/chemical
	name = "химическая граната"
	desc = "Пускает газ, взорвётся через 5 секунд."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "smoke_generic"
	det_time = 50
	item_state = "smoke_generic"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/bad/smoke
	var/stype = /datum/effect/effect/system/smoke_spread/bad

/obj/item/weapon/grenade/chemical/New()
	..()
	smoke = PoolOrNew(stype)
	smoke.attach(src)

/obj/item/weapon/grenade/chemical/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/weapon/grenade/chemical/prime()
	if (active)
		playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		smoke.set_up(10, FALSE, usr ? usr.loc : loc)
		spawn(0)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()

		sleep(80)
		qdel(src)
		return

/obj/item/weapon/grenade/chemical/fast_activate()
	spawn(round(det_time/10))
		visible_message(SPAN_WARNING("[src] испускает ядовитый дым!</span>"))
		active = TRUE
		prime()

/obj/item/weapon/grenade/chemical/chlorine
	name = "хлорная граната"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/chlorine_gas

/obj/item/weapon/grenade/chemical/mustard
	name = "слезоточивая граната"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/mustard_gas

/obj/item/weapon/grenade/chemical/phosgene
	name = "фосгенная граната"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/phosgene

/obj/item/weapon/grenade/chemical/white_phosphorus
	name = "фосфорная граната"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/white_phosphorus_gas

/obj/item/weapon/grenade/chemical/white_phosphorus/m34
	name = "M34 WP grenade"
	desc = "An American white phosphorus smoke grenade"
	icon_state = "m34wp"

/obj/item/weapon/grenade/chemical/xylyl_bromide
	name = "ксилилбромидовая граната"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/xylyl_bromide
	icon_state = "riot"
/obj/item/weapon/grenade/chemical/zyklon_b
	name = "граната с циклоном Б"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/zyklon_b

/obj/item/weapon/grenade/chemical/cs_gas
	name = "CS gas grenade"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/csgas

/obj/item/weapon/grenade/chemical/cs_gas/m7a2
	name = "M7A2 CS gas grenade"
	desc = "An American riot control CS hand grenade used to control counter-insurgencies and for other tactical missions."
	icon_state = "m7a2"

/obj/item/weapon/grenade/chemical/cs_gas/k51
	name = "K51 CS gas grenade"
	desc = "A Soviet riot control CS hand grenade used to control counter-insurgencies and for other tactical missions."
	icon_state = "k51"
	
/obj/item/weapon/grenade/smokebomb/ugl/attack_self(mob/user)
	return

/obj/item/weapon/grenade/smokebomb/ugl/shell40mm
	name = "40x46mm 'M676' grenade shell"
	desc = "Smoke Round, Cannot be thrown as the usual grenade, by the way."
	icon_state = "M406s"

/obj/item/weapon/grenade/smokebomb/ugl/vog25
	name = "40x103mm 'GRD-50' grenade shell"
	desc = "Smoke Round, Cannot be thrown as the usual grenade, by the way."
	icon_state = "40x103mmshells"

/obj/item/weapon/grenade/chemical/ugl/attack_self(mob/user)
	return

/obj/item/weapon/grenade/chemical/ugl/teargas
	name = "tear gas grenade"
	desc = "Concentrated Capsaicin. Contents under pressure. Use with caution."
	icon_state = "M406s"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/xylyl_bromide

