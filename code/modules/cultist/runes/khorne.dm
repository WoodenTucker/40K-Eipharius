/datum/rune_recipe/khorne/offer_bioprinted
	ingredients = list(/obj/item/organ/internal/heart/bioprinted)
	special = TRUE

/datum/rune_recipe/khorne/offer_skull/do_special(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, 0)

/datum/rune_recipe/khorne/offer_skull
	ingredients = list(/obj/item/organ/external/head)
	special = TRUE

/datum/rune_recipe/khorne/offer_skull/do_special(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, 30)

/datum/rune_recipe/khorne/knife_teeth
	name = "Enchant Knife Rite"
	ingredients = list(/obj/item/stack/teeth,  /obj/item/material/sword/combat_knife)
	special = TRUE

/datum/rune_recipe/khorne/knife_teeth/do_special(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	switch(rand(1,10))
		if(1)
			new /obj/item/material/sword/chaosknife(get_turf(rune))
		if(2)
			new /obj/item/material/scythe(get_turf(rune))
		if(3)
			new /obj/item/material/sword/demon(get_turf(rune))
		if(4)
			new /obj/item/material/sword/combat_knife/glaive(get_turf(rune))
		if(5)
			new /obj/item/material/sword/choppa(get_turf(rune))
		if(6)
			new /obj/item/melee/trench_axe/lance(get_turf(rune))
		if(7)
			new /obj/item/melee/trench_axe/bspear(get_turf(rune))
		if(8)
			new /obj/item/melee/trench_axe/bardiche(get_turf(rune))
		if(9)
			new /obj/item/melee/trench_axe/glaive(get_turf(rune))
		if(10)
			new /obj/item/melee/chain/pcsword/khorneaxe(get_turf(rune))

/datum/rune_recipe/khorne/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special 	 = TRUE

/datum/rune_recipe/khorne/conversion/do_special(mob/living/carbon/user, obj/effect/cleanable/heretic_rune/rune, list/items)
	var/mob/living/carbon/human/target = items[1]
	if(target.stat != DEAD && target.mind)
		var/datum/heretic_deity/khorne/N = GOD(GOD_KHORNE)
		N.join_request(target)
