/mob/living/human/var/list/next_look_at = list()
/mob/living/human/examine(var/mob/user)

	if (ishuman(user))
		var/mob/living/human/H = user
		if (!H.next_look_at.Find(getRoundUID(TRUE)) || H.next_look_at[getRoundUID(TRUE)] <= world.time)
			H.visible_message("<small>[H] looks at [src].</small>")
			H.next_look_at[getRoundUID(TRUE)] = world.time + 100

	var/skipgloves = FALSE
	var/skipjumpsuit = FALSE
	var/skipshoes = FALSE
	var/skipmask = FALSE
	var/skipears = FALSE
	var/skipface = FALSE

	//exosuits and helmets obscure our view and stuff.
	if (wear_suit)
		skipgloves = wear_suit.flags_inv & HIDEGLOVES
		skipjumpsuit = wear_suit.flags_inv & HIDEJUMPSUIT
		skipshoes = wear_suit.flags_inv & HIDESHOES

	if (head)
		skipmask = head.flags_inv & HIDEMASK
		skipears = head.flags_inv & HIDEEARS
		skipface = head.flags_inv & HIDEFACE

	if (wear_mask)
		skipface |= wear_mask.flags_inv & HIDEFACE

	var/msg = "<span class='info'>*---------*\nЭто "

	var/datum/gender/T = gender_datums[gender]
	if (skipjumpsuit && skipface) //big suits/masks/helmets make it hard to tell their gender
		T = gender_datums[PLURAL]
	else
		if (icon)
			msg += "\icon[icon] " //fucking BYOND: this should stop dreamseeker crashing if we -somehow- examine somebody before their icon is generated

	if (!T)
		// Just in case someone VVs the gender to something strange. It'll runtime anyway when it hits usages, better to CRASH() now with a helpful message.
		CRASH("Gender datum was null; key was '[(skipjumpsuit && skipface) ? PLURAL : gender]'")

	msg += "<EM>[name]</EM>"
	if (species.name != "Human")
		msg += ", a <b><font color='[species.flesh_color]'>[species.name]</font></b>"
	msg += "!\n"

	//uniform
	if (w_uniform && !skipjumpsuit)
		//Ties
		var/tie_msg
		if (istype(w_uniform,/obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if (U.accessories.len)
				if (!wear_suit)
					tie_msg += ". На одежде видно [lowertext(russian_list(U.accessories))]"
		if (w_uniform.blood_DNA)
			msg += "<span class='warning'>[T.He_ru] носит \icon[w_uniform] [w_uniform.name][(w_uniform.blood_color != "#030303") ? "(в крови)" : "(в масле)"][tie_msg]!</span>\n"
		else
			msg += "[T.He_ru] носит \icon[w_uniform] [w_uniform][tie_msg].\n"

	//head
	if (head)
		if (head.blood_DNA)
			msg += "<span class='warning'>На голове \icon[head] [head.name] [(head.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "На голове \icon[head] [head].\n"

	//suit/armor
	if (wear_suit)
		if (wear_suit.blood_DNA)
			msg += "<span class='warning'>[T.He_ru] одет[T.he=="he"?"":"а"] в \icon[wear_suit] [wear_suit.name] [(wear_suit.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "[T.He_ru] одет[T.he=="he"?"":"а"] в \icon[wear_suit] [wear_suit].\n"

	//back
	if (back)
		if (back.blood_DNA)
			msg += "<span class='warning'>На спине висит \icon[back] [back] [(back.blood_color != "#030303") ? "(в крови)" : "(в масле)"].</span>\n"
		else
			msg += "На спине висит \icon[back] [back].\n"

	//shoulder
	if (shoulder)
		if (shoulder.blood_DNA)
			msg += "<span class='warning'>На плече висит \icon[shoulder] [shoulder] [(shoulder.blood_color != "#030303") ? "(в крови)" : "(в масле)"].</span>\n"
		else
			msg += "На плече висит \icon[shoulder] [shoulder].\n"


	//left hand
	if (l_hand)
		if (l_hand.blood_DNA)
			msg += "<span class='warning'>В левой руке у [T.his_ru] \icon[l_hand] [l_hand.name] [(l_hand.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "В левой руке у [T.his_ru] \icon[l_hand] [l_hand].\n"

	//right hand
	if (r_hand)
		if (r_hand.blood_DNA)
			msg += "<span class='warning'>В правой руке у [T.his_ru] \icon[r_hand] [r_hand.name] [(r_hand.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "В правой руке у [T.his_ru] \icon[r_hand] [r_hand].\n"

	//gloves
	if (gloves && !skipgloves)
		if (gloves.blood_DNA)
			msg += "<span class='warning'>На [T.his_ru] руках \icon[gloves] [gloves.name] [(gloves.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "На [T.his_ru] руках \icon[gloves] [gloves].\n"
	else if (blood_DNA)
		msg += "<span class='warning'>[T.His_ru] руки [(hand_blood_color != "#030303") ? "в крови" : "в масле"]!</span>\n"

	//handcuffed?
	if (handcuffed)
		msg += "<span class='warning'>[T.He_ru] \icon[handcuffed] в наручниках!</span>\n"

	//buckled
	if (buckled)
		msg += "<span class='warning'>[T.He_ru] сидит на \icon[buckled] [buckled]!</span>\n"

	//belt
	if (belt)
		if (belt.blood_DNA)
			msg += "<span class='warning'>На [T.his_ru] поясе висит \icon[belt] [belt.name] [(belt.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "На [T.his_ru] поясе висит \icon[belt] [belt].\n"

	//shoes
	if (shoes && !skipshoes)
		if (shoes.blood_DNA)
			msg += "<span class='warning'>На ногах у н[T.his_ru] \icon[shoes] [shoes.name] [(shoes.blood_color != "#030303") ? "(в крови)" : "(в масле)"]!</span>\n"
		else
			msg += "На ногах у н[T.his_ru] \icon[shoes] [shoes].\n"
	else if (feet_blood_DNA)
		msg += "<span class='warning'>[T.His_ru] ноги [(feet_blood_color != "#030303") ? "в крови" : "в масле"] feet!</span>\n"

	//mask
	if (wear_mask && !skipmask)
		var/descriptor = "на лице"
		if (istype(wear_mask, /obj/item/weapon/grenade))
			descriptor = "в зубах"
		if (wear_mask.blood_DNA)
			msg += "<span class='warning'>А так-же \icon[wear_mask] [wear_mask.name]  [(wear_mask.blood_color != "#030303") ? "(в крови)" : "(в масле)"] [descriptor]!</span>\n"
		else
			msg += ">А так-же \icon[wear_mask] [wear_mask] [descriptor].\n"

	//left ear
	if (l_ear && !skipears)
		msg += "На [T.his_ru] висит \icon[l_ear] [l_ear].\n"

	//right ear
	if (r_ear && !skipears)
		msg += "На [T.his_ru] висит \icon[r_ear] [r_ear].\n"

	//ID
	if (wear_id)
		/*var/id
		if (istype(wear_id, /obj/item/pda))
			var/obj/item/pda/pda = wear_id
			id = pda.owner
		else if (istype(wear_id, /obj/item/weapon/card/id)) //just in case something other than a PDA/ID card somehow gets in the ID slot :[
			var/obj/item/weapon/card/id/idcard = wear_id
			id = idcard.registered_name
		if (id && (id != real_name) && (get_dist(src, usr) <= 1) && prob(10))
			msg += "<span class='warning'>[T.He_ru] [T.is] wearing \icon[wear_id] \a [wear_id] yet something doesn't seem right...</span>\n"
		else*/
		msg += "У [T.his_ru] на груди висит \icon[wear_id] [wear_id].\n"

	//Jitters
	if (is_jittery)
		if (jitteriness >= 300)
			msg += "<span class='warning'><b>[T.He_ru] в конвульсиях!</b></span>\n"
		else if (jitteriness >= 200)
			msg += "<span class='warning'>[T.He_ru] дёргается.</span>\n"
		else if (jitteriness >= 100)
			msg += "<span class='warning'>[T.He_ru] немного подёргивается.</span>\n"

	//splints
	for (var/organ in list("l_leg","r_leg","l_arm","r_arm"))
		var/obj/item/organ/external/o = get_organ(organ)
		if (o && o.status & ORGAN_SPLINTED)
			msg += "<span class='warning'>[T.His_ru] [o.name] перебинтована!</span>\n"


	var/distance = get_dist(usr,src)
	if (isghost(usr) || usr.stat == DEAD) // ghosts can see anything
		distance = TRUE
	if (stat)
		msg += "<span class='warning'>Похоже [T.he_ru] без сознания.</span>\n"
		if ((stat == DEAD || losebreath) && distance <= 3)
			msg += "<span class='warning'>[T.He_ru] не дышит.</span>\n"

	if (fire_stacks)
		msg += "[T.He_ru] покрыт чем-то горючим.\n"
	if (on_fire)
		msg += "<span class='warning'>[T.He_ru] горит!</span>\n"
	msg += "<span class='warning'>"

	msg += "</span>"

	if (species.show_ssd && (!species.has_organ["brain"] || has_brain()) && stat != DEAD)
		if (!key)
			msg += "<span class='deadsay'>[T.He_ru] [species.show_ssd]. Похоже [T.he_ru] не скоро придёт в себя.</span>\n"
		else if (!client)
			msg += "<span class='deadsay'>[T.He_ru] [species.show_ssd].</span>\n"

	var/list/wound_flavor_text = list()
	var/list/is_bleeding = list()

	//old system of checking health was causing problems since monkeys have less total health than humans.

	var/health_percentage = health

	if (istype(user, /mob/living/human) && user:species)
		var/mob/living/human/H = user
		health_percentage = (health/H.species.total_health) * 100

	if (health_percentage <= 75 && health_percentage > 50)//Is the person a little hurt?
		msg += "<span class='warning'><b>[T.He_ru] легко ранен.\n</b></span>"

	if (health_percentage <= 50 && health_percentage > 25)//Hurt.
		msg += "<span class='warning'><b>[T.He_ru] сильно ранен.</b></span>\n"

	if (health_percentage <= 25)//Or incredibly hurt.
		msg += "<span class='warning'><b>[T.He_ru] смертельно ранен.</b>\n</span>"

	for (var/organ_tag in species.has_limbs)

		var/list/organ_data = species.has_limbs[organ_tag]
		var/organ_descriptor = organ_data["descriptor"]
		var/obj/item/organ/external/E = organs_by_name[organ_tag]
		if (!E)
			wound_flavor_text["[organ_descriptor]"] = "<span class='warning'><b>У [T.his_ru] отсутствует [organ_descriptor].</b></span>\n"
		else if (E.is_stump())
			wound_flavor_text["[organ_descriptor]"] = "<span class='warning'><b>У [T.his_ru] обрубок [organ_descriptor].</b></span>\n"
		else
			continue

	for (var/obj/item/organ/external/temp in organs)
		if (temp)
			if (temp.wounds.len > 0 || temp.open)
				/*if (temp.is_stump() && temp.parent_organ && organs_by_name[temp.parent_organ])
					var/obj/item/organ/external/parent = organs_by_name[temp.parent_organ]
					wound_flavor_text["[temp.name]"] = "<span class='warning'>[T.He_ru] [T.has] [temp.get_wounds_desc()] on [T.his] [parent.name].</span><br>"
				else
					wound_flavor_text["[temp.name]"] = "<span class='warning'>[T.He_ru] [T.has] [temp.get_wounds_desc()] on [T.his] [temp.name].</span><br>"
				*///Removing because they're unneeded bloat descriptions.
				if (temp.status & ORGAN_BLEEDING)
					is_bleeding["[temp.name]"] = "<span class='danger'>[T.His_ru] [temp.name] кровоточит!</span><br>"
			else
				wound_flavor_text["[temp.name]"] = ""
			if (temp.dislocated == 2)
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[T.His_ru] [temp.joint] вывихнута!</span><br>"
			if (((temp.status & ORGAN_BROKEN) && temp.brute_dam > temp.min_broken_damage) || (temp.status & ORGAN_MUTATED))
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[T.His] [temp.name] сломана!</span><br>"

	//Handles the text strings being added to the actual description.
	//If they have something that covers the limb, and it is not missing, put flavortext.  If it is covered but bleeding, add other flavortext.


	for (var/limb in wound_flavor_text)//Uneeded.
		msg += wound_flavor_text[limb]
		is_bleeding[limb] = null
	for (var/limb in is_bleeding)
		msg += is_bleeding[limb]
	for (var/implant in get_visible_implants(0))
		msg += "<span class='danger'>[src] [T.has] \a [implant] sticking out of [T.his] flesh!</span>\n"
	if (gender == MALE && circumcised && !w_uniform && !wear_suit)
		msg += "<span class='danger'>Крайняя плоть [src] обрезана!</span>\n"

	var/obj/item/organ/external/head/O = locate(/obj/item/organ/external/head) in organs
	if (O && O.get_teeth() < O.max_teeth)
		msg += "<span class='warning'>[O.get_teeth() <= 0 ? "32" : "[O.max_teeth - O.get_teeth()]"] of [T.his] зуб выбито!</span>\n"

	if (print_flavor_text()) msg += "[print_flavor_text()]\n"

	msg += "*---------*</span>"
	if (pose)
		if ( findtext(pose,".",length(pose)) == FALSE && findtext(pose,"!",length(pose)) == FALSE && findtext(pose,"?",length(pose)) == FALSE )
			pose = addtext(pose,".") //Makes sure all emotes end with a period.
		msg += "\n[T.He_ru] [T.is] [pose]"
	if (map && !map.civilizations && map.ID != MAP_LITTLE_CREEK && map.ID != MAP_GULAG13 && map.ID != MAP_THE_ART_OF_THE_DEAL && map.ID != MAP_OCCUPATION)
		if (original_job)
			if (ishuman(user) && user != src)
				var/mob/living/human/H = user
				if (H.original_job)
					if (H.original_job.base_type_flag() == original_job.base_type_flag()) // when you ghost, mind.assigned_job is set to null
						if (original_job.en_meaning)
							msg += "<br><i>You recognize [T.him] as a <b>[original_job.title] ([original_job.en_meaning])</b>.</i>"
						else
							msg += "<br><i>You recognize [T.him] as a <b>[original_job.title]</b>.</i>"
					else // examining someone on another team

			else if (isobserver(user))
				msg += "<br><i>[T.He_ru] [T.is] a [original_job.title].</i>"
	else if (map.ID == MAP_LITTLE_CREEK)
		if (ishuman(user) && user != src)
			var/mob/living/human/H = user
			if (H.original_job)
				if (H.original_job_title == original_job_title && original_job_title == "East Side Gang")
					msg += "<br><i>You recognize [T.him] as a fellow <b>[original_job.title] member</b>!</i>"
				else if (H.original_job_title == original_job_title && original_job_title == "West Side Gang")
					msg += "<br><i>You recognize [T.him] as a fellow <b>[original_job.title] member</b>!</i>"

	else if (map.ID == MAP_GULAG13)
		if (ishuman(user) && user != src)
			var/mob/living/human/H = user
			if (istype(H.original_job, /datum/job/civilian/prisoner) && istype(original_job, /datum/job/civilian/prisoner))
				msg += "<br><i>You recognize [T.him] as a prisoner named <b>[real_name]</b>.</i>"
				if (H.nationality == nationality)
					msg += "<br><i>You recognize [T.him] as a fellow <b>[H.nationality]</b>!</i>"
				if (H.original_job.title == "Collaborator" && original_job.title == H.original_job.title)
					msg += "<br><i>You recognize [T.him] as a fellow <b>collaborator</b>!</i>"
			if (H.faction_text == "RUSSIAN" && original_job.title == "Collaborator")
				msg += "<br><i>You recognize [T.him] as a <b>collaborator</b>!</i>"
	else if (map.ID == MAP_THE_ART_OF_THE_DEAL)
		if (ishuman(user) && user != src)
			var/mob/living/human/H = user
			if (H.civilization == "Sheriff Office" && src.civilization == "Sheriff Office")
				msg += "<br><i>[T.He_ru] is a member of the Sheriff Office.</i>"
			if (H.civilization == "Government" && src.civilization == "Sheriff Office")
				msg += "<br><i>[T.He_ru] is a member of the Sheriff Office.</i>"
			if (src.civilization == "Government")
				msg += "<br><i>[T.He_ru] is a member of the Government.</i>"
			if (src.gun_permit && H.civilization == "Sheriff Office")
				msg += "<br><b>[T.He_ru] has a valid gun permit.</b></b>"
	else if (map.ID == MAP_OCCUPATION)
		if (ishuman(user) && user != src)
			var/mob/living/human/H = user
			if (istype(H.original_job, /datum/job/civilian/ukrainian/occupation) && istype(original_job, /datum/job/civilian/ukrainian/occupation))
				msg += "<br><i>You recognize [T.him] as a fellow Partisan named <b>[real_name]</b>.</i>"
			if (istype(H.original_job, /datum/job/civilian/occupation) && istype(original_job, /datum/job/civilian/occupation))
				if (H.nationality == nationality)
					msg += "<br><i>You recognize [T.him] as a fellow <b>[H.nationality]</b>!</i>"
				if (H.original_job_title == "Auxillary Police" && original_job_title == H.original_job_title)
					msg += "<br><i>You recognize [T.him] as a fellow <b>Auxillary Police</b>!</i>"
			if (H.faction_text == "GERMAN" && original_job_title == "Auxillary Police")
				msg += "<br><i>You recognize [T.him] as a <b>collaborator</b>!</i>"

	else if (map.civilizations)
		if (ishuman(user) && user != src)
			var/mob/living/human/H = user
			if (map.ID == MAP_NATIONSRP)
				if (H.original_job_title == original_job_title)
					if (original_job_title == "Civilization A Citizen")
						msg += "<br><i><font color='green'>You recognize [T.him] as a citizen of your nation, <b>[civname_a]</b>.</i></font>"
					else
						msg += "<br><i><font color='green'>You recognize [T.him] as a citizen of your nation, <b>[civname_b]</b>.</i></font>"

				else
					if (original_job_title == "Civilization A Citizen")
						msg += "<br><font color='red'><i>[T.He_ru] is a citizen of the <b>[civname_a]</b>.</font></i>"
					else
						msg += "<br><font color='red'><i>[T.He_ru] is a citizen of the <b>[civname_b]</b>.</font></i>"
			if (H.religion == religion && religion_style == "Cultists" && religious_clergy == "Cultists")
				msg += "<br><i>You recognize [T.him] as an ordained <b>Cultist</b> of your cult, <b>[religion]</b>.</i>"
			else if (H.religion == religion && religion_style == "Cultists" && religious_clergy != "Cultists")
				msg += "<br><i>You recognize [T.him] as a member of your cult, <b>[religion]</b>.</i>"

			if (H.civilization == civilization && civilization != "none") // when you ghost, mind.assigned_job is set to null
				msg += "<br><i>You recognize [T.him] as a member of your faction, <b>[civilization]</b>.</i>"
				if (map.custom_civs[H.civilization][4] != null)
					if (map.custom_civs[H.civilization][4].real_name == real_name)
						msg += "<br><b>[T.He_ru] is the leader of your faction.</b>"

			else if (civilization == "none")
				msg += "<br><i>[T.He_ru] is a nomad. [T.He_ru] has no faction</b>.</i>"
			else
				msg += "<br><i>[T.He_ru] [T.is] a member of <b>[civilization]</b>.</i>"
			if (user.find_trait("Empathetic"))
				var/md
				switch(mood)
					if(-5000000 to 20)
						md = "seems to be in a horrible mood!"
					if(20 to 40)
						md = "seems to be in a bad mood."
					if(40 to 60)
						md = "seems to be in a neutral mood."
					if(60 to 80)
						md = "seems to be in a good mood."
					if(80 to 10000)
						md = "seems to be in an excellent mood!"
				msg += "<br><i>[T.He_ru] [md]</b>.</i>"
		else if (isobserver(user))
			if (civilization != "none")
				msg += "<br><i>[T.He_ru] [T.is] a member of <b>[civilization]</b>.</i>"
			else
				msg += "<br><i>[T.He_ru] is a nomad. [T.He_ru] has no faction</b>.</i>"

		else if (ishuman(user) && user == src)
			var/mob/living/human/H = user
			if (H.civilization != "none")
				msg += "<br><i>You belong to <b>[H.civilization]</b>.</i>"
				if (map && map.custom_civs[H.civilization][4] && map.custom_civs[H.civilization][4].real_name == H.real_name)
					msg += "<br><b>You are the leader of your group.</b>"
		if (left_factions.len && ishuman(user))
			for (var/i in left_factions)
				if (i[2]>world.realtime)
					msg += "<br><font color='red'>[T.He_ru] has abandoned <b>[i[1]]</b> recently!</font>"
	for (var/v in TRUE to embedded.len)
		msg += "<a href='?src=\ref[user];remove_embedded=[v]'>Remove [embedded[v]]</a>"

	user << msg

/mob/living/human/Topic(href, href_list[], hsrc)

	..()

	if (href_list["remove_embedded"])
		var/v = href_list["remove_embedded"]
		var/user = hsrc
		var/obj/embedded_obj = embedded[v]
		visible_message("<span class = 'danger'>[user] starts to pull [embedded_obj] out of [src].</span>")
		if (do_after(user, 15 * embedded_obj.w_class, src))
			visible_message("<span class = 'danger'>[user] pulls [embedded_obj] out of [src]!</span>")
			emote("painscream")
			adjustBruteLoss(rand(10,15))
		embedded -= embedded_obj
		embedded_obj.loc = get_turf(src)
