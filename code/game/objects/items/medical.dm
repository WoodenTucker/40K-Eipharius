/obj/item/bandage_pack
	name = "Bandage Pack"
	desc = "Holds a bandage. One time use. You can't put the bandage back don't try."
	icon = 'icons/obj/storage.dmi'
	icon_state = "bandage_pack1"
	w_class = ITEM_SIZE_SMALL
	var/used = FALSE

/obj/item/bandage_pack/attack_self(mob/user)
	. = ..()
	if(used)
		to_chat(user, "<span class='warning'>This one is used up already.</span>")
		return

	var/obj/item/stack/medical/bruise_pack/BP = new(get_turf(src))
	playsound(src, 'sound/effects/rip_pack.ogg', 100)
	user.put_in_inactive_hand(BP)
	used = TRUE
	icon_state = "bandage_pack0"//Yes this could go in update icon, but this is the only time this icon is ever going to change.


/obj/item/tourniquet
	name = "Tourniquet"
	desc = "Use this to stop arteries from bleeding. One time use only."
	icon = 'icons/obj/items.dmi'//TODO: MOVE THIS INTO ANOTHER DMI!
	icon_state = "tourniquet"
	w_class = ITEM_SIZE_SMALL

/obj/item/tourniquet/attack(mob/living/carbon/human/H as mob, mob/living/userr, var/target_zone)//All of this is snowflake and copied and pasted from sutures.
	//Checks if they're human, have a limb, and have the skill to fix it.
	if(!ishuman(H))
		return ..()
	if(!ishuman(userr))
		return ..()

	var/mob/living/carbon/human/user = userr
	var/obj/item/organ/external/affected = H.get_organ(target_zone)

	if(!affected)
		return ..()


	if(!(affected.status & ORGAN_ARTERY_CUT))//There is nothing to fix don't fix anything.
		return

	//Ok all the checks are over let's do the quick fix.
	if(!user.doing_something)
		user.doing_something = TRUE
		if(affected.status & ORGAN_ARTERY_CUT)//Fix arteries.
			user.visible_message("<span class='notice'>[user] to apply the tourniquet to their [affected.name].")
			if(do_mob(user, H, (backwards_skill_scale(user.SKILL_LEVEL(medical)) * 5)))
				user.visible_message("<span class='notice'>[user] has patched the [affected.artery_name] in [H]'s [affected.name] with \the [src.name].</span>", \
				"<span class='notice'>You have patched the [affected.artery_name] in [H]'s [affected.name] with \the [src.name].</span>")
				affected.status &= ~ORGAN_ARTERY_CUT
				playsound(src, 'sound/items/tourniquet.ogg', 70, FALSE)
				qdel(src)
			else
				user.doing_something = FALSE

		affected.update_damages()
		user.doing_something = FALSE
	else
		to_chat(user, "You're already trying to suture them.")


/obj/item/grenade_dud
	name = "Dud"
	desc = "This grenade doesn't look like it'll function properly. Might make a decent club?"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "stick0"
	force = 10