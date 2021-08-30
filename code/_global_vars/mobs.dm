GLOBAL_LIST_EMPTY(clients)   //all clients
GLOBAL_LIST_EMPTY(admins)    //all clients whom are admins
GLOBAL_PROTECT(admins)
GLOBAL_LIST_EMPTY(ckey_directory) //all ckeys with associated client

//Server access whitelist
var/global/list/ckey_whitelist = null

var/global/list/hellbans = null//Hellbanned boys

GLOBAL_VAR(cargo_password)			//Goes into the mind of the Requisitions Officer.

GLOBAL_VAR(final_words) //Final words of the first person who died.

GLOBAL_VAR(first_death) //The first person who died.

GLOBAL_VAR(first_death_happened) //bool to check it happened