/datum/rune_recipe
	var/name
	var/list/ingredients = list()
	var/product_path = list()									// Item to spawn on completion.
	var/special = FALSE											// Execute proc instead of spawning an item.
	var/delete_items = TRUE
	var/finish_message = "<span style='color:#4d004d;'>The rune briefly glows.</span>"  			// Visible message on completion.
	var/diety													// Deity this rune is dedicated to.
	var/sound													// Sound to be played on completion.
	var/effect_path												// Is an effect added? If so, what type. This is also used as a bool, don't use product_path, it wont work.

// Do an override on this to add extra checks. Call it after you're done. IE: return ..()
/datum/rune_recipe/proc/pre_craft_check(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	var/datum/heretic_deity/deity = GOD(user.mind.special_role)
	if(!(src.type in deity.rune_recipes))
		return FALSE
	return TRUE

/datum/rune_recipe/proc/try_craft_recipe(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	if(!pre_craft_check(user, rune))
		return FALSE
	return check_ingredients(user, rune)

/datum/rune_recipe/proc/check_ingredients(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	var/list/satisfied_requirements = list()
	var/list/satisfied_types = list()
	var/count = 0
	for(var/atom/a in rune.loc)
		for(var/type in ingredients)
			if(istype(a, type) && !(a.type in satisfied_types))
				satisfied_types |= a.type
				satisfied_requirements |= a
				count += 1
	if(count == length(ingredients)) // Ew
		return finish(user, rune, satisfied_requirements)
	return FALSE

/datum/rune_recipe/proc/finish(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune, var/list/items)
	if(length(items))
		if(sound)
			playsound(src, sound, 80, 0, -1)
		if(delete_items && !effect_path)
			for(var/atom/A in items)
				qdel(A)
		if(special)
			do_special(user, rune, items)
		else if(effect_path) // Hacky
			var/datum/component/cultist/comp = user.GetComponent(/datum/component/cultist)
			if(comp.add_effect(src, effect_path))
				for(var/atom/A in items)
					qdel(A)
				if(finish_message)
					rune.visible_message(finish_message)
				post_finish(user, rune)
			return TRUE
		else
			new product_path(get_turf(rune))
			post_finish(user, rune)

		if(finish_message)
			rune.visible_message(finish_message)
		return TRUE
	return FALSE

/datum/rune_recipe/proc/add_effect(var/mob/living/carbon/user, var/list/items, var/obj/effect/cleanable/heretic_rune/rune)
	return FALSE

/datum/rune_recipe/proc/do_special(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune, var/list/items)
	return FALSE

/datum/rune_recipe/proc/post_finish(var/mob/living/carbon/user, var/obj/effect/cleanable/heretic_rune/rune)
	return FALSE

/obj/effect/cleanable/heretic_rune
	name = "rune"
	var/cooldown

/obj/effect/cleanable/heretic_rune/attack_hand(mob/living/carbon/M)
	if(world.time <= cooldown)
		return FALSE
	for(var/datum/rune_recipe/recipe in SSgods.rune_recipes)
		if(recipe.try_craft_recipe(M, src))
			cooldown = (world.time + 2 SECONDS)
			return