/mob/living/simple_animal/hostile/human/bandit
	name = "Bandit"
	desc = "A bandit! he looks scary!"
	icon_state = "bandit2"
	icon_dead = "bandit2_dead"
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speak = list()
	speak_emote = list()
	emote_hear = list()
	emote_see = list("stares", "draws firearm")
	speak_chance = TRUE
	speed = 6
	move_to_delay = 3
	stop_automated_movement_when_pulled = 0
	maxHealth = 150
	health = 150
	move_to_delay = 4
	harm_intent_damage = 10
	melee_damage_lower = 35
	melee_damage_upper = 45
	attacktext = "pistol-whipped"
	attack_sound = 'sound/weapons/punch3.ogg'
	mob_size = MOB_MEDIUM
	starves = FALSE
	behaviour = "hostile"
	faction = PIRATES
	ranged = TRUE
	rapid = TRUE
	projectiletype = /obj/item/projectile/bullet/pistol/a9x19
	corpse = /mob/living/human/corpse/bandit
	casingtype = null


	New()
		..()
		messages["injured"] = list("!!Ааай мля!","!!Ух е")
		messages["backup"] = list(
		" !!Ннууу. Даставай вадяру. Помянем жмуров свеженьких.", 
		" !!Ну че тупим?! Всее. Погудели.", 
		" !!Харре фтыкать. Шухер уехал", 
		" !!Э э ээ. Рано валыны чехлить, пацаны", 
		" !!у че, ждем еще лашков", 
		" !!НЫКАЙСЯ, НЫКАЙСЯ пацаны", 
		" !!Не фтыкать! ЩА фраера припрутся", 
		" !!ЗЫРИТЬ в ОБА!")
		messages["enemy_sighted"] = list(
		" !!Опаньки...", 
		" !!Так собрались. У нас гости", 
		" !!Тихо! Идет", 
		" !!Пажааловал лошок...", 
		" !!Тссс! За дело!", 
		)
		messages["grenade"] = list("!!Гранаца пацаны!","!!Лимонка!")
		if (prob(65))
			gun = new/obj/item/weapon/gun/projectile/pistol/glock17/standardized(src)
		else
			gun = new/obj/item/weapon/gun/projectile/revolver/coltpolicepositive/standardized(src)
