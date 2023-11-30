//////////////////////////////////////////////SKINHEADS//////////////////////////////////////////

/datum/job/civilian/nazi/nazisto
	title = "Skinhead Lord"
	rank_abbreviation = ""

	spawn_location = "JoinLateNAZ"

	is_mvd = FALSE
	is_skinhead = TRUE
	is_officer = TRUE
	is_commander = TRUE
	min_positions = 5
	max_positions = 34

/datum/job/civilian/nazi/nazisto/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	var/randshoe = rand(1,2)
	switch(randshoe)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/punk(H), slot_shoes)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)

//clothes
	if (prob(60))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/localnlf3(H), slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/boomerwaffen3(H), slot_w_uniform)
//gloves
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/motorist(H), slot_gloves)
//head
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_eyes)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/shemagh/redkerchief(H), slot_wear_mask)
//weapons
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/tt30(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/tt30(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/tt30(H), slot_l_store)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
//jacket
	if (prob(40))
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/rus_winter_vsr93(H), slot_wear_suit)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/motorist(H), slot_wear_suit)
//other shit
	if (prob(50))
		var/obj/item/clothing/under/uniform = H.w_uniform
		var/obj/item/clothing/accessory/armband/nsdap = new /obj/item/clothing/accessory/(null)
		uniform.attackby(nsdap, H)

	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>. You are in charge of the footbal fans. Organize your troops accordingly!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/datum/job/civilian/nazi/nazik
	title = "Skinhead"
	rank_abbreviation = ""

	spawn_location = "JoinLateNAZ"

	is_skinhead = TRUE
	is_mvd = FALSE
	min_positions = 10
	max_positions = 140

/datum/job/civilian/nazi/nazik/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/modern(H), slot_shoes)
//clothes
	var/randcloth = rand(1,6)
	switch(randcloth)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/boomerwaffen1(H), slot_w_uniform)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/afr_merc(H), slot_w_uniform)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/trackpants(H), slot_w_uniform)
		if (4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rus_vsr93(H), slot_w_uniform)
		if (5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/modern7(H), slot_w_uniform)
		if (6)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/insurgent_sand_woodland(H), slot_w_uniform)
//gloves
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/motorist(H), slot_gloves)
//head
	var/randmask = rand(1,3)
	switch(randmask)
		if (1)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/shemagh(H), slot_wear_mask)
		if (2)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(H), slot_wear_mask)
		if (3)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/sovietbala(H), slot_wear_mask)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/scavpack(H), slot_back)
//jacket
	var/randjack = rand(1,4)
	switch(randjack)
		if(1)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/ww2/bomberjacketbrown(H), slot_wear_suit)
		if(2)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/rus_winter_vsr93, slot_wear_suit)
		if(3)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/tracksuit(H), slot_wear_suit)
		if(4)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/piratejacket1(H), slot_wear_suit)
//weapons
	var/randarmw = rand(1,7)
	switch(randarmw)
		if(1)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/bowie, slot_l_hand)
		if(2)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/military, slot_l_hand)
		if(3)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/trench, slot_l_hand)
		if(4)
			H.equip_to_slot_or_del(new /obj/item/weapon/melee/baseball_bat, slot_l_hand)
		if(5)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/machete, slot_l_hand)
		if(6)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/switchblade, slot_l_hand)
		if(7)
			H.equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/bowie, slot_l_hand)

//other shit
	if (prob(50))
		var/obj/item/clothing/under/uniform = H.w_uniform
		var/obj/item/clothing/accessory/armband/red = new /obj/item/clothing/accessory/armband(null)
		uniform.attackby(red, H)

	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>. Follow your lead!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_LOW)
	return TRUE

//////////////////////////////////////////////RUSSIAN POLICE//////////////////////////////////////////

/datum/job/russian/police/leytexa
	title = "MVD Leytenant"
	rank_abbreviation = "Lt."

	spawn_location = "JoinLateRNV"

	is_skinhead = FALSE
	is_mvd = TRUE
	is_officer = TRUE
	is_commander = TRUE
	min_positions = 1
	max_positions = 10

/datum/job/russian/police/leytexa/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/soldiershoes(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/traffic_police/supervisor(H), slot_w_uniform)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/traffic_police(H), slot_head)
//weapons
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/makarov(H), slot_r_arm)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/makarov(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/makarov(H), slot_l_store)
//other shit
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/b3/blue/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/b3/blue(null)
	uniform.attackby(armour, H)

	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>. Follow your lead!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_LOW)
	return TRUE


/datum/job/russian/police/serg
	title = "MVD Sergeant"
	rank_abbreviation = "Srg."

	spawn_location = "JoinLateRN"

	is_skinhead = FALSE
	min_positions = 3
	max_positions = 40

/datum/job/russian/police/serg/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/soldiershoes(H), slot_shoes)
//clothes
	var/randuniform = rand(1,6)
	switch(randuniform)
		if(1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/traffic_police(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/police/black(H), slot_wear_suit)
		if(2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/detective2(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/police/black(H), slot_wear_suit)
//head
	var/randhat = rand(1,2)
	switch(randhat)
		if(1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/traffic_police(H), slot_head)
		if(2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/sov_ushanka_new(H), slot_head)
//weapons
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/makarov(H), slot_r_arm)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/makarov(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/makarov(H), slot_l_store)
//other shit
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	if(prob(50))
		var/obj/item/clothing/under/uniform = H.w_uniform
		var/obj/item/clothing/accessory/armor/coldwar/plates/b3/blue/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/b3/blue(null)
	else
		var/obj/item/clothing/under/uniform = H.w_uniform
		var//obj/item/clothing/accessory/armor/civiliankevlar/under/armour = new /obj/item/clothing/accessory/armor/civiliankevlar/under(null)
	uniform.attackby(armour, H)

	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>. Follow your lead!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_LOW)
	return TRUE

/datum/job/russian/police/omon
	title = "MVD OMON"
	rank_abbreviation = "OMON"

	spawn_location = "JoinLateRN"

	is_skinhead = FALSE
	is_mvd = TRUE
	min_positions = 10
	max_positions = 100

/datum/job/russian/police/omon/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/iogboots/black(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/omon(H), slot_w_uniform)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/platecarrierblack/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/platecarrierblack(null)
	uniform.attackby(armour, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat(H), slot_gloves)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/tactical_goggles(H), slot_eyes)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/russia(H), slot_wear_mask)
	if(prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/zsh2(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/zsh1(H), slot_head)
//weapons
	if(prob(50))
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso(H), slot_shoulder)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_swat(H), slot_belt)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/ks23(H), slot_shoulder)
		H.equip_to_slot_or_del(new /obj/item/ammo_magazine/shellbox/slug(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/makarov(H), slot_belt)
//other shit
	H.equip_to_slot_or_del(new /obj/item/weapon/melee/nightbaton(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/shield/balistic(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)

	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>, Otryad Militsii Osobogo Naznacheniya. Your task is - to keep peace on the streets.")
	H.setStat("strength", STAT_HIGH)
	H.setStat("crafting", STAT_HIGH)
	H.setStat("rifle", STAT_HIGH)
	H.setStat("dexterity", STAT_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_HIGH)
	return TRUE