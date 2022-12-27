//Тут профессии русских карт//

//Украинцы
/*/datum/job/civilian/ukrainian/horodnychyy
	title = "Horodnychyy"
	en_meaning = "Mayor"
	rank_abbreviation = ""

	spawn_location = "JoinLateHCiv"

	is_officer = TRUE
	whitelisted = TRUE
	is_commander = TRUE
	is_ww2 = TRUE
	is_upa = TRUE

	min_positions = 1
	max_positions = 1

/datum/job/civilian/ukrainian/upa_officer/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/heavyboots/wrappedboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/ww2/upa/off(H), slot_w_uniform)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/upa_cap_commander(H), slot_head)
//back
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	holsterh.attackby(new/obj/item/weapon/gun/projectile/pistol/waltherp38, H)
	var/obj/item/clothing/accessory/rank/upa_lt = new /obj/item/clothing/accessory/rank/upa_lt(null)
	uniform.attackby(upa_lt, H)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ppsh(H), slot_l_hand)
	give_random_name(H)
	H.s_tone = rand(-35,-25)
	H.add_note("Role", "You are a <b>[title]</b>, lead the UPA in the fight against the invaders!")
	H.add_note("Partisan Mechanics", "- Press <b>C</b> to place a booby trap while holding a grenade.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_VERY_VERY_HIGH)
	H.setStat("dexterity", STAT_VERY_VERY_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_VERY_VERY_HIGH)
	return TRUE

/datum/job/civilian/ukrainian/upa_doctor
	title = "UPA Likar"
	en_meaning = "UPA Doctor"
	rank_abbreviation = "Buj."
	can_be_female = TRUE
	spawn_location = "JoinLateCiv"

	is_medic = TRUE
	is_ww2 = TRUE
	is_upa = TRUE

	min_positions = 2
	max_positions = 2

/datum/job/civilian/ukrainian/upa_doctor/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/heavyboots/wrappedboots(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/ww2/upa(H), slot_w_uniform)

//head
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ww2/gerhelm_medic(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/upa_cap(H), slot_head)

//back
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/waltherp38(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/doctor(H), slot_wear_suit)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/rank/upa_sgt = new /obj/item/clothing/accessory/rank/upa_sgt(null)
	uniform.attackby(upa_sgt, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	give_random_name(H)
	H.s_tone = rand(-35,-25)
	H.add_note("Role", "You are a <b>[title]</b>. Keep your comrades healthy!")
	H.add_note("Partisan Mechanics", "- Press <b>C</b> to place a booby trap while holding a grenade.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MAX)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/datum/job/civilian/ukrainian/sergeant_upa
	title = "UPA Vistun"
	en_meaning = "UPA Sergeant"
	rank_abbreviation = "Vtn."
	can_be_female = TRUE
	spawn_location = "JoinLateCiv"

	is_ww2 = TRUE
	uses_squads = TRUE
	is_squad_leader = TRUE
	is_upa = TRUE

	min_positions = 1
	max_positions = 2

/datum/job/civilian/ukrainian/sergeant_upa/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/heavyboots/wrappedboots(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/ww2/upa(H), slot_w_uniform)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/upa_cap_off(H), slot_head)

	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/mp40(H), slot_l_hand)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/rank/upa_sgt = new /obj/item/clothing/accessory/rank/upa_sgt(null)
	uniform.attackby(upa_sgt, H)
	var/obj/item/clothing/accessory/storage/webbing/ww1/germanh = new /obj/item/clothing/accessory/storage/webbing/ww1/german(null)
	uniform.attackby(germanh, H)
	germanh.attackby(/obj/item/ammo_magazine/mp40, H)
	germanh.attackby(/obj/item/ammo_magazine/mp40, H)
	germanh.attackby(/obj/item/ammo_magazine/mp40, H)
	germanh.attackby(/obj/item/weapon/grenade/ww2/stg1924, H)
	give_random_name(H)
	H.s_tone = rand(-35,-25)

	H.add_note("Role", "You are a <b>[title]</b>, a sergeant in the Ukrayins'ka Povstans'ka Armiya, in charge of a squad.")
	H.add_note("Partisan Mechanics", "- Press <b>C</b> to place a booby trap while holding a grenade.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_HIGH)
	H.setStat("dexterity", STAT_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	H.setStat("stamina", STAT_VERY_HIGH)

	return TRUE

/datum/job/civilian/ukrainian/upa_infantry
	title = "UPA Strilets"
	en_meaning = "UPA Infantry"
	rank_abbreviation = ""

	spawn_location = "JoinLateCiv"
	can_be_female = TRUE
	is_ww2 = TRUE
	uses_squads = TRUE
	is_upa = TRUE

	min_positions = 5
	max_positions = 15

/datum/job/civilian/ukrainian/upa_infantry/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/heavyboots/wrappedboots(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/ww2/upa(H), slot_w_uniform)
//head
	if (prob(70))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/upa_pilotka(H), slot_head)
	else if (prob(10))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/upa_cap(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/ww2/sov_ushanka/nomads(H), slot_head)
//back
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/pickgun = rand(1,4)
	if (pickgun == 1)
		var/obj/item/clothing/accessory/storage/webbing/ww1/germanh = new /obj/item/clothing/accessory/storage/webbing/ww1/german(null)
		uniform.attackby(germanh, H)
		germanh.attackby(/obj/item/ammo_magazine/mp40, H)
		germanh.attackby(/obj/item/ammo_magazine/mp40, H)
		germanh.attackby(/obj/item/ammo_magazine/mp40, H)
		germanh.attackby(/obj/item/weapon/grenade/ww2/stg1924, H)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/mp40(H), slot_shoulder)
	else if (pickgun == 2)
		var/obj/item/clothing/accessory/storage/webbing/ww1/germanh = new /obj/item/clothing/accessory/storage/webbing/ww1/german(null)
		uniform.attackby(germanh, H)
		germanh.attackby(/obj/item/ammo_magazine/mg34, H)
		germanh.attackby(/obj/item/ammo_magazine/mg34, H)
		germanh.attackby(/obj/item/ammo_magazine/mg34, H)
		germanh.attackby(/obj/item/weapon/grenade/ww2/stg1924, H)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/mg34(H), slot_shoulder)
		H.equip_to_slot_or_del(new /obj/item/ammo_magazine/mg34belt(H), slot_belt)
	else if (pickgun == 3 && prob(10))
		var/obj/item/clothing/accessory/storage/webbing/ww1/germanh = new /obj/item/clothing/accessory/storage/webbing/ww1/german(null)
		uniform.attackby(germanh, H)
		germanh.attackby(/obj/item/ammo_magazine/c762x25_ppsh, H)
		germanh.attackby(/obj/item/ammo_magazine/c762x25_ppsh, H)
		germanh.attackby(/obj/item/ammo_magazine/c762x25_ppsh, H)
		germanh.attackby(/obj/item/weapon/grenade/ww2/stg1924, H)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ppsh(H), slot_shoulder)
	else if (pickgun == 4)
		var/obj/item/clothing/accessory/storage/webbing/ww1/germanh = new /obj/item/clothing/accessory/storage/webbing/ww1/german(null)
		uniform.attackby(germanh, H)
		germanh.attackby(/obj/item/ammo_magazine/gewehr98, H)
		germanh.attackby(/obj/item/ammo_magazine/gewehr98, H)
		germanh.attackby(/obj/item/ammo_magazine/gewehr98, H)
		germanh.attackby(/obj/item/weapon/grenade/ww2/stg1924, H)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/boltaction/gewehr98/karabiner98k(H), slot_shoulder)
	else
		var/obj/item/clothing/accessory/storage/webbing/ww1/germanh = new /obj/item/clothing/accessory/storage/webbing/ww1/german(null)
		uniform.attackby(germanh, H)
		germanh.attackby(/obj/item/ammo_magazine/gewehr98, H)
		germanh.attackby(/obj/item/ammo_magazine/gewehr98, H)
		germanh.attackby(/obj/item/ammo_magazine/gewehr98, H)
		germanh.attackby(/obj/item/weapon/grenade/ww2/stg1924, H)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/boltaction/gewehr98/karabiner98k(H), slot_shoulder)
	give_random_name(H)
	H.s_tone = rand(-35,-25)
	H.add_note("Role", "You are a <b>[title]</b>, a soldier in the Ukrayins'ka Povstans'ka Armiya. Fight for the freedom of <b>Ukraine</b>!")
	H.add_note("Partisan Mechanics", "- Press <b>C</b> to place a booby trap while holding a grenade.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_MEDIUM_LOW)

	return TRUE

*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////RUSKI/////////////////////////////////////////////////////////////////////////////

/datum/job/russian/codmwww3_ru_lieutenant
	title = " Inner Circle Lieutenant"
	rank_abbreviation = "Lt."

	spawn_location = "JoinLateRUCap"

	is_grozny = FALSE
	is_officer = TRUE
	is_commander = TRUE
	is_modernday = FALSE
	is_ww2 = FALSE
	whitelisted = TRUE
	is_cowmdww3 = TRUE

	min_positions = 1
	max_positions = 1

/datum/job/russian/codmwww3_ru_lieutenant/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/russian(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/officer(H), slot_gloves)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/beret_rus_vdv(H), slot_head)


	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/special/ak74mtactical(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/makarov(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/rusoff(H), slot_belt)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	holsterh.attackby(new/obj/item/weapon/gun/projectile/pistol/makarov, H)
//jacket
	if (prob(15))
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/rus_winter_vsr93(H), slot_wear_suit)

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

	H.civilization = "Inner Circle"
	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>. You are in charge of the whole platoon. Organize your troops accordingly!")
	H.setStat("strength", STAT_MAX)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_MAX)
	H.setStat("dexterity", STAT_MAX)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_MAX)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_MAX)
	return TRUE

/datum/job/russian/codmwww3_ru_sergeant
	title = " Inner Circle Sergeant"
	rank_abbreviation = "Sgt."

	spawn_location = "JoinLateRUSgt"

	is_grozny = FALSE
	is_modernday = FALSE
	is_ww2 = FALSE
	is_squad_leader = TRUE
	uses_squads = TRUE
	is_cowmdww3 = TRUE

	can_get_coordinates = TRUE

	min_positions = 4
	max_positions = 8

/datum/job/russian/codmwww3_ru_sergeant/equip(var/mob/living/human/H)
	if (!H)	return FALSE

//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/russian(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(H), slot_gloves)
//head
	if (prob(33))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/sovietfacehelmet(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/russian_b7(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74m(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/rusoff(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen(null)
	uniform.attackby(armour, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	holsterh.attackby(new/obj/item/weapon/gun/projectile/pistol/makarov, H)

	if (prob(25))
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/civbag(H), slot_back)
//jacket
	if (prob(33))
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/rus_winter_vsr93(H), slot_wear_suit)

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

	H.civilization = "Inner Circle"
	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>, lead your squad in the russian advance!")
	H.setStat("strength", STAT_VERY_HIGH)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_VERY_HIGH)
	H.setStat("dexterity", STAT_VERY_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_VERY_HIGH)
	return TRUE


/datum/job/russian/codmwww3_ru_medic
	title = " Inner Circle Corpsman"
	rank_abbreviation = "Pfc."

	spawn_location = "JoinLateRUMedic"

	is_medic = TRUE
	is_grozny = FALSE
	is_modernday = FALSE
	is_ww2 = FALSE
	is_cowmdww3 = TRUE

	min_positions = 2
	max_positions = 4

/datum/job/russian/codmwww3_ru_medic/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/russian(H), slot_w_uniform)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/sterile(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/russian_b7(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat/modern(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/makarov(H), slot_l_hand)

	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/white(H), slot_gloves)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/custom/armband/white = new /obj/item/clothing/accessory/custom/armband(null)
	uniform.attackby(white, H)
	var/obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen(null)
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

	H.civilization = "Inner Circle"
	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>. Keep your fellow soldiers healthy and alive!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_VERY_HIGH)
	H.setStat("machinegun", STAT_HIGH)
	return TRUE

/datum/job/russian/codmwww3_ru_soldier
	title = " Inner Circle Private"
	rank_abbreviation = ""

	spawn_location = "JoinLateRU"

	is_grozny = FALSE
	is_modernday = FALSE
	is_ww2 = FALSE
	is_cowmdww3 = TRUE

	uses_squads = TRUE

	min_positions = 25
	max_positions = 80

/datum/job/russian/codmwww3_ru_soldier/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/russian(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction2(H), slot_wear_id)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen/armour = new /obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen(null)
	uniform.attackby(armour, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(H), slot_gloves)

//head
	if (prob(70))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/russian_b7(H), slot_head)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/ruscap_fed(H), slot_head)
//back
	if (prob(80))
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak74m(H), slot_shoulder)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/green/sov_74m(H), slot_belt)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/pkm(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/largepouches/pkm(H), slot_belt)



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

	H.civilization = "Inner Circle"
	give_random_name(H)
	H.add_note("Role", "You are a <b>[title]</b>, apart of the Inner Circle. Follow orders given by your superiors and defeat the enemy!")
	H.add_note("Role", "You are a <b>[title]</b>, take out enemy officers and high value targets from a distance!")
	H.add_note("Partisan Mechanics", "- Press <b>C</b> to place a booby trap while holding a grenade.")
	H.setStat("strength", STAT_HIGH)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_HIGH)
	H.setStat("dexterity", STAT_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE
/////////////////////////////////////////////////////////////////////////////////////////////////////////////AMERICAN//////////////////////////////////////////////////////////////
/datum/job/american/codmwww3_lieutenant
	title = "American Force Lieutenant"
	rank_abbreviation = "Lt."

	spawn_location = "JoinLateRNCap"


	is_ww2 = FALSE
	is_cowmdww3 = TRUE
	is_modernday = FALSE
	is_officer = TRUE
	is_commander = TRUE
	whitelisted = TRUE
	is_radioman = TRUE
	can_be_female = TRUE

	min_positions = 1
	max_positions = 2

/datum/job/american/codmwww3_lieutenant/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_camo_ocp(H), slot_w_uniform)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/jungle_hat/khaki(H), slot_head)

	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/m16/commando/m4mws/att(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/m9beretta(H), slot_belt)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	give_random_name(H)
	H.civilization = "American Force"
	H.add_note("Role", "You are a <b>[title]</b>. You are in charge of the whole platoon. Organize your troops accordingly!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/datum/job/american/codmwww3_sergeant
	title = "American Force Sergeant"
	rank_abbreviation = "Sgt."

	spawn_location = "JoinLateRNCap"

	is_ww2 = FALSE
	is_upa = FALSE
	is_cowmdww3 = TRUE
	is_modernday = FALSE
	is_squad_leader = TRUE
	uses_squads = TRUE
	is_radioman = TRUE
	can_be_female = TRUE

	can_get_coordinates = TRUE

	min_positions = 2
	max_positions = 8

/datum/job/american/codmwww3_sergeant/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_camo_ocp(H), slot_w_uniform)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/ach(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/m16/commando/m4mws/att(H), slot_shoulder)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/m9beretta(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	var/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp/ocp_armor = new /obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp(null)
	uniform.attackby(ocp_armor, H)
	give_random_name(H)
	H.civilization = "American Force"
	H.add_note("Role", "You are a <b>[title]</b>, lead a squad against the Insurgents!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/datum/job/american/codmwww3_medic
	title = "American Force Field Medic"
	rank_abbreviation = "Cpl."

	spawn_location = "JoinLateRN"

	is_ww2 = FALSE
	is_upa = FALSE
	is_cowmdww3 = TRUE
	is_modernday = FALSE
	can_be_female = TRUE

	min_positions = 2
	max_positions = 8

/datum/job/american/codmwww3_medic/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_camo_ocp(H), slot_w_uniform)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/ach(H), slot_head)
//back
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat/modern(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol/m9beretta(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/custom/armband/white = new /obj/item/clothing/accessory/custom/armband(null)
	uniform.attackby(white, H)
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)
	var/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp/ocp_armor = new /obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp(null)
	uniform.attackby(ocp_armor, H)
	give_random_name(H)
	H.civilization = "American Force"
	H.add_note("Role", "You are a <b>[title]</b>. Keep your fellow soldiers healthy!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_VERY_HIGH)
	H.setStat("machinegun", STAT_MEDIUM_LOW)
	return TRUE

/datum/job/american/codmwww3_soldier
	title = "American Force Rifleman"
	rank_abbreviation = "Pvt."

	spawn_location = "JoinLateRN"

	is_ww2 = FALSE
	is_upa = FALSE
	is_cowmdww3 = TRUE
	is_modernday = FALSE

	uses_squads = TRUE
	can_be_female = TRUE
	min_positions = 10
	max_positions = 100

/datum/job/american/codmwww3_soldier/equip(var/mob/living/human/H)
	if (!H)	return FALSE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////