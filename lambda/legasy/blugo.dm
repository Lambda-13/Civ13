/*
/datum/job/civilian
	faction = "Human"

/datum/job/civilian/give_random_name(var/mob/living/human/H)
	H.name = H.species.get_random_russian_name(H.gender)
	H.real_name = H.name

/datum/job/civilian/strel
	title = "Strelok"
	rank_abbreviation = "Pvt."
	spawn_location = "JoinLateBlue"
	is_bluga = TRUE
	uses_squads = TRUE

	min_positions = 5
	max_positions = 90

/datum/job/civilian/strel/equip(var/mob/living/human/H)
	if (!H)	return FALSE
	H.nationality = "Blugoslavia"
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_tigerstripes(H), slot_w_uniform)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/pasgt/pasgt = new /obj/item/clothing/accessory/armor/coldwar/pasgt(null)
	uniform.attackby(pasgt, H)
	var/obj/item/clothing/accessory/storage/webbing/russian/guns/ak47/ak47 = new /obj/item/clothing/accessory/storage/webbing/russian/guns/ak47(null)
	uniform.attackby(ak47, H)

	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/ak47(H), slot_belt)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/ach/green(H), slot_head)
//guns
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak101/ak103(H), slot_shoulder)


	if (time_of_day == "Night" || time_of_day == "Evening" || time_of_day == "Early Morning")
		H.equip_to_slot_or_del(new /obj/item/flashlight/militarylight/alt(H), slot_wear_id)

	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	give_random_name(H)

	return TRUE
*/