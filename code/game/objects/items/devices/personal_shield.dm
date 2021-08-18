/obj/item/device/personal_shield
	name = "personal shield"
	desc = "Truely a life-saver: this device protects its user from being hit by objects moving very, very fast, though only for a few shots."
	icon = 'icons/obj/device.dmi'
	icon_state = "batterer"
	var/uses = 5
	var/obj/aura/personal_shield/device/shield

/obj/item/device/personal_shield/attack_self(var/mob/living/user)
	if(uses)
		shield = new(user,src)
	else
		QDEL_NULL(shield)

/obj/item/device/personal_shield/Move()
	QDEL_NULL(shield)
	return ..()

/obj/item/device/personal_shield/forceMove()
	QDEL_NULL(shield)
	return ..()

/obj/item/device/personal_shield/proc/take_charge()
	if(!--uses)
		QDEL_NULL(shield)
		to_chat(loc,"<span class='danger'>\The [src] begins to spark as it breaks!</span>")
		update_icon()
		return

/obj/item/device/personal_shield/update_icon()
	if(uses)
		icon_state = "batterer"
	else
		icon_state = "battererburnt"

/obj/item/device/personal_shield/Destroy()
	QDEL_NULL(shield)
	return ..()

/obj/item/rosarius // time for some mapper code. i have made 4 iterations of this, it has taken me all day today and at this point i have entered fuck it mode. this is the shield. can be made better later. we're in alpha. die. -plinypotter | 1 hour later and i can't make it work for fuck all, so it's just an item now, attribute it to its old age
	name = "ecclesiarchal rosarius"
	desc = "A handheld amulet which incorporates a powerful force field generator. A rare and highly prized piece of technology and an icon of the Imperial Creed, being near such an ancient and powerful thing brings great joy to those who are faithful. This one looks particularly old and non-functional."
	icon = 'icons/obj/device.dmi'
	icon_state = "rosarius"
	w_class = ITEM_SIZE_SMALL