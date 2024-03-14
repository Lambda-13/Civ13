/client/verb/icons_dmf()
	set name = "Change Size"
	set category = "ООС"
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

/client/verb/icons_scale()
	set name = "Change Scale"
	set category = "ООС"
	set desc = "Меняет алгоритм сжатия изображения."

	var/choice = WWinput(usr, "Какой алгоритм Вы выберете?", "Алгоритм", "Авто", list("Авто","Метод ближайшего соседа","Размытие"))
	if (choice == "Авто")
		winset(src, "mapwindow.map", "zoom-mode=normal")
	else if (choice == "Метод ближайшего соседа")
		winset(src, "mapwindow.map", "zoom-mode=distort")
	else if (choice == "Размытие")
		winset(src, "mapwindow.map", "zoom-mode=blur")
	return