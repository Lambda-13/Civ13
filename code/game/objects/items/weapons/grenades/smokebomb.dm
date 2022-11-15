/obj/item/weapon/grenade/smokebomb
	name = "дымовая граната"
	desc = "Пускает дым, взорвётся через 2 секунды."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "m18smoke"
	det_time = 20
	item_state = "m18smoke"
	slot_flags = SLOT_BELT
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
		visible_message("<span class = 'warning'>[src] начинает дымиться!</span>")
		active = TRUE
		prime()

/obj/item/weapon/grenade/smokebomb/m18smoke
	name = "дымовая граната M18"
	desc = "Дымовая граната, взорвётся через 2 секунды."
	icon_state = "m18smoke"
	det_time = 20
	item_state = "m18smoke"

//////////Signal Smoke//////////////////////////////////////////

/obj/item/weapon/grenade/smokebomb/m18smoke/signal
	name = "дымовая сигнальная граната M18"
	desc = "Дымовая граната, взорвётся через 2 секунды. Вертолет армии США сбросит на место дыма ящик с припасами."
	icon_state = "m18smoke_purple"
	det_time = 20
	item_state = "m18smoke_purple"
	var/datum/effect/effect/system/smoke_spread/purple
	var/triggered_by_us = FALSE

/obj/item/weapon/grenade/smokebomb/m18smoke/signal/New()
	..()
	smoke = PoolOrNew(/datum/effect/effect/system/smoke_spread/purple)
	smoke.attach(src)

/obj/item/weapon/grenade/smokebomb/m18smoke/signal/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/weapon/grenade/smokebomb/m18smoke/signal/attack_self(mob/living/human/user as mob)
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
							var/mob/living/human/C = user
							C.throw_mode_on()
						triggered_by_us = TRUE
						sleep(500)
						new new_type(get_turf(src))
			else
				visible_message("<span class = 'danger'>Нет достаточной видимости дыма для падения ящиков снабжения!</span>")
		else
			firer = user
			activate(user)
			add_fingerprint(user)
			if (ishuman(user))
				var/mob/living/human/C = user
				C.throw_mode_on()

/obj/item/weapon/grenade/smokebomb/m18smoke/signal/prime()
	if (active)
		playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		smoke.set_up(5, FALSE, usr ? usr.loc : loc)
		spawn(0)
			smoke.start()
		if (triggered_by_us == TRUE)
			sleep(300)
			if (time_of_day != "Night")
				world << "Слышу гул лопастей."
				if (map.ID == "ROAD_TO_DAK_TO" || map.ID == "COMPOUND" || map.ID == "HUE" || map.ID == "ONG_THAHN")
					playsound(get_turf(src), 'sound/effects/uh1.ogg', 100, TRUE, extrarange = 70)
					sleep(200)
					visible_message("<span class = 'notice'>A US Army UH-1B helicopter flies by and drops off a crate at the smoke's location.</span>")
				else
					playsound(get_turf(src), 'sound/effects/uh60.ogg', 100, TRUE, extrarange = 70)
					sleep(200)
					visible_message("<span class = 'notice'>A US Army UH-60 Blackhawk helicopter flies by and drops off a crate at the smoke's location.</span>")
		sleep(20)
		qdel(src)
		return

/obj/item/weapon/grenade/smokebomb/m18smoke/signal/fast_activate()
	spawn(round(det_time/10))
		visible_message("<span class = 'warning'>[src] пускает сигнальный дым!</span>")
		active = TRUE
		prime()

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
		playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		var/turf/LT = get_turf(src)
		explosion(LT,0,1,1,3)
		for (var/turf/floor/T in range(spread_range,LT))
			for (var/mob/living/LS1 in T)
				LS1.adjustFireLoss(35)
				LS1.fire_stacks += rand(8,10)
				LS1.IgniteMob()
			new/obj/effect/fire(T)
		sleep(50)
		qdel(src)
		return

/obj/item/weapon/grenade/incendiary/fast_activate()
	spawn(round(det_time/10))
		visible_message("<span class = 'warning'>[src] начинает дымиться!</span>")
		active = TRUE
		prime()


/obj/item/weapon/grenade/chemical
	name = "химическая граната"
	desc = "Пускает газ, взорвётся через 5 секунд."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "m18smoke"
	det_time = 50
	item_state = "m18smoke"
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
		visible_message("<span class = 'warning'>[src] начинает пускать дым!</span>")
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

/obj/item/weapon/grenade/chemical/xylyl_bromide
	name = "ксилилбромидовая граната"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/xylyl_bromide

/obj/item/weapon/grenade/chemical/zyklon_b
	name = "граната с циклоном Б"
	stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/zyklon_b