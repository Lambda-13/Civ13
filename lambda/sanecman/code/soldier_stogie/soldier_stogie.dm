/obj/item/clothing/mask/smokable/cigarette/cigar/soldier_stogie
	name = "солдатская сигара"
	desc = "Иногда сигара — это просто сигара. И еще иногда, в случае сигары, сделанной Солдатом вручную, это гравий, навоз, человеческие волосы и наполнитель для тако, завернутые в старые пластыри."
	icon_state = "cigar2off"
	icon_on = "cigar2on"
	icon_off = "cigar2off"
	type_butt = /obj/item/weapon/cigbutt/cigarbutt
	throw_speed = 0.5
	item_state = "cigaroff"
	smoketime = 4500
	chem_volume = 130
	matchmes = "<span class='notice'>USER lights their NAME with their FLAME.</span>"
	lightermes = "<span class='notice'>USER manages to offend their NAME by lighting it with FLAME.</span>"
	zippomes = "<span class='rose'>With a flick of their wrist, USER lights their NAME with their FLAME.</span>"
	weldermes = "<span class='notice'>USER insults NAME by lighting it with FLAME.</span>"
	ignitermes = "<span class='notice'>USER fiddles with FLAME, and manages to light their NAME with the power of science.</span>"
	value = 17

	New()
		..()
		reagents.add_reagent("nicotine", 30)
		reagents.add_reagent("stamina_vigor", 50)
		reagents.add_reagent("draught", 50)