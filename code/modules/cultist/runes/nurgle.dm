/datum/rune_recipe/nurgle/deathtolerance
	name = "Death Tolerance Rite"
	ingredients = list(/obj/item/reagent_containers/food/snacks/poo)
	effect_path = /datum/heretic_effect/deathtolerant

/datum/rune_recipe/nurgle/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special = TRUE

/datum/rune_recipe/nurgle/conversion/do_special(mob/living/carbon/user, obj/effect/cleanable/heretic_rune/rune, list/items)
	var/mob/living/carbon/human/target = items[1]
	if(target.stat != DEAD && target.mind)
		var/datum/heretic_deity/nurgle/N = GOD(GOD_NURGLE)
		N.join_request(target)

/datum/rune_recipe/nurgle/offer_brain
	ingredients = list(/obj/item/organ/internal/brain)
	special = TRUE

/datum/rune_recipe/nurgle/offer_brain/do_special(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, 15)

/datum/rune_recipe/nurgle/offer_gem
	ingredients = list(/obj/item/stack/thrones)
	special = TRUE

/datum/rune_recipe/nurgle/offer_gem/do_special(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, 25)

/datum/rune_recipe/nurgle/toughen
	name = "Toughen Rite"
	ingredients = list(/obj/item/newore/gems/quartz)
	effect_path = /datum/heretic_effect/tough

/datum/rune_recipe/nurgle/nganga
	name = "Nganga Rite"
	ingredients = list(/obj/item/reagent_containers/food/snacks/meat/rat_meat)
	product_path = /obj/structure/nganga

/datum/rune_recipe/nurgle/uniform
	name = "Uniform Rite"
	ingredients = list(/obj/item/clothing/under/guard/uniform)
	product_path = /obj/item/clothing/under/guard/renegadeuniform

/datum/rune_recipe/nurgle/plate
	name = "Plate Rite"
	ingredients = list(/obj/item/stack/material/cloth)
	product_path = /obj/item/clothing/suit/armor/flak1/renegadearmor

/datum/rune_recipe/nurgle/mask
	name = "Mask Rite"
	ingredients = list(/obj/item/clothing/mask/gas)
	product_path = /obj/item/clothing/head/helmet/culthelm/gas

/datum/rune_recipe/nurgle/nade
	name = "Nade Rite"
	ingredients = list(/obj/item/reagent_containers/food/snacks/meat, /obj/item/reagent_containers/food/snacks/egg)
	product_path = /obj/item/grenade/spawnergrenade/bugs

/datum/rune_recipe/nurgle/blight
	name = "Blightnade Rite"
	ingredients = list(/obj/item/newore/gems/ruby, /obj/item/organ/internal/liver)
	product_path = /obj/item/grenade/chem_grenade/blightnade

/datum/rune_recipe/nurgle/nurgling
	name = "Nurgling Rite"
	ingredients = list(/obj/item/organ/internal/appendix, /obj/item/newore/gems/sapphire)
	product_path = /mob/living/simple_animal/hostile/nurgling

/datum/rune_recipe/nurgle/offering
	name = "Offering Rite"
	ingredients = list(/obj/item/newore/gems/emerald)
	delete_items = FALSE
	special 	 = TRUE
