/////////АРАБЫ ПРОКЛЯТЫЕ//////////////
//Гражданская одежда, мб броню

/datum/job/arab/give_random_name(var/mob/living/human/H)
	H.name = H.species.get_random_arab_name(H.gender)
	H.real_name = H.name
	H.circumcised = TRUE


/datum/job/arab/islamic/leader
	title = "ISIS Warlord"
	rank_abbreviation = "ISIS"
	spawn_location = "JoinLateAR"
	is_grozny = FALSE
	is_commander = TRUE
	is_ww2 = FALSE
	is_modernday = TRUE
	is_syriawar = TRUE
	whitelisted = TRUE

	min_positions = 1
	max_positions = 20

/datum/job/arab/islamic/leader/equip(var/mob/living/human/H)

//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/head/black_bandana(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_leader(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/modern_long_brown(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/motorist(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/gp5(H), slot_l_store)

//back
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/deagle(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74m/ak12/ak15(H), slot_shoulder)


	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/scavpack(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/ak47(H), slot_belt)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/platecarrier_ukraine/armor = new /obj/item/clothing/accessory/armor/coldwar/plates/platecarrier_ukraine(null)
	uniform.attackby(armor, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)

	H.s_tone = rand(-60,-30)
	H.f_style = pick("Full Beard","Medium Beard","Long Beard","Abraham Lincoln Beard","Neckbeard","Selleck Mustache","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father","Parted","Shoulder-length Hair")

	var/new_hair = pick("Dark Brown","Black","Orange","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Militia"
	give_random_name(H)
	H.add_note("Role", "Ты главарь повстанцев Исламского Государства в Пальмире! Экипируйте повстанцев, организируйте обоорону!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_HIGH)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

/datum/job/arab/islamic/militia
	title = "ISIS Militia"
	rank_abbreviation = "ISIS"
	spawn_location = "JoinLateAR"
	min_positions = 10
	max_positions = 200
	is_grozny = FALSE
	is_syriawar = TRUE
	is_modernday = TRUE

/datum/job/arab/islamic/militia/equip(var/mob/living/human/H)

//shoes
	var/randshoe2 = rand(1,5)
	if (randshoe2 == 1)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
	else if (randshoe2 == 2)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/workboots(H), slot_shoes)
	else if (randshoe2 == 3)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
	else if (randshoe2 == 4)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots(H), slot_shoes)
	else if (randshoe2 == 5)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat(H), slot_shoes)


//clothes
	var/randjack2 = rand(1,6)
	if (randjack2 == 1)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_black(H), slot_w_uniform)
	else if (randjack2 == 2)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_sand(H), slot_w_uniform)
	else if (randjack2 == 3)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_sand_dcu(H), slot_w_uniform)
	else if (randjack2 == 4)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_sand_green(H), slot_w_uniform)
	else if (randjack2 == 5)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/ww2/civ1(H), slot_w_uniform)
	else if (randjack2 == 6)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/ww2/civ2(H), slot_w_uniform)


//head
	var/randhead2 = rand(1,6)
	switch(randhead2)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/bandana/toughguy(H), slot_head)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/flatcap1(H), slot_head)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/ushelmet(H), slot_head)
		if (4)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/black_bandana(H), slot_head)
		if (5)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/commando_bandana(H), slot_head)
		if (6)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ww2/soviet(H), slot_head)

//gloves
	var/randglove2 = rand(1,4)
	switch(randglove2)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/leather(H), slot_gloves)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/fingerless(H), slot_gloves)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/watch/watch(H), slot_gloves)
		if (4)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/watch/specialwatch(H), slot_gloves)


//misc
	var/randmisc2 = rand(1,6)
	switch(randmisc2)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/pilot(H), slot_eyes)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/shemagh(H), slot_wear_mask)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
		if (4)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/smokable/cigarette(H), slot_wear_mask)
		if (5)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/smokable/cigarette/cigar(H), slot_wear_mask)
		if (6)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(H), slot_wear_mask)

//weapon
	var/randarmw = rand(1,3)
	switch(randarmw)
		if (1)
			if (prob(75))
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/boltaction/mosin(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/rpk47(H), slot_l_hand)

		if (2)
			if (prob(50))
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74/pso1(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/semiautomatic/ar15(H), slot_l_hand)
		if (3)
			if (prob(75))
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak47(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak47/akms(H), slot_l_hand)

	var/randsword2 = rand(1,3)
	switch(randsword2)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/sword/arabsword(H), slot_belt)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/sword/arabsword2(H), slot_belt)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/weapon/attachment/bayonet(H), slot_belt)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/storage/webbing/us_bandolier/holsterh = new /obj/item/clothing/accessory/storage/webbing/us_bandolier(null)
	uniform.attackby(holsterh, H)

//suit
	var/randsuits = rand(1,5)
	if (randsuits == 1)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/ww2/biker/lizard_jacket(H), slot_wear_suit)
	else if (randsuits == 2)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/modern_long_brown(H), slot_wear_suit)
	else if (randsuits == 3)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/b3(H), slot_wear_suit)
	else if (randsuits == 4)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/ww2/servicejacket(H), slot_wear_suit)
	else if (randsuits == 5)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/rebel_vest/officer(H), slot_wear_suit)

	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)

//back
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)

	H.s_tone = rand(-60,-30)
	H.f_style = pick("Full Beard","Medium Beard","Long Beard","Abraham Lincoln Beard","Neckbeard","Selleck Mustache","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father","Parted","Shoulder-length Hair")

	var/new_hair = pick("Dark Brown","Black","Orange","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.add_note("Role", "Ты <b>[title]</b> Исламского Государства! Следуйте приказам полевых командиров и отстоите Пальмиру!")
	H.civilization = "Militia"
	give_random_name(H)
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_HIGH)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_LOW)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

/datum/job/arab/islamic/medic
	title = "ISIS Militia Medic"
	rank_abbreviation = "ISIS"

	spawn_location = "JoinLateAR"

	is_medic = TRUE
	is_grozny = FALSE
	is_syriawar = TRUE
	is_modernday = TRUE
	is_ww2 = FALSE

	min_positions = 3
	max_positions = 15

/datum/job/arab/islamic/medic/equip(var/mob/living/human/H)
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_black(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/doctor(H), slot_wear_suit)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ww2/adrianm26medic(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sterile(H), slot_wear_mask)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat/modern(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/surgery(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/white(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/revolver/smithwesson(H), slot_r_store)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/armor = new /obj/item/clothing/accessory/armor/coldwar/plates/interceptor(null)
	uniform.attackby(armor, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)

	H.s_tone = rand(-60,-30)
	H.f_style = pick("Full Beard","Medium Beard","Long Beard","Abraham Lincoln Beard","Neckbeard","Selleck Mustache","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father","Parted","Shoulder-length Hair")

	var/new_hair = pick("Dark Brown","Black","Orange","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.add_note("Role", "Ты <b>[title]</b>. Держи братьев Аллаха целыми и в духе! يحيا الله!")
	H.civilization = "Militia"
	give_random_name(H)
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_VERY_HIGH)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/////////Russian Federal Forces//////////////
//Вагнерам Рюкзаки Цивильные, бронежилеты plate carrier/Interceptor body armor/6b28/6b5/6b2,
// маска - шемаг, шлем хаки, ph_us_war/american/infantry_hat буни/6б47/PASGT
//Оружие калашевские тактикульные, всякие МКИ, РПК и ПКМы
//Одежда - Горка, afr_merc (/alt), warband2
//Очки - Солнцезащитные, Баллистические
//Пояс - пустынный под 5.45 и тд
//Webbing - Russian, khaki webbing

/datum/job/russian/give_random_name(var/mob/living/human/H)
	H.name = H.species.get_random_russian_name(H.gender)
	H.real_name = H.name

//leader Wagner//
/datum/job/russian/squad/leader/wagner
	title = "PMC Wagner Shturman Komandir"
	en_meaning = "PMC Wagner Soldier Leader"
	rank_abbreviation = "PMC"

	spawn_location = "JoinLateRUCap"

	is_modernday = FALSE
	is_coldwar = FALSE
	is_syriawar = TRUE
	is_officer = TRUE
	is_commander = TRUE
	is_modernday = FALSE
	whitelisted = TRUE

	default_language = "Russian"
	additional_languages = list("Arabic" = 50)

	min_positions = 1
	max_positions = 20

/datum/job/russian/squad/leader/wagner/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/afr_merc(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/officer(H), slot_gloves)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/ph_us_war/american/infantry_hat/civie(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/special/ak74mtactical(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/mp443(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/rusoff(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/pmk1(H), slot_r_store)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp(null)
	var/obj/item/weapon/armorplates/plates1 = new /obj/item/weapon/armorplates(null)
	var/obj/item/weapon/armorplates/plates2 = new /obj/item/weapon/armorplates(null)
	armour.attackby(plates1, H)
	armour.attackby(plates2, H)
	uniform.attackby(armour, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	var/obj/item/clothing/accessory/armband/wagner/alt/white = new /obj/item/clothing/accessory/armband/wagner/alt(null)
	uniform.attackby(white, H)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/civbag(H), slot_back)

	H.s_tone = rand(-32,-24)
	H.f_style = pick("Full Beard","Goatee","Selleck Mustache","Shaved","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father")

	var/new_hair = pick("Red","Orange","Light Blond","Blond","Dirty Blond","Light Brown","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Russian Army"
	give_random_name(H)
	H.add_note("Role", "Ты <b>[title]</b>. Твоя задача - командовать отрядами Вагнера. Организуйтесь и отбейте Бармалеев!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_HIGH)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

//wagner regular//
/datum/job/russian/squad/wagner/strelok
	title = "PMC Wagner Shturman"
	en_meaning = "PMC Wagner Soldier"
	rank_abbreviation = "PMC"

	spawn_location = "JoinLateRUsptz"

	is_coldwar = FALSE
	is_modernday = FALSE
	is_syriawar = TRUE
	uses_squads = TRUE

	default_language = "Russian"
	additional_languages = list("Arabic" = 30)

	min_positions = 10
	max_positions = 80

/datum/job/russian/squad/wagner/strelok/equip(var/mob/living/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/soviet(H), slot_shoes)
//clothes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/afr_merc/alt(H), slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/afr_merc(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat(H), slot_gloves)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/pasgt/desert(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/civbag(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak101/ak105(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/mp443(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/rusoff(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/pmk1(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/platecarrier/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/platecarrier(null)
	uniform.attackby(armour, H)
	var/obj/item/clothing/accessory/storage/webbing/vog25/holsterh = new /obj/item/clothing/accessory/storage/webbing/vog25(null)
	uniform.attackby(holsterh, H)
	var/obj/item/clothing/accessory/armband/wagner/alt/white = new /obj/item/clothing/accessory/armband/wagner/alt(null)
	uniform.attackby(white, H)

	H.s_tone = rand(-32,-24)
	H.f_style = pick("Goatee","Selleck Mustache","Shaved","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father")

	var/new_hair = pick("Red","Orange","Light Blond","Blond","Dirty Blond","Light Brown","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Russian Army"
	give_random_name(H)
	H.add_note("Role", "Ты <b>[title]</b>, Ваша задача штурмовать противника и выполнять приказы Лидера Группы! Помните, что от вашей взаимосвязи с союзными войсками зависит исход битвы и потери.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_MEDIUM_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_MEDIUM_HIGH)
	return TRUE

//Wagner Support//
/datum/job/russian/squad/wagner/support
	title = "PMC Wagner Shturman Tyazheliy"
	en_meaning = "PMC Wagner soldier support"
	rank_abbreviation = "PMC"

	spawn_location = "JoinLateRUsptz"

	is_grozny = FALSE
	is_syriawar = TRUE
	is_modernday = TRUE
	is_ww2 = FALSE

	default_language = "Russian"
	additional_languages = list("Arabic" = 30)

	min_positions = 2
	max_positions = 30

/datum/job/russian/squad/wagner/support/equip(var/mob/living/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/soviet(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/warband2(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/motorist(H), slot_gloves)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/jungle_hat/og107(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/sfera(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/civbag(H), slot_back)
	if(prob(50))
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/semiautomatic/svd/acog(H), slot_shoulder)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/pkm(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/mp443(H), slot_l_hand)
	if(prob(50))
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_svd(H), slot_belt)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/largepouches/pkm(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/pmk1(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/pasgt/khaki/armour = new /obj/item/clothing/accessory/armor/coldwar/pasgt/khaki(null)
	uniform.attackby(armour, H)
	var/obj/item/clothing/accessory/storage/webbing/khaki_webbing/holsterh = new /obj/item/clothing/accessory/storage/webbing/khaki_webbing(null)
	uniform.attackby(holsterh, H)
	var/obj/item/clothing/accessory/armband/wagner/white = new /obj/item/clothing/accessory/armband/wagner(null)
	uniform.attackby(white, H)

	H.s_tone = rand(-32,-24)
	H.f_style = pick("Goatee","Selleck Mustache","Shaved","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father")

	var/new_hair = pick("Red","Orange","Light Blond","Blond","Dirty Blond","Light Brown","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Russian Army"
	give_random_name(H)
	H.add_note("Role", "Ты <b>[title]</b>, поддерживайте Ваш отряд огнём с различных позиций! Помните в основе Вашей тактики - координация.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_MEDIUM_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_MEDIUM_HIGH)
	return TRUE


/datum/job/russian/sso/medic
	title = "SSO Voyennyy Vrach"
	en_meaning = "SSO Corpsman"
	rank_abbreviation = "SSO"

	spawn_location = "JoinLateRUSL"

	is_medic = TRUE
	is_grozny = FALSE
	is_syriawar = TRUE
	is_modernday = TRUE
	is_ww2 = FALSE

	min_positions = 2
	max_positions = 30

/datum/job/russian/sso/medic/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/soviet(H), slot_shoes)

//clothes
	if (prob(60))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/gorka(H), slot_w_uniform)
		if (prob(15))
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/rus_winter_vsr93(H), slot_wear_suit)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/afghanka(H), slot_w_uniform)
		if (prob(15))
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/afghanka(H), slot_wear_suit)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sterile(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ww2/soviet_medic(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat/modern(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/makarov(H), slot_l_hand)

	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/white(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/pmk1(H), slot_r_store)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armband/redcross = new /obj/item/clothing/accessory/armband/redcross(null)
	uniform.attackby(redcross, H)
	var/obj/item/clothing/accessory/armor/coldwar/rb23/armour = new /obj/item/clothing/accessory/armor/coldwar/rb23(null)
	uniform.attackby(armour, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)

	H.s_tone = rand(-32,-24)
	H.f_style = pick("Goatee","Selleck Mustache","Shaved","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father")

	var/new_hair = pick("Red","Orange","Light Blond","Blond","Dirty Blond","Light Brown")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Russian Army"
	give_random_name(H)
	H.add_note("Role", "Ты <b>[title]</b>. Держи солдат ВС РФ и ВС Сирии живыми!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_LOW)
	H.setStat("medical", STAT_VERY_HIGH)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/datum/job/russian/sso/radioman
	title = "SSO Radist"
	en_meaning = "SSO Radio Operator"
	rank_abbreviation = "SSO"

	spawn_location = "JoinLateRURadop"

	is_radioman = TRUE
	is_grozny = FALSE
	is_syriawar = TRUE
	is_modernday = FALSE
	is_ww2 = FALSE

	min_positions = 1
	max_positions = 20

/datum/job/russian/sso/radioman/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/soviet(H), slot_shoes)

//clothes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/gorka(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/a6b44(H), slot_wear_suit)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/russiandesert(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/a6b28(H), slot_wear_suit)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/storage/webbing/green_webbing/blue/ak74/holsterh = new /obj/item/clothing/accessory/storage/webbing/green_webbing/blue/ak74(null)
	uniform.attackby(holsterh, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/veryblack(H), slot_gloves)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
	var/randhead2 = rand(1,2)
	switch(randhead2)
		if (1)
			if (prob(70))
				H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr/desert(H), slot_head)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/soviet_tanker(H), slot_head)
		if (2)
			if (prob(30))
				H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47(H), slot_head)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/head/ruscap_fed(H), slot_head)

//back
	var/randarmwrus = rand(1,2)
	switch(randarmwrus)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74m/ak12(H), slot_shoulder)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74/alt(H), slot_belt)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak101/ak105(H), slot_shoulder)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74(H), slot_belt)

	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/pmk1(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/faction1(H), slot_back)
	var/obj/item/clothing/accessory/patch/russia = new /obj/item/clothing/accessory/patch/russia(null)
	uniform.attackby(russia, H)

	H.s_tone = rand(-32,-24)
	H.f_style = pick("Selleck Mustache","Shaved","Short Facial Hair")
	H.h_style = pick("Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover")

	var/new_hair = pick("Red","Orange","Light Blond","Blond","Dirty Blond","Light Brown")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Russian Army"
	give_random_name(H)
	H.add_note("Role", "Ты <b>[title]</b>, следуй приказам и координируй Сирийцев и своих союзников.")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_LOW)
	H.setStat("medical", STAT_LOW)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

/datum/job/russian/contractor/sso
	title = "SSO Soldat"
	en_meaning = "SSO Soldier"
	rank_abbreviation = "SSO"

	spawn_location = "JoinLateRUSgt"

	is_medic = TRUE
	is_grozny = FALSE
	is_modernday = FALSE
	is_syriawar = TRUE
	is_ww2 = FALSE

	uses_squads = TRUE

	min_positions = 10
	max_positions = 100

/datum/job/russian/contractor/sso/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/soviet(H), slot_shoes)

//clothes
	if (prob(60))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/gorka(H), slot_w_uniform)
		if (prob(65))
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/a6b44(H), slot_wear_suit)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/russiandesert(H), slot_w_uniform)
		if (prob(65))
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/a6b28(H), slot_wear_suit)

	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/storage/webbing/khaki_webbing/holsterh = new /obj/item/clothing/accessory/storage/webbing/khaki_webbing(null)
	uniform.attackby(holsterh, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/veryblack(H), slot_gloves)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
	var/randhead3 = rand(1,3)
	switch(randhead3)
		if (1)
			if (prob(70))
				H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr/desert(H), slot_head)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47(H), slot_head)
		if (2)
			if (prob(70))
				H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47(H), slot_head)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/head/ruscap_fed(H), slot_head)
		if (3)
			if (prob(60))
				H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/camo(H), slot_head)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/head/beret_rus_spez(H), slot_head)

//back
	var/randarmwrus = rand(1,2)
	switch(randarmwrus)
		if (1)
			if (prob(80))
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/special/ak74mtactical(H), slot_shoulder)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74m(H), slot_belt)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/rpk74(H), slot_l_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/rpk74(H), slot_belt)
		if (2)
			if (prob(80))
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74m/ak12(H), slot_shoulder)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74m(H), slot_belt)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak101/ak105(H), slot_shoulder)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74m(H), slot_belt)


	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/soviet/pmk1(H), slot_r_store)
	var/obj/item/clothing/accessory/patch/russia = new /obj/item/clothing/accessory/patch/russia(null)
	uniform.attackby(russia, H)

	H.s_tone = rand(-32,-24)
	H.f_style = pick("Selleck Mustache","Shaved","Short Facial Hair")
	H.h_style = pick("Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover")

	var/new_hair = pick("Red","Orange","Light Blond","Blond","Dirty Blond","Light Brown")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.civilization = "Russian Army"
	give_random_name(H)
	H.add_note("Role", "Ты <b>[title]</b>, Ваша задача при участии дружественных сил отбить Пальмиру у Исламского Государства! Славься Отечество!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_LOW)
	H.setStat("medical", STAT_LOW)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

/////Siria/////
//Comandarm Polevoi//
/datum/job/civilian/syrian/leader
	title = "J.A. Alqayid"
	en_meaning = "Syrian Goverment Army Commander"
	rank_abbreviation = "Alq"
	spawn_location = "JoinLateDRACap"

	is_coldwar = FALSE
	is_modernday = FALSE
	is_syriawar = TRUE
	is_officer = TRUE
	is_commander = FALSE
	uses_squads = TRUE
	is_radioman = FALSE
	can_get_coordinates = TRUE

	default_language = "Arabic"
	additional_languages = list("Russian" = 60)

	min_positions = 1
	max_positions = 5

/datum/job/civilian/syrian/leader/equip(var/mob/living/human/H)

//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/toughguy(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/head/beret_red(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/syrian_gov(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/afghanka(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/smokable/cigarette/cigar(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/toughguy(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/russia(H), slot_l_store)

//back
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/tt30(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso/kgb(H), slot_shoulder)


	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/buttpack(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/chechoff(H), slot_belt)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/armor = new /obj/item/clothing/accessory/armor/coldwar/plates/interceptor(null)
	uniform.attackby(armor, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)

	H.s_tone = rand(-60,-30)
	H.f_style = pick("Full Beard","Medium Beard","Long Beard","Abraham Lincoln Beard","Neckbeard","Selleck Mustache","Short Facial Hair")
	H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Father","Parted","Shoulder-length Hair")

	var/new_hair = pick("Dark Brown","Black","Orange","Grey")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))

	H.name = H.species.get_random_arab_name(H.gender)
	H.real_name = H.name
	H.civilization = "Syrian"
	H.add_note("Role", "Ты главно-командующий Сирийской Армии! Верните контроль за Пальмиру от исламских повстанцев!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_HIGH)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

//Syrian Army Srg Soldier//
	/datum/job/civilian/syrian/sergeant
	title = "J.A. Qayid Firqa"
	en_meaning = "Syrian Goverment Army Squadleader"
	rank_abbreviation = "Q.F."

	spawn_location = "JoinLateDRALt"

	is_coldwar = FALSE
	is_modernday = FALSE
	is_syriawar = TRUE
	uses_squads = TRUE
	is_squad_leader = TRUE
	is_radioman = FALSE
	can_get_coordinates = TRUE

	default_language = "Arabic"
	additional_languages = list("Russian" = 50)

	min_positions = 1
	max_positions = 16

/datum/job/civilian/syrian/sergeant/equip(var/mob/living/human/H)
	if (!H)	return FALSE

//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/soldiershoes(H), slot_shoes)

//clothes
	if(prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/ph_us_war/american/us_off_uni(H), slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/syrian_gov(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(H), slot_gloves)
//head
	if (prob(70))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr/desert(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/tt30(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74/alt(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/faction1(H), slot_back)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	if (time_of_day == "Night" || time_of_day == "Evening" || time_of_day == "Early Morning")
		H.equip_to_slot_or_del(new /obj/item/flashlight/militarylight/alt(H), slot_wear_id)

	H.civilization = "Syrian"
	H.name = H.species.get_random_arab_name(H.gender)
	H.real_name = H.name
	if (H.f_style != "Full Beard" && H.f_style != "Selleck Mustache" && H.f_style != "Hulk Hogan Mustache" && H.f_style != "Van Dyke Mustache" && H.f_style != "Waston Mustache" )
		H.f_style = pick("Full Beard","Selleck Mustache","Watson Mustache","Hulk Hogan Mustache","Van Dyke Mustache")
	if (H.h_style != "Bald" && H.f_style != "Crewcut" && H.f_style != "Undercut" && H.f_style != "Short Hair" && H.f_style != "Cut Hair" && H.f_style != "Skinhead" && H.f_style != "Average Joe" && H.f_style != "Fade" && H.f_style != "Combover" && H.f_style != "Gelled Back" && H.f_style != "Slick" && H.f_style != "Balding Hair" && H.f_style != "Joestar")
		H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Gelled Back","Slick","Balding Hair","Joestar")
	var/new_hair = pick("Dark Brown","Black")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))
	H.add_note("Role", "You are a <b>[title]</b>, responsible for leading DRA soldiers and guards in the province.")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

///bAZA SOLDTAT///

/datum/job/civilian/syrian/soldier/novobranec
	title = "J.A. Sulydir"
	en_meaning = "Syrian Goverment Army Soldier"
	rank_abbreviation = "S."

	spawn_location = "JoinLateDRA"

	is_coldwar = FALSE
	is_modernday = FALSE
	is_syriawar = TRUE
	uses_squads = TRUE

	default_language = "Arabic"
	additional_languages = list("Russian" = 30)

	min_positions = 10
	max_positions = 120

/datum/job/civilian/syrian/soldier/novobranec/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/soldiershoes(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/syrian_gov(H), slot_w_uniform)
//head
	var/randhead2 = rand(1,7)
	switch(randhead2)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr/desert(H), slot_head)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/ssh_68(H), slot_head)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ww2/soviet(H), slot_head)
		if (4)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/olivebandana(H), slot_head)
		if (5)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/soviet_tanker(H), slot_head)
		if (6)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/cap(H), slot_head)
		if (7)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/flatcap3(H), slot_head)

//back
	if (prob(40))
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak101/ak105(H), slot_shoulder)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74/alt(H), slot_belt)
	else if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak47(H), slot_shoulder)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/m16(H), slot_shoulder)
	if (time_of_day == "Night" || time_of_day == "Evening" || time_of_day == "Early Morning")
		H.equip_to_slot_or_del(new /obj/item/flashlight/militarylight/alt(H), slot_wear_id)
	H.civilization = "Syrian"
	H.name = H.species.get_random_arab_name(H.gender)
	H.real_name = H.name
	if (H.f_style != "Shaved" && H.f_style != "Full Beard" && H.f_style != "Selleck Mustache" && H.f_style != "Hulk Hogan Mustache" && H.f_style != "Van Dyke Mustache" && H.f_style != "Waston Mustache" )
		H.f_style = pick("Shaved","Full Beard","Selleck Mustache","Watson Mustache","Hulk Hogan Mustache","Van Dyke Mustache")
	if (H.h_style != "Bald" && H.f_style != "Crewcut" && H.f_style != "Undercut" && H.f_style != "Short Hair" && H.f_style != "Cut Hair" && H.f_style != "Skinhead" && H.f_style != "Average Joe" && H.f_style != "Fade" && H.f_style != "Combover" && H.f_style != "Gelled Back" && H.f_style != "Slick" && H.f_style != "Balding Hair" && H.f_style != "Joestar")
		H.h_style = pick("Bald","Crewcut","Undercut","Short Hair","Cut Hair","Skinhead","Average Joe","Fade","Combover","Gelled Back","Slick","Balding Hair","Joestar")
	var/new_hair = pick("Dark Brown","Black")
	var/hex_hair = hair_colors[new_hair]
	H.r_hair = hex2num(copytext(hex_hair, 2, 4))
	H.g_hair = hex2num(copytext(hex_hair, 4, 6))
	H.b_hair = hex2num(copytext(hex_hair, 6, 8))
	H.r_facial = hex2num(copytext(hex_hair, 2, 4))
	H.g_facial = hex2num(copytext(hex_hair, 4, 6))
	H.b_facial = hex2num(copytext(hex_hair, 6, 8))
	H.add_note("Role", "You are a <b>[title]</b>, a basic grunt of the DRA. Follow orders and defeat the terrorists!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_MEDIUM_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE
