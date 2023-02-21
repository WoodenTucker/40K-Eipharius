
	var/arbitetype = input("Select a Class","Class Selection") as null|anything in list("Close Quarters Specialist", "Trooper")
	switch(arbitetype)
		if("Close Quarters Specialist")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/enforcer, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/under/color/brown, slot_uniform)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/melee/powermaul, slot_wear_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/pump/voxlegis, slot_s_store)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)
			equip_to_slot_or_del(new /obj/item/ammo_box/shotgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_box/shotgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/handcuffs, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/handcuffs, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/box/stunshells, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flash, slot_r_store)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			visible_message("[name] stretches their limbs out.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(18,21),rand(14,16),rand(18,19),14) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(8,10),rand(5,7),rand(2,6),rand(3,6)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC) //secondary language
			src.verbs -= /mob/living/carbon/human/arbite/proc/givearbitetype //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/W = new
			W.icon_state = "tagred"
			W.assignment = "Arbite Close Quarters Combat Specialist"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
