/mob/proc/see_personalized_MOTD()
	if (!client)
		return
	var/_motd = join_motd
	_motd = replacetext(_motd, "{server_map}", map ? map.title : "unknown")
	_motd = replacetext(_motd, "{server_version}", "BYOND [world.byond_version].[world.byond_build]")
	_motd = replacetext(_motd, "{client_version}", "BYOND [client.byond_version].[client.byond_build]")
	_motd = replacetext(_motd, "{authenticate}", "[client.authenticate]")
	_motd = replacetext(_motd, "{world_fps}", "[world.fps]")
	_motd = replacetext(_motd, "{client_fps}", "[client.fps]")
	_motd = replacetext(_motd, "{computer_id}", "[client.computer_id]")
	_motd = replacetext(_motd, "{world_tick_lag}", "[world.tick_lag]")
	src << "<div class=\"motd\">[_motd]</div>"
	client.player_memo_show()