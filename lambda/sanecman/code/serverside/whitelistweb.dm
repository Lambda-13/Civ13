#define CKEYWHITELIST "SQL/whitelist.txt"

var/global/list/ckeywhitelistweb = list()

/proc/load_ckey_whitelist()
	ckeywhitelistweb = list()
	var/list/Lines = file2list(CKEYWHITELIST)
	for(var/line in Lines)
		if(!length(line))
			continue

		var/ascii = text2ascii(line,1)

		if(copytext(line,1,2) == "#" || ascii == 9 || ascii == 32)//# space or tab
			continue

		ckeywhitelistweb.Add(ckey(line))

	if(!ckeywhitelistweb.len)
		ckeywhitelistweb = null

/proc/check_ckey_whitelisted(var/ckey)
	return (ckeywhitelistweb && (ckey in ckeywhitelistweb) )