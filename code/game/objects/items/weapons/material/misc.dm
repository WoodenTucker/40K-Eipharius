/obj/item/material/harpoon
	name = "harpoon"
	sharp = 1
	edge = 1
	desc = "Tharr she blows!"
	icon_state = "harpoon"
	item_state = "harpoon"
	force_divisor = 0.3 // 18 with hardness 60 (steel)
	attack_verb = list("jabbed","stabbed","ripped")

/obj/item/material/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hatchet"
	force_divisor = 0.2 // 12 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = 1
	edge = 1
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = 0
	hitsound = "chop"

/obj/item/material/hatchet/tacknife
	name = "tactical knife"
	desc = "You'd be killing loads of people if this was Medal of Valor: Heroes of Space."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	attack_verb = list("stabbed", "chopped", "cut")
	applies_material_colour = 1

/obj/item/material/hatchet/machete
	name = "machete"
	desc = "A long, sturdy blade with a rugged handle. Leading the way to cursed treasures since before space travel."
	icon_state = "machete"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT

/obj/item/material/hatchet/machete/Initialize()
	icon_state = "machete[pick("","_red","_blue", "_black", "_olive")]"
	. = ..()

/obj/item/material/hatchet/machete/deluxe
	name = "deluxe machete"
	desc = "A fine example of a machete, with a polished blade, wooden handle and a leather cord loop."
	icon_state = "machetedx"
	item_state = "machete"

/obj/item/material/minihoe // -- Numbers
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	force_divisor = 0.25 // 5 with weight 20 (steel)
	thrown_force_divisor = 0.25 // as above
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")

/obj/item/material/scythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force_divisor = 0.275 // 16 with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 with weight 20 (steel)
	sharp = 1
	edge = 1
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/material/sword/commissword
	name = "commissar's sword"
	desc = "An orante officer's sword and the Commissar's prized possession. Used to cut down heretics and cowards alike"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "commissword"
	item_state = "commissword"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 30
	sharp = 1
	edge = 1
	block_chance = 30
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT

/obj/item/material/sword/slaanesh
	name = "slaanesh sword"
	desc = "A sword made of corruption."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slaanesh_sword"
	item_state = "sabre"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 30
	sharp = 1
	edge = 1
	block_chance = 30
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT

/obj/item/material/sword/hellblade
	name = "hellblade sword"
	desc = "A sword forged with corruption and souls of the raged."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hellblade"
	item_state = "sabre"
	attack_verb = list("stabbed", "chopped", "cut", "sliced", "burned")
	force = 50
	sharp = 1
	edge = 1
	block_chance = 60
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT

/obj/item/material/sword/commissword/sabre
	name = "Sabre"
	desc = "A well crafted sabre. Looks sharp."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "sabre"
	item_state = "sabre"
	force = 18

/obj/item/material/sword/choppa
	name = "choppa"
	desc = "Fixed out of a rusted sheet of metal, this choppa looks too big to be a sword. More like a piece of iron."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "choppa"
	item_state = "choppa"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 35
	sharp = 1
	edge = 1
	hitsound = "slash_sound"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT

/obj/item/material/sword/slanarm
	name = "mutated arm"
	desc = "The arm lurches towards living beings, insatiable in its thirst for pain."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slanarm"
	item_state = "slanarm"
	attack_verb = list("stabbed", "impales", "rends", "tears", "flays", "rips")
	force = 75
	sharpness = 75
	block_chance = 75
	hitsound = 'sound/effects/slanattack.ogg'
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_HUGE
	grab_sound = 'sound/effects/slanarm.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	drop_sound = 'sound/effects/slanarm.ogg'

/obj/item/material/sword/slanarm/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/material/sword/slanarm/attack(mob/living/carbon/C as mob, var/mob/living/carbon/human/user as mob) //
	user.setClickCooldown(20)
	var/hit_zone = ran_zone()
	if(user.lust <=12)
		to_chat(user, "The mutated arm resists you!")
		return
	if(C.stat == DEAD)
		to_chat(user,"<font color='#800080'>There is no pain to be harvested from the dead, a waste...</font>")
	if(user.a_intent == I_HELP)
		visible_message("<font color='#800080'>[user] lustfully slaps [C] with their mutated arm, leaving a red mark but no real damage.</font>")
		playsound(usr, 'sound/weapons/succubus.ogg', 100, 1, 1)
	else
		playsound(usr, 'sound/effects/slanattack.ogg', 100, 1, 1)
		C.apply_damage(rand(55,75), BRUTE, hit_zone, 0,(DAM_SHARP|DAM_EDGE))
		C.Weaken(10)
		user.slanpain += rand(6,16)
		to_chat(C, "<span class='warning'>[user] mangles your body with their mutated arm. It causes you pain on a level you didn't know existed.</span>")
		if(C.gender == MALE)
			playsound(usr, 'sound/voice/Screams_Male_3.ogg', 100, 1, 1)
		else if(C.gender == FEMALE)
			playsound(usr, 'sound/voice/Screams_Woman_1.ogg', 100, 1, 1)
		..()
