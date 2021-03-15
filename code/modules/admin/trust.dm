//Wel ard's retarded take on the comrade system

#define TRUSTWHITELIST "data/trust.txt" //its just ckeys so who cares if people see them.

/hook/startup/proc/loadTrustWhitelistonstart()
	load_trust_whitelist()
	return 1

/proc/load_trust_whitelist()
	log_and_message_admins("Loading trust.txt")
	trust_whitelist = list()
	var/list/Lines = file2list(TRUSTWHITELIST)
	for(var/line in Lines)
		if(!length(line))
			continue

		var/ascii = text2ascii(line,1)

		if(copytext(line,1,2) == "#" || ascii == 9 || ascii == 32)//# space or tab
			continue

		trust_whitelist.Add(ckey(line))

	if(!trust_whitelist.len)
		log_and_message_admins("trust_whitelist: empty or missing.")
		trust_whitelist = null
	else
		log_and_message_admins("trust_whitelist: [trust_whitelist.len] entrie(s).")

/proc/check_trust_whitelisted(var/ckey)
	return (trust_whitelist && (ckey in trust_whitelist))



/datum/admins/proc/ReloadTrustWhitelist()
	set category = "Server"
	set name = "Reload trust Whitelist"
	set desc="Reloads the trust Whitelist."

	load_trust_whitelist()
	log_and_message_admins("[key_name(usr)] has reloaded the trust whitelist.")




#undef TRUSTWHITELIST