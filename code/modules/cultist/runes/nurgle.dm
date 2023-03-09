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

/datum/rune_recipe/nurgle/toughen
	name = "Toughen Rite"
	ingredients = list(/mob/living/simple_animal/hostile/retaliate/rat)
	effect_path = /datum/heretic_effect/tough

/datum/rune_recipe/nurgle/nganga
	name = "Nganga Rite"
	ingredients = list(/obj/item/reagent_containers/food/snacks/meat/rat_meat)
	product_path = /obj/structure/nganga

/datum/rune_recipe/nurgle/offering
	name = "Offering Rite"
	ingredients = list(/obj/item/newore/gems/emerald)
	delete_items = FALSE
	special 	 = TRUE
