/world/proc/SetupExternalRSC()
#if (PRELOAD_RSC == 0)
	GLOB.external_rsc_urls = file2list("config/external_rsc_urls.txt","\n")
	var/i=1
	while(i<=GLOB.external_rsc_urls.len)
		if(GLOB.external_rsc_urls[i])
			i++
		else
			GLOB.external_rsc_urls.Cut(i,i+1)
#endif
