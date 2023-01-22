/datum/heretic_deity/khorne
	name = "khorne"
	join_message = "Blood for the Blood God!"
	status_icon_state = "khorne"
	rune_type = /obj/effect/cleanable/heretic_rune/khorne
	faction = "Chaos"
	rune_recipes = list(
						/datum/rune_recipe/khorne/offer_bioprinted,
						/datum/rune_recipe/khorne/offer_skull,
						/datum/rune_recipe/khorne/knife_teeth,
						/datum/rune_recipe/khorne/conversion)
	possible_blessings = list(
							/datum/heretic_effect/healing,
							/datum/heretic_effect/tough_skin,
							/datum/heretic_effect/strength/greater,
							/datum/heretic_effect/strength/lesser,
							/datum/heretic_effect/strength)

	inherent_verbs = list(
			/mob/living/carbon/human/proc/bludforbludguy,
			/mob/living/carbon/human/proc/letriverflow,
			/mob/living/carbon/human/proc/moving,
			/mob/living/carbon/human/proc/overthere,
			/mob/living/carbon/human/proc/praynslay,
			/mob/living/carbon/human/proc/chaaaaaarge,
			/mob/living/carbon/human/proc/chopdem,
			/mob/living/carbon/human/proc/bringdeath,
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
						/datum/rune_recipe/nurgle/toughen,
						/datum/rune_recipe/nurgle/nganga,
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
						/datum/rune_recipe/tzeentch/illusion,
						/datum/rune_recipe/tzeentch/omniscience,
						/datum/rune_recipe/tzeentch/skinless,
						/datum/rune_recipe/tzeentch/transmutation,
						/datum/rune_recipe/tzeentch/goldcoin,
						/datum/rune_recipe/tzeentch/coppercoin,
						/datum/rune_recipe/tzeentch/lens)
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
