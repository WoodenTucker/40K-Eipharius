/datum/rune_recipe/nurgle/deathtolerance
	name = "Death Tolerance Rite"
	ingredients = list(/mob/living/simple_animal/hostile/retaliate/rat, /obj/item/reagent_containers/food/snacks/poo)
	effect_path = /datum/heretic_effect/deathtolerant

/datum/rune_recipe/nurgle/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special = TRUE

/datum/rune_recipe/nurgle/conversion/do_special(mob/living/carbon/human/user, var/list/items)
	var/mob/living/carbon/human/target = locate(/mob/living/carbon/human) in items
	if(target.stat != DEAD)
		var/datum/heretic_deity/nurgle/N = GOD(GOD_NURGLE)
		N.join_request(target)

/datum/rune_recipe/nurgle/toughen
	name = "Toughen Rite"
	ingredients = list(/mob/living/simple_animal/hostile/retaliate/rat)
	effect_path = /datum/heretic_effect/tough

/datum/rune_recipe/nurgle/nganga
	name = "Nganga Rite"
	ingredients = list(/mob/living/simple_animal/hostile/retaliate/rat, /obj/item/organ/internal/brain)
	product_path = /obj/structure/nganga
