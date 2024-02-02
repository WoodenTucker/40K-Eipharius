/datum/heretic_deity/khorne
	name = "khorne"
	join_message = "Blood for the Blood God!"
	status_icon_state = "khorne"
	rune_type = /obj/effect/cleanable/heretic_rune/khorne
	faction = "Chaos"
	rune_recipes = list(
						/datum/rune_recipe/khorne/offer_bioprinted,
						/datum/rune_recipe/khorne/offer_heart,
						/datum/rune_recipe/khorne/offer_gem,
						/datum/rune_recipe/khorne/radio,
						/datum/rune_recipe/khorne/knife_teeth,
						/datum/rune_recipe/khorne/conversion)
	possible_blessings = list(
							/datum/heretic_effect/tough_skin,
							/datum/heretic_effect/healing,
							/datum/heretic_effect/strength/greater,
							/datum/heretic_effect/strength/lesser,
							/datum/heretic_effect/strength)

	inherent_verbs = list(
		//	/mob/living/carbon/human/proc/bludforbludguy,
	//		/mob/living/carbon/human/proc/letriverflow,
			/mob/living/carbon/human/proc/moving,
			/mob/living/carbon/human/proc/overthere,
	//		/mob/living/carbon/human/proc/praynslay,
			/mob/living/carbon/human/proc/chaaaaaarge,
	//		/mob/living/carbon/human/proc/chopdem,
	//		/mob/living/carbon/human/proc/bringdeath,
			/mob/living/carbon/human/proc/advance,
			/mob/living/carbon/human/proc/aaaaaa,
			/mob/living/carbon/human/proc/getmanualkhorne,
			/mob/living/carbon/human/proc/draw_rune)

/datum/heretic_deity/khorne/post_add(mob/living/carbon/human/NewMember)
	GLOB.khorne_cult++

/datum/heretic_deity/nurgle
	name = "nurgle"
	status_icon_state = "nurgle"
	rune_type = /obj/effect/cleanable/heretic_rune/nurgle
	faction = "Chaos"
	possible_blessings = list(
						/datum/heretic_effect/heal,
						/datum/heretic_effect/painless,
						/datum/heretic_effect/slow,
						/datum/heretic_effect/zombie)
	rune_recipes = list(/datum/rune_recipe/nurgle/deathtolerance,
						/datum/rune_recipe/nurgle/conversion,
						/datum/rune_recipe/nurgle/offer_gem,
						/datum/rune_recipe/nurgle/offer_brain,
						/datum/rune_recipe/nurgle/toughen,
						/datum/rune_recipe/nurgle/nganga,
						/datum/rune_recipe/nurgle/radio,
						/datum/rune_recipe/nurgle/uniform,
						/datum/rune_recipe/nurgle/plate,
						/datum/rune_recipe/nurgle/mask,
						/datum/rune_recipe/nurgle/nade,
						/datum/rune_recipe/nurgle/blight,
						/datum/rune_recipe/nurgle/nurgling,
						/datum/rune_recipe/nurgle/offering)
	inherent_verbs = list(
			/mob/living/carbon/human/proc/lordofflies,
			/mob/living/carbon/human/proc/draw_rune,
			/mob/living/carbon/human/proc/getmanualnurgle)

/datum/heretic_deity/nurgle/post_add(mob/living/carbon/human/NewMember)
	GLOB.nurgle_cult++

/datum/heretic_deity/slaanesh
	name = "slaanesh"
	status_icon_state = "slaanesh"
	rune_type = /obj/effect/cleanable/heretic_rune/slaanesh
	faction = "Chaos"
	rune_recipes = list(/datum/rune_recipe/slaanesh/conversion,
						/datum/rune_recipe/slaanesh/arm,
						/datum/rune_recipe/slaanesh/radio,
						/datum/rune_recipe/slaanesh/escape,
						/datum/rune_recipe/slaanesh/dagger,
						/datum/rune_recipe/slaanesh/knife)
	inherent_verbs = list(
			/mob/living/carbon/human/proc/draw_rune,
			/mob/living/carbon/human/proc/getmanualslaanesh)

/datum/heretic_deity/slaanesh/post_add(mob/living/carbon/human/NewMember)
	GLOB.slaanesh_cult++

/datum/heretic_deity/tzeentch
	name = "tzeentch"
	status_icon_state = "tzeentch"
	rune_type = /obj/effect/cleanable/heretic_rune/tzeentch
	faction = "Chaos"
	rune_recipes = list(/datum/rune_recipe/tzeentch/conversion,
						/datum/rune_recipe/tzeentch/fool,
						/datum/rune_recipe/tzeentch/cloth1,
						/datum/rune_recipe/tzeentch/cloth2,
						/datum/rune_recipe/tzeentch/cloth3,
						/datum/rune_recipe/tzeentch/cloth4,
						/datum/rune_recipe/tzeentch/cloth,
						/datum/rune_recipe/tzeentch/radio,
						/datum/rune_recipe/tzeentch/illusion,
						/datum/rune_recipe/tzeentch/omniscience,
						/datum/rune_recipe/tzeentch/skinless,
						/datum/rune_recipe/tzeentch/transmutation,
						/datum/rune_recipe/tzeentch/goldcoin,
						/datum/rune_recipe/tzeentch/coppercoin,
						/datum/rune_recipe/tzeentch/lens,
						/datum/rune_recipe/tzeentch/tzbook)
	inherent_verbs = list(
			/mob/living/carbon/human/proc/tzeewehere,
			/mob/living/carbon/human/proc/tzeeforthechanger,
			/mob/living/carbon/human/proc/tzeebeconsumed,
			/mob/living/carbon/human/proc/tzeeweshallsacrifise,
			/mob/living/carbon/human/proc/tzeetheyseetruth,
			/mob/living/carbon/human/proc/tzeepeerminds,
			/mob/living/carbon/human/proc/tzeecharge,
			/mob/living/carbon/human/proc/tzeechangecome,
			/mob/living/carbon/human/proc/tzeebehold,
			/mob/living/carbon/human/proc/tzeebelongtous,
			/mob/living/carbon/human/proc/draw_rune,
			/mob/living/carbon/human/proc/getmanualtzeentch)

/datum/heretic_deity/tzeentch/post_add(mob/living/carbon/human/NewMember)
	GLOB.tzeentch_cult++

/datum/heretic_deity/hivemind
	name = "hivemind"
	join_message = "Glory to the Four-Armed Emperor!"
	status_icon_state = "genestealer"
	rune_type = /obj/effect/cleanable/heretic_rune/hivemind
	faction = "Tyranids"
	inherent_verbs = list(/mob/living/carbon/human/proc/givegenestuff)
	rune_recipes = list(
						/datum/rune_recipe/hivemind/biomass,
						/datum/rune_recipe/hivemind/biomass/organ,
						/datum/rune_recipe/hivemind/biomass/limb)

/datum/heretic_deity/hivemind/post_add(mob/living/carbon/human/NewMember)
	GLOB.hivemind_cult++

/mob/living/carbon/human/proc/givegenestuff()
	set name = "Recall your cultist nature."
	set category = "Genestealer Cultist"
	set desc = "Genestaler Cultist Setup."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/geneclass = input("Select a Class","Class Selection") as null|anything in list("Genestealer Cultist")
	switch(geneclass)
		if("Genestealer Cultist")
			src.set_trait(new/datum/trait/death_tolerant()) //Not bothered by any death in the name of the Four-Armed Emperor
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_TYRANID) //Gives them access to the hivemind
			src.bladder = -INFINITY
			src.bowels = -INFINITY //Tyranid bioengineering's finest.
			src.thirst = INFINITY
			src.nutrition = INFINITY
			src.verbs -= /mob/living/carbon/human/proc/givegenestuff //removes verb at the end so they can't spam it for whatever reason
			client?.color = null
			to_chat(src, "<span class='notice'>Check your languages for the Hivemind! The default option is .g and you can switch it in your IC tab.</span>")
