////////////////////////////////////////////////////////////////////////////
///////////////////////////////////Companies////////////////////////////////
////////////////////////////////////////////////////////////////////////////

/mob/living/human/proc/create_company()
	set name = "Create Company"
	set category = "Faction"
	var/mob/living/human/U

	if (istype(src, /mob/living/human))
		U = src
	else
		return
	if (map.civilizations == TRUE || map.ID == MAP_TRIBES || map.ID == MAP_THREE_TRIBES || map.ID == MAP_NATIONSRP || map.ID == MAP_FOUR_KINGDOMS || map.ID == MAP_BOHEMIA || map.ID == MAP_COLONY_CONTINENTAL)
		var/choosename = input(U, "Имя компании:") as text|null
		create_company_pr(choosename)
		return
	else
		U << "<span class='danger'>В этой местности нельзя открывать свои фирмы.</span>"
		return

/mob/living/human/proc/create_company_pr(var/newname = "none")
	if (!ishuman(src))
		return
	var/mob/living/human/H = src
	for(var/i = 1, i <= map.custom_company_nr.len, i++)
		if (map.custom_company_nr[i] == newname || newname == "Global")
			usr << "<span class='danger'>Выбери другое название.</span>"
			return
	if (newname != null && newname != "none")
		var/choosecolor1 = "#000000"
		var/choosecolor2 = "#FFFFFF"
		choosecolor1 = WWinput(H, "Главный цвет фирмы:", "Main Color" , "#000000", "color")
		if (choosecolor1 == null || choosecolor1 == "")
			return

		choosecolor2 = WWinput(H, "Фоновый цвет фирмы:", "Secondary Color" , "#FFFFFF", "color")
		if (choosecolor2 == null || choosecolor2 == "")
			return

		map.custom_company_nr += newname
		var/list/newnamev = list("[newname]" = list(list(H,100,0)))
		map.custom_company += newnamev
		map.custom_company_colors += list("[newname]" = list(choosecolor1,choosecolor2))
		usr << "<big>Ты владеешь <b>100%</b> акциями компании [newname].</big>"
		return
	else
		return

/mob/living/human/proc/transfer_company_stock()
	set name = "Transfer Company Stock"
	set category = "Faction"
	var/mob/living/human/H
	if (istype(src, /mob/living/human))
		H = src
	else
		return
	if (map.civilizations == TRUE || map.ID == MAP_TRIBES || map.ID == MAP_THREE_TRIBES || map.ID == MAP_NATIONSRP || map.ID == MAP_FOUR_KINGDOMS || map.ID == MAP_BOHEMIA)
		var/found = FALSE
		var/list/currlist = list()
		var/list/currlist_ind = list("Cancel")
		for (var/cname in map.custom_company_nr)
			for (var/i = 1, i <= map.custom_company[cname].len, i++)
				if (map.custom_company[cname][i][1] == H)
					currlist += list("[cname]" = list(map.custom_company[cname][i][2]))
					currlist_ind += cname
					found = TRUE
		if (!found)
			usr << "У тебя нету акции."
			return
		else
			var/compchoice = WWinput(H, "Какой компании передать право собственности на акции?", "Stock Transfer", "Cancel", currlist_ind)
			if (compchoice == "Cancel")
				return
			else
				var/compchoice_amt = input(H, "Ты владеешь [currlist[compchoice][1]]% от [compchoice]. Сколько первести? (1 в [currlist[compchoice][1]])") as num|null
				compchoice_amt = round(compchoice_amt)
				if (compchoice_amt > currlist[compchoice][1])
					compchoice_amt = currlist[compchoice][1]
				else if (compchoice_amt <= 0)
					return
				var/list/closemobs = list("Cancel")
				for (var/mob/living/human/M in range(4,loc))
					if (M.stat != DEAD)
						closemobs += M
				var/choice2 = WWinput(usr, "Кому перевести акции?", "Stock Transfer", "Cancel", closemobs)
				if (choice2 == "Cancel")
					return
				else
					var/mob/living/human/CM = choice2
					for(var/l=1, l <= map.custom_company[compchoice].len, l++)
						if (map.custom_company[compchoice][l][1] == H)
							var/currb = map.custom_company[compchoice][l][2]
							map.custom_company[compchoice][l][2] = currb-compchoice_amt

					for(var/l=1,  l <= map.custom_company[compchoice].len, l++)
						if (map.custom_company[compchoice][l][1] == CM)
							var/currb = map.custom_company[compchoice][l][2]
							map.custom_company[compchoice][l][2] = currb+compchoice_amt
							return
					map.custom_company[compchoice] += list(list(CM,compchoice_amt,0))
					H << "<big>Передаю [compchoice_amt]% акции от [compchoice] для [CM].</big>"
					CM << "<big>Получил [compchoice_amt]% акции от [compchoice] для [H].</big>"
					return
	else
		usr << "<span class='danger'>Не могу передать компанию.</span>"
		return

//searches company members for a player
/proc/find_company_member(var/mob/living/human/H, var/company)
	if (!map || !H || !company)
		return FALSE

	if (company == "Global")
		return FALSE

	if (!map.custom_company[company] || !map.custom_company[company].len)
		return FALSE

	for(var/i=1,i<=map.custom_company[company].len,i++)
		if (map.custom_company[company][i][1] == H && map.custom_company[company][i][2] > 0)
			return TRUE

	return FALSE

//for automated transfers e.g. stock market
/mob/living/human/proc/transfer_stock_proc(var/companyname, var/stock, var/mob/living/human/target)
	if (!companyname || !stock || !target)
		return

	for(var/l=1, l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == src)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb-stock

	for(var/l=1,  l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == target)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb+stock
			return
	map.custom_company[companyname] += list(list(target,stock,0))
	src << "<big>Передаю [stock]% акции от [companyname] в [target].</big>"
	target << "<big>Получаю [stock]% акции от [companyname] в [src].</big>"
	return

//to be used when the seller does not exist (normally if he died and theres no body)
//the stock is still for sale but "nobody" will receive the cost.
/proc/transfer_stock_nomob(var/companyname, var/stock, var/mob/living/human/target)
	if (!companyname || !stock || !target)
		return

	for(var/l=1, l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == null)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb-stock

	for(var/l=1,  l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == target)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb+stock
			return
	map.custom_company[companyname] += list(list(target,stock,0))
	target << "<big>Получаю [stock]% от [companyname] на рынке.</big>"
	return