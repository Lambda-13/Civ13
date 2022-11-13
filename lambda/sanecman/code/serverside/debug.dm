/client/proc/debug_links()
	set name = "Test Links"
	set category = "Особенное"
	var/links = input("src << link(\"ТЕКСТ_ТУТ\")")
	if(links)
		to_chat(src, "Текст: [links]")
		src << link(links)