/datum/rune_recipe/slaanesh/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special 	 = TRUE

/datum/rune_recipe/slaanesh/conversion/do_special(mob/living/carbon/human/user, var/list/items)
	var/mob/living/carbon/human/target = locate() in items
	if(!isheretic(target))
		var/datum/heretic_deity/slaanesh/N = GOD(GOD_SLAANESH)
		N.join_request(target)
		return

/datum/rune_recipe/slaanesh/knife
	name = "Skinning Knife"
	ingredients = list(/obj/item/material/sword/combat_knife)
	delete_items = TRUE
	product_path = /obj/item/material/sword/skinning_knife

/datum/rune_recipe/slaanesh/arm
	name = "Enchant Arm Rite"
	ingredients = list(/obj/item/melee/whip/lashoftorment, /obj/item/clothing/mask/masquerade, /obj/item/clothing/suit/armor/slanclothing)
	effect_path = /datum/heretic_effect/enchantedarm

/datum/rune_recipe/slaanesh/escape
	name = "Escape Artist Rite"
	ingredients = list(/obj/item/handcuffs)
	effect_path = /datum/heretic_effect/escape_artist