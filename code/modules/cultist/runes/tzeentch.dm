/datum/rune_recipe/tzeentch/conversion
	name = "Conversion Rite"
	ingredients = list(/mob/living/carbon/human)
	delete_items = FALSE
	special 	 = TRUE

/datum/rune_recipe/tzeentch/conversion/do_special(mob/living/carbon/user, obj/effect/cleanable/heretic_rune/rune, list/items)
	var/mob/living/carbon/human/target = items[1]
	if(target.stat != DEAD && target.mind)
		var/datum/heretic_deity/tzeentch/N = GOD(GOD_TZEENTCH)
		N.join_request(target)

/datum/rune_recipe/tzeentch/fool
	name = "Illusion Rite"
	ingredients = list(/obj/item/organ/internal/eyes/bioprinted, /obj/item/clothing)
	special = TRUE


//Stolen from chamelon projectors
/datum/rune_recipe/tzeentch/illusion
	name = "Illusion Rite"
	ingredients = list(/obj/item/organ/internal/eyes, /obj/item/clothing)
	special = TRUE

/datum/rune_recipe/tzeentch/illusion/do_special(var/mob/living/carbon/human/user, var/list/items)
	var/atom/target = input(user, "What should I look like?", "Choose") in range(7, user)
	var/orig_icon = user.icon
	var/orig_icon_state = user.icon_state
	var/orig_overlays = user.overlays
	var/obj/effect/dummy/illusion/C = new(get_turf(usr))
	C.activate(user, target.icon, target.icon_state, target.overlays)
	addtimer(CALLBACK(src, .proc/remove_illusion, user, orig_icon, orig_icon_state, orig_overlays, C), 1 MINUTES)

/datum/rune_recipe/tzeentch/illusion/proc/remove_illusion(var/atom/inp, var/original_icon, var/original_icon_state, var/orig_overlays, var/obj/effect/dummy/illusion/C)
	inp.icon = original_icon
	inp.icon_state = original_icon_state
	inp.overlays = orig_overlays
	for(var/atom/movable/A in C)
		A.forceMove(get_turf(C))
		if(ismob(A))
			var/mob/M = A
			M.reset_view(null)
	qdel(C)

/datum/rune_recipe/tzeentch/omniscience
	name = "Omniscience Rite"
	ingredients = list(/obj/item/organ/internal/eyes)
	special = TRUE

/datum/rune_recipe/tzeentch/omniscience/do_special(var/mob/living/carbon/human/user, var/list/items)
	var/mob/observer/eye/viewer = new(user)
	viewer.possess(user)
	addtimer(CALLBACK(src, .proc/return_user, user, viewer), 30 SECONDS)

/datum/rune_recipe/tzeentch/omniscience/proc/return_user(var/mob/living/carbon/human/user, var/mob/observer/eye/e)
	user.eyeobj = null
	user.client.eye = user.client.mob
	qdel(e)


/datum/rune_recipe/tzeentch/skinless
	name = "Skinless Rite"
	ingredients = list(/obj/item/reagent_containers/food/snacks/poo, /obj/item/flame/candle)
	product_path = /mob/living/carbon/human/skinless

/datum/rune_recipe/tzeentch/transmutation
	name = "Transmutation Rite"
	ingredients = list(/obj/item/newore/uraniumore)
	special = TRUE

/datum/rune_recipe/tzeentch/transmutation/do_special(var/mob/living/carbon/human/user, var/list/items)
	if(prob(10))
		new /obj/item/newore/goldore(get_turf(user))
	else
		new /obj/item/newore/copperore(get_turf(user))

/datum/rune_recipe/tzeentch/goldcoin
	name = "Gold to Coin"
	ingredients = list(/obj/item/newore/goldore)
	product_path = /obj/item/stack/thrones

/datum/rune_recipe/tzeentch/coppercoin
	name = "Copper to Coin"
	ingredients = list(/obj/item/stack/thrones)
	product_path = list(/obj/item/stack/thrones, /obj/item/stack/thrones)

/datum/rune_recipe/tzeentch/lens
	name = "Lensmaker's Rite"
	ingredients = list(/obj/item/cell/lasgun)
	product_path =  (/obj/item/gun/energy/WarpLens)

