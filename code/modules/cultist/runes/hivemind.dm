/*/datum/rune_recipe/hivemind/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special 	 = TRUE

/datum/rune_recipe/hivemind/conversion/do_special(mob/living/carbon/user, obj/effect/cleanable/heretic_rune/rune, list/items)
	var/mob/living/carbon/human/target = items[1]
	if(target.stat != DEAD && target.mind)
		var/datum/heretic_deity/hivemind/N = GOD(GOD_HIVEMIND)
		N.join_request(target)*/

/datum/rune_recipe/hivemind/biomass
	name = "Biomass conversion"
	ingredients = list(/obj/item/reagent_containers/food/snacks/meat/rat_meat)
	product_path = /obj/item/stack/material/biomass

/datum/rune_recipe/hivemind/biomass/organ
	name = "Biomass conversion"
	ingredients = list(/obj/item/organ/internal)
	product_path = /obj/item/stack/material/biomass/five

/datum/rune_recipe/hivemind/biomass/limb
	name = "Biomass conversion"
	ingredients = list(/obj/item/organ/external)
	product_path = /obj/item/stack/material/biomass/ten
