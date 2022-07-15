/client/verb/icons_dmf()
	set name = "Change Size"
	set category = "OOC"
	set desc = "Меняет размер экрана."
//	set hidden = TRUE

	var/choice = WWinput(usr, "Какой размер экрана?", "Размер", "Авто", list("Авто","128x128","96x96","64x64","48x48","32x32"))
	if (choice == "Авто")
		winset(src, "mapwindow.map", "icon-size=0")
	else if (choice == "128x128")
		winset(src, "mapwindow.map", "icon-size=128")
	else if (choice == "96x96")
		winset(src, "mapwindow.map", "icon-size=96")
	else if (choice == "64x64")
		winset(src, "mapwindow.map", "icon-size=64")
	else if (choice == "48x48")
		winset(src, "mapwindow.map", "icon-size=48")
	else if (choice == "32x32")
		winset(src, "mapwindow.map", "icon-size=32")
	else
		winset(src, "mapwindow.map", "icon-size=0")
	return