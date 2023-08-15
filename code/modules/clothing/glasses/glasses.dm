/obj/item/clothing/glasses
	name = "glasses"
	icon = 'icons/obj/clothing/glasses.dmi'
	//w_class = ITEM_SIZE_SMALL
	//slot_flags = SLOT_EYES
	//var/vision_flags = 0
	//var/darkness_view = 0//Base human is 2
	var/prescription = 0
	var/toggleable = 0
	var/off_state = "degoggles"
	var/active = 1
	var/activation_sound = 'sound/items/goggles_charge.ogg'
	var/obj/screen/overlay = null
	var/obj/item/clothing/glasses/hud/hud = null	// Hud glasses, if any
	var/electric = 0 //if the glasses should be disrupted by EMP

/obj/item/clothing/glasses/New()
	..()
	if(ispath(hud))
		hud = new hud(src)

/obj/item/clothing/glasses/Destroy()
	qdel(hud)
	hud = null
	. = ..()

/obj/item/clothing/glasses/needs_vision_update()
	return ..() || overlay || vision_flags || see_invisible || darkness_view

/obj/item/clothing/glasses/emp_act(severity)
	if(electric)
		if(istype(src.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/M = src.loc
			to_chat(M, "<span class='danger'>Your [name] malfunction[gender != PLURAL ? "s":""], blinding you!</span>")
			if(M.glasses == src)
				M.eye_blind = 2
				M.eye_blurry = 4
				// Don't cure being nearsighted
				if(!(M.disabilities & NEARSIGHTED))
					M.disabilities |= NEARSIGHTED
					spawn(100)
						M.disabilities &= ~NEARSIGHTED
		if(toggleable)
			if(active)
				active = 0

/obj/item/clothing/glasses/attack_self(mob/user)
	if(toggleable && !user.incapacitated())
		if(active)
			active = 0
			icon_state = off_state
			user.update_inv_glasses()
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			to_chat(usr, "You deactivate the optical matrix on the [src].")
		else
			active = 1
			icon_state = initial(icon_state)
			user.update_inv_glasses()
			if(activation_sound)
				sound_to(usr, activation_sound)

			flash_protection = initial(flash_protection)
			tint = initial(tint)
			to_chat(usr, "You activate the optical matrix on the [src].")
		user.update_action_buttons()

/obj/item/clothing/glasses/meson
	name = "optical meson scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	gender = NEUTER
	icon_state = "meson"
	item_state = "glasses"
	action_button_name = "Toggle Goggles"
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	toggleable = 1
	vision_flags = SEE_TURFS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	electric = 1
	sales_price = 0

/obj/item/clothing/glasses/science/magos
	name = "magos goggles"
	desc = "The goggles do nothing!"
	hud = /obj/item/clothing/glasses/hud/health
	icon_state = "thermoncle"
	item_state = "thermoncle"
	action_button_name = "Toggle Goggles"
	darkness_view = 20
	toggleable = 1
	electric = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	vision_flags = SEE_MOBS|SEE_TURFS
	flash_protection = FLASH_PROTECTION_MAJOR
	canremove = 0
	unacidable = 1
	sales_price = 35

/obj/item/clothing/glasses/science/tech
	name = "priest goggles"
	desc = "The goggles do nothing!"
	hud = /obj/item/clothing/glasses/hud/health
	action_button_name = "Toggle Goggles"
	darkness_view = 20
	toggleable = 1
	electric = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	vision_flags = SEE_TURFS
	canremove = 0
	unacidable = 1
	flash_protection = FLASH_PROTECTION_MAJOR
	sales_price = 20

/obj/item/clothing/glasses/meson/New()
	..()
	overlay = GLOB.global_hud.meson

/obj/item/clothing/glasses/meson/prescription
	name = "prescription mesons"
	desc = "Optical Meson Scanner with prescription lenses."
	prescription = 6

/obj/item/clothing/glasses/science
	name = "science goggles"
	desc = "The goggles do nothing!"
	icon_state = "purple"
	item_state = "glasses"
	action_button_name = "Toggle Goggles"
	toggleable = 1
	electric = 1
	sales_price = 0

/obj/item/clothing/glasses/science/New()
	..()
	overlay = GLOB.global_hud.science

/obj/item/clothing/glasses/night
	name = "Mark IX Photovisor"
	desc = "You can totally see in the dark now!"
	gender = NEUTER
	icon_state = "night"
	item_state = "glasses"
	origin_tech = list(TECH_MAGNET = 2)
	darkness_view = 40
	action_button_name = "Toggle Goggles"
	toggleable = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	off_state = "denight"
	electric = 1
	sales_price = 25

/obj/item/clothing/glasses/night/New()
	..()
	overlay = GLOB.global_hud.nvg

/obj/item/clothing/glasses/blacksun
	name = "blacksun goggles"
	desc = "The Blacksun Filter is an advanced Tau optical filter that allows the user not only to see at much greater distances when fighting in nighttime conditions but also filters bright flares of light that could blind them."
	icon_state = "blacksun"
	item_state = "blacksun"
	origin_tech = list(TECH_MAGNET = 2)
	darkness_view = 50
	action_button_name = "Toggle Goggles"
	toggleable = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	off_state = "blacksun"
	electric = 1
	sales_price = 20
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/glasses/blacksun/skitarii
	name = "skitarii augments"
	desc = "A series of augments used to replace the eyes of Skitarii with superior, mechanical optics."
	canremove = 0
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/glasses/tacgoggles
	name = "Prototype Photovisor"
	desc = "Self-polarizing goggles with light amplification for dark environments. Manufactured by the Mechanicus."
	icon_state = "night"
	item_state = "glasses"
	origin_tech = list(TECH_MAGNET = 2, TECH_COMBAT = 4)
	darkness_view = 40
	action_button_name = "Toggle Goggles"
	toggleable = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	off_state = "denight"
	electric = 1
	
/obj/item/clothing/glasses/tacgoggles/New()
	..()
	overlay = GLOB.global_hud.meson

/obj/item/clothing/glasses/eyepatch
	name = "eyepatch"
	desc = "Yarr."
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = 0
	var/flipped = 0 // Indicates left or right eye; 0 = on the right

/obj/item/clothing/glasses/eyepatch/proc/flip_patch()
	set name = "Flip Patch"
	set category = "Object"

	if (usr.stat || usr.restrained())
		return

	src.flipped = !src.flipped
	if(src.flipped)
		icon_state = "[icon_state]_r"
	else
		src.icon_state = initial(icon_state)
	to_chat (usr, "You change \the [src] to cover the [src.flipped ? "left" : "right"] eye.")
	update_clothing_icon()

/obj/item/clothing/glasses/eyepatch/RightClick(mob/user)
	if(CanPhysicallyInteract(user))
		if(src == user.get_active_hand())
			flip_patch()

/obj/item/clothing/glasses/monocle
	name = "monocle"
	desc = "Such a dapper eyepiece!"
	icon_state = "monocle"
	item_state = "headset" // lol
	body_parts_covered = 0

/obj/item/clothing/glasses/material
	name = "optical material scanner"
	desc = "Very confusing glasses."
	gender = NEUTER
	icon_state = "material"
	item_state = "glasses"
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	action_button_name = "Toggle Goggles"
	toggleable = 1
	vision_flags = SEE_OBJS
	electric = 1
	sales_price = 0

/obj/item/clothing/glasses/regular
	name = "prescription glasses"
	desc = "Made by Nerd. Co."
	icon_state = "glasses"
	item_state = "glasses"
	prescription = 7
	body_parts_covered = 0

/obj/item/clothing/glasses/regular/scanners
	name = "scanning goggles"
	desc = "A very oddly shaped pair of goggles with bits of wire poking out the sides. A soft humming sound emanates from it."
	icon_state = "uzenwa_sissra_1"
	light_protection = 7
	electric = 1

/obj/item/clothing/glasses/regular/hipster
	name = "prescription glasses"
	desc = "Made by Uncool. Co."
	icon_state = "hipster_glasses"
	item_state = "hipster_glasses"

/obj/item/clothing/glasses/threedglasses
	name = "3D glasses"
	desc = "A long time ago, people used these glasses to makes images from screens threedimensional."
	icon_state = "3d"
	item_state = "3d"
	body_parts_covered = 0

/obj/item/clothing/glasses/gglasses
	name = "green glasses"
	desc = "Forest green glasses, like the kind you'd wear when hatching a nasty scheme."
	icon_state = "gglasses"
	item_state = "gglasses"
	body_parts_covered = 0

/obj/item/clothing/glasses/sunglasses
	name = "trench aviators"
	desc = "The sun seems to have gone out but that's not gonna stop you from looking cool."
	icon_state = "sun"
	item_state = "sunglasses"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/welding
	name = "welding goggles"
	desc = "Protects the eyes from welders, approved by the mad scientist association."
	icon_state = "welding-g"
	item_state = "welding-g"
	action_button_name = "Flip Welding Goggles"
	matter = list(DEFAULT_WALL_MATERIAL = 1500, "glass" = 1000)
	use_alt_layer = TRUE
	var/up = 0
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = TINT_HEAVY

/obj/item/clothing/glasses/welding/attack_self()
	toggle()


/obj/item/clothing/glasses/welding/proc/toggle()
	set category = "Object"
	set name = "Adjust welding goggles"

	if(usr.canmove && !usr.incapacitated())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			flash_protection = initial(flash_protection)
			tint = initial(tint)
			to_chat(usr, "You flip \the [src] down to protect your eyes.")
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]up"
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			to_chat(usr, "You push \the [src] up out of your face.")
		update_clothing_icon()
		update_vision()
		usr.update_action_buttons()

/obj/item/clothing/glasses/welding/RightClick(mob/user)
	if(CanPhysicallyInteract(user))
		if(src == user.get_active_hand())
			toggle()

/obj/item/clothing/glasses/welding/superior
	name = "superior welding goggles"
	desc = "Welding goggles made from more expensive materials, strangely smells like potatoes."
	icon_state = "rwelding-g"
	item_state = "rwelding-g"
	tint = TINT_MODERATE

/obj/item/clothing/glasses/sunglasses/blindfold
	name = "blindfold"
	desc = "Covers the eyes, preventing sight."
	icon_state = "blindfold"
	item_state = "blindfold"
	tint = TINT_BLIND
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/glasses/sunglasses/blindfold/tape
	name = "length of tape"
	desc = "It's a robust DIY blindfold!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/glasses/sunglasses/prescription
	name = "prescription sunglasses"
	prescription = 5

/obj/item/clothing/glasses/sunglasses/big
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Larger than average enhanced shielding blocks many flashes."
	icon_state = "bigsunglasses"
	item_state = "bigsunglasses"

/obj/item/clothing/glasses/sunglasses/sechud
	name = "HUD sunglasses"
	desc = "Sunglasses with a HUD."
	icon_state = "sunhud"
	hud = /obj/item/clothing/glasses/hud/security
	electric = 1

/obj/item/clothing/glasses/sunglasses/sechud/goggles //now just a more "military" set of HUDglasses for the Torch
	name = "HUD goggles"
	desc = "Flash-resistant goggles with an inbuilt heads-up display."
	icon_state = "goggles"

/obj/item/clothing/glasses/sunglasses/sechud/toggle
	name = "HUD aviators"
	desc = "Modified aviator glasses that can be switched between HUD and flash protection modes."
	icon_state = "sec_hud"
	off_state = "sec_flash"
	action_button_name = "Toggle Mode"
	var/on = 1
	toggleable = 1
	activation_sound = 'sound/effects/pop.ogg'

	var/hud_holder

/obj/item/clothing/glasses/sunglasses/sechud/toggle/New()
	..()
	hud_holder = hud

/obj/item/clothing/glasses/sunglasses/sechud/toggle/Destroy()
	qdel(hud_holder)
	hud_holder = null
	hud = null
	. = ..()

/obj/item/clothing/glasses/sunglasses/sechud/toggle/attack_self(mob/user)
	if(toggleable && !user.incapacitated())
		on = !on
		if(on)
			flash_protection = FLASH_PROTECTION_NONE
			src.hud = hud_holder
			to_chat(user, "You switch \the [src] to HUD mode.")
		else
			flash_protection = initial(flash_protection)
			src.hud = null
			to_chat(user, "You switch \the [src] to flash protection mode.")
		update_icon()
		sound_to(user, activation_sound)
		user.update_inv_glasses()
		user.update_action_buttons()

/obj/item/clothing/glasses/sunglasses/sechud/toggle/update_icon()
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = off_state

/obj/item/clothing/glasses/thermal
	name = "optical thermal scanner"
	desc = "Thermals in the shape of glasses."
	gender = NEUTER
	icon_state = "thermal"
	item_state = "glasses"
	action_button_name = "Toggle Goggles"
	origin_tech = list(TECH_MAGNET = 2)
	toggleable = 1
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	electric = 1
	sales_price = 40

/obj/item/clothing/glasses/thermal/New()
	..()
	overlay = GLOB.global_hud.thermal

/obj/item/clothing/glasses/thermal/syndi	//These are now a heretic item, concealed as mesons.	-Pete
	name = "optical meson scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)

/obj/item/clothing/glasses/thermal/plain
	toggleable = 0
	activation_sound = null
	action_button_name = null

/obj/item/clothing/glasses/thermal/plain/monocle
	name = "thermoncle"
	desc = "A monocle thermal."
	icon_state = "thermoncle"
	body_parts_covered = 0 //doesn't protect eyes because it's a monocle, duh

/obj/item/clothing/glasses/thermal/plain/eyepatch
	name = "optical thermal eyepatch"
	desc = "An eyepatch with built-in thermal optics."
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = 0

/obj/item/clothing/glasses/thermal/plain/jensen
	name = "optical thermal implants"
	gender = PLURAL
	desc = "A set of implantable lenses designed to augment your vision."
	icon_state = "thermalimplants"
	item_state = "syringe_kit"

/obj/item/clothing/glasses/eyepatch/hud
	name = "iPatch"
	desc = "For the technologically inclined pirate. It connects directly to the optical nerve of the user, replacing the need for that useless eyeball."
	gender = NEUTER
	icon_state = "hudpatch"
	item_state = "hudpatch"
	off_state = "hudpatch"
	action_button_name = "Toggle iPatch"
	toggleable = 1
	var/eye_color = COLOR_WHITE
	electric = 1

/obj/item/clothing/glasses/eyepatch/hud/Initialize()
	.  = ..()
	update_icon()

/obj/item/clothing/glasses/eyepatch/hud/attack_self()
	..()
	update_icon()

/obj/item/clothing/glasses/eyepatch/hud/update_icon()
	overlays.Cut()
	if(active)
		var/image/eye = overlay_image(icon, "[icon_state]_eye", flags=RESET_COLOR)
		eye.color = eye_color
		overlays += eye

/obj/item/clothing/glasses/eyepatch/hud/get_mob_overlay(mob/user_mob, slot)
	var/image/res = ..()
	if(active)
		var/image/eye = overlay_image(res.icon, "[icon_state]_eye", flags=RESET_COLOR)
		eye.color = eye_color
		eye.layer = ABOVE_LIGHTING_LAYER
		eye.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		res.overlays += eye
	return res

/obj/item/clothing/glasses/eyepatch/hud/security
	name = "HUDpatch"
	desc = "A Security-type heads-up display that connects directly to the optical nerve of the user, replacing the need for that useless eyeball."
	hud = /obj/item/clothing/glasses/hud/security
	eye_color = COLOR_RED

/obj/item/clothing/glasses/eyepatch/hud/medical
	name = "MEDpatch"
	desc = "A Medical-type heads-up display that connects directly to the ocular nerve of the user, replacing the need for that useless eyeball."
	hud = /obj/item/clothing/glasses/hud/health
	eye_color = COLOR_CYAN

/obj/item/clothing/glasses/eyepatch/hud/meson
	name = "MESpatch"
	desc = "An optical meson scanner display that connects directly to the ocular nerve of the user, replacing the need for that useless eyeball."
	vision_flags = SEE_TURFS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	eye_color = COLOR_LIME

/obj/item/clothing/glasses/eyepatch/hud/meson/New()
	..()
	overlay = GLOB.global_hud.meson


/*---Tajaran-specific Eyewear---*/

/obj/item/clothing/glasses/tajblind
	name = "embroidered veil"
	desc = "An Ahdominian made veil that allows the user to see while obscuring their eyes."
	icon_state = "tajblind"
	item_state = "tajblind"
	prescription = 5
	body_parts_covered = EYES

/obj/item/clothing/glasses/hud/health/tajblind
	name = "lightweight veil"
	desc = "An Ahdominian made veil that allows the user to see while obscuring their eyes. This one has an installed medical HUD."
	icon_state = "tajblind_med"
	item_state = "tajblind_med"
	body_parts_covered = EYES

/obj/item/clothing/glasses/sunglasses/sechud/tajblind
	name = "sleek veil"
	desc = "An Ahdominian made veil that allows the user to see while obscuring their eyes. This one has an in-built security HUD."
	icon_state = "tajblind_sec"
	item_state = "tajblind_sec"
	prescription = 5
	body_parts_covered = EYES

/obj/item/clothing/glasses/meson/prescription/tajblind
	name = "industrial veil"
	desc = "An Ahdominian made veil that allows the user to see while obscuring their eyes. This one has installed mesons."
	icon_state = "tajblind_meson"
	item_state = "tajblind_meson"
	off_state = "tajblind_meson"
	body_parts_covered = EYES

//ASTRA MILITARUM STUFF

/obj/item/clothing/glasses/cadiangoggles
	name = "Mark XIc Visor"
	desc = "The Mark XIc Visor are issued along with the Mark XIc Rebreather as part of the Frigid Survival Kit, It is designed to prevent flare and blindness."
	icon_state = "iggoggles"
	item_state = "iggoggles"
	body_parts_covered = EYES
	sales_price = 4
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/cadiangoggles/elite
	name = "Mark XIc/NV Visor"
	desc = "The Mark XIc Visor are issued along with the Mark XIc Rebreather as part of the Frigid Survival Kit, It is designed to prevent flare and blindness. This version has built in tactical HUD and Nightvision support, It is issued to Cadian Veterans and Kasrkin Stormtroopers."
	darkness_view = 40 //if you want to be a sniper without being a astartes/sharpshooter, you may now
	icon_state = "iggoggles"
	item_state = "iggoggles"
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	sales_price = 25
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/cadiangoggles/elite/New()
	..()
	overlay = GLOB.global_hud.nvg

// XENOS VISION

/obj/item/clothing/glasses/tyranid
	name = "eyeballs"
	desc = "Gross!"
	darkness_view = 20
	body_parts_covered = EYES
	icon_state = "gsfeet"
	item_state = "gsfeet"
	canremove = 0
	unacidable = 1
	species_restricted = list(SPECIES_TYRANID)
	see_invisible = SEE_INVISIBLE_NOLIGHTING
//	flash_protection = FLASH_PROTECTION_MODERATE //add this if you want this to be unable to be flashed

// SPESS MUHREEN STUFF

/obj/item/clothing/glasses/astartes/visor
	name = "Mark VII Visor"
	desc = "The support system of Astartes helmet."
	darkness_view = 50 //in case we got a snaiper
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flash_protection = FLASH_PROTECTION_MAJOR
	icon_state = "thermal"
	item_state = "glasses"
	body_parts_covered = EYES
	siemens_coefficient = 0.9
	unacidable = 1
	species_restricted = list(SPECIES_ASTARTES)
	sales_price = 30
	flash_protection =  FLASH_PROTECTION_MAJOR

/obj/item/clothing/glasses/astartes/visor/apoth
	name = "Mark VII Apothecary Visor"
	desc = "The support system of Astartes helmet. This one has intergrated medical scanner."
	hud = /obj/item/clothing/glasses/hud/health
	darkness_view = 50
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flash_protection = FLASH_PROTECTION_MAJOR
	icon_state = "thermal"
	item_state = "glasses"
	body_parts_covered = EYES
	siemens_coefficient = 0.9
	unacidable = 1
	species_restricted = list(SPECIES_ASTARTES)
	sales_price = 40

/obj/item/clothing/glasses/cadian
	name = "Mark XIIc Visor"
	desc = "The Mark XIIc sniper variant night vision visor are special night vision goggles which make a much larger area visible to the user without adding any negative effects to their vision."
	icon_state = "thermal"
	darkness_view = 50
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	item_state = "glasses"
	body_parts_covered = EYES
	unacidable = 1
	sales_price = 30
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/cadian/New()
	..()
	overlay = GLOB.global_hud.nvg

/obj/item/clothing/glasses/vindicare
	name = "Vindicare Visor"
	desc = "The peak of vision augmentation techology, these goggles are permanently bonded to the user's eyes."
	icon_state = "thermal"
	canremove = 0
	darkness_view = 100
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	item_state = "thermal"
	body_parts_covered = EYES
	siemens_coefficient = 0
	flash_protection = FLASH_PROTECTION_MAJOR
	unacidable = 1
	sales_price = 20
	var/view_range = 10 //They can see further normally
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS

/obj/item/clothing/glasses/vindicare/process_hud(var/mob/M)
	process_med_hud(M, 1)
