/datum/rune_recipe/khorne/offer_heart
	ingredients = list(/obj/item/organ/internal/heart)
	special = TRUE

/datum/rune_recipe/khorne/offer_heart/do_special(var/mob/living/carbon/user, var/obj/effect/heretic_rune/rune)
	SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, 10)

/datum/rune_recipe/khorne/knife_teeth
	name = "Enchant Knife Rite"
	ingredients = list(/obj/item/stack/teeth,  /obj/item/material/sword/combat_knife)
	special = TRUE

/datum/rune_recipe/khorne/knife_teeth/do_special(var/mob/living/carbon/user, var/obj/effect/heretic_rune/rune)
	switch(rand(1,10))
		if(1)
			new /obj/item/melee/chain/pcsword/eviscerator(get_turf(rune))
		if(2)
			new /obj/item/material/sword/cane(get_turf(rune))
		if(3)
			new /obj/item/material/sword/combat_knife/catachan(get_turf(rune))
		if(4)
			new /obj/item/melee/chain/inqcs(get_turf(rune))
		if(5)
			new /obj/item/material/sword/choppa(get_turf(rune))
		if(6)
			new /obj/item/melee/baton/loaded(get_turf(rune))
		if(7)
			new /obj/item/melee/chain/mercycs(get_turf(rune))
		if(8)
			new /obj/item/melee/chain/pcsword/khorneaxe(get_turf(rune))
		if(9)
			new /obj/item/melee/chain/pcsword/khorneaxe(get_turf(rune))
		if(10)
			new /obj/item/melee/chain/pcsword/khorneaxe(get_turf(rune))

/datum/rune_recipe/khorne/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special 	 = TRUE

/datum/rune_recipe/nurgle/conversion/do_special(mob/living/carbon/human/user, var/list/items)
	var/mob/living/carbon/human/target = locate() in items
	if(!isheretic(target))
		var/datum/heretic_deity/khorne/N = GOD(GOD_KHORNE)
		N.join_request(target)