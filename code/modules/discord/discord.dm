// Sends to the SERVER STATUS channels.
// This sends to the "server_status" gamenudge route.
/proc/send2maindiscord(var/ckey, var/msg)
	send2discord(ckey, msg)

// Meta argument here is the MoMMI meta argument to send to the gamenudge route.
// AKA the MoMMI config file chooses where to send it based on this key.
/proc/send2discord(var/ckey, var/msg)
	processes.python.execute("discord.py")