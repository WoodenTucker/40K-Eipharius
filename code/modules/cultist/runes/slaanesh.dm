/datum/rune_recipe/slaanesh/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special 	 = TRUE

/datum/rune_recipe/slaanesh/conversion/do_special(mob/living/carbon/user, obj/effect/cleanable/heretic_rune/rune, list/items)
	var/mob/living/carbon/human/target = items[1]
	if(target.stat != DEAD && target.mind)
		var/datum/heretic_deity/slaanesh/N = GOD(GOD_SLAANESH)
		N.join_request(target)

/datum/rune_recipe/slaanesh/knife
	name = "Skinning Knife"
	ingredients = list(/obj/item/melee/sword/combat_knife)
	delete_items = TRUE
	product_path = /obj/item/melee/sword/skinning_knife

/datum/rune_recipe/slaanesh/dagger
	name = "Slaanesh Dagger"
	ingredients = list(/obj/item/melee/sword/combat_knife)
	delete_items = TRUE
	product_path = /obj/item/melee/sword/slehdagger

/datum/rune_recipe/slaanesh/arm
	name = "Enchant Arm Rite"
	ingredients = list(/obj/item/melee/whip/lashoftorment, /obj/item/clothing/mask/masquerade, /obj/item/clothing/suit/armor/slanclothing)
	effect_path = /datum/heretic_effect/enchantedarm

/datum/rune_recipe/slaanesh/escape
	name = "Escape Artist Rite"
	ingredients = list(/obj/item/handcuffs)
	effect_path = /datum/heretic_effect/escape_artist