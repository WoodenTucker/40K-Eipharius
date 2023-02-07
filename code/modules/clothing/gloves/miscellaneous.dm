/obj/item/clothing/gloves/captain
	desc = "Regal blue gloves, with a nice gold trim. Swanky."
	name = "captain's gloves"
	icon_state = "captain"
	item_state = "egloves"

/obj/item/clothing/gloves/cyborg
	desc = "Beep boop borp!"
	name = "cyborg gloves"
	icon_state = "black"
	item_state = "r_hands"
	siemens_coefficient = 1.0

/obj/item/clothing/gloves/insulated
	desc = "These gloves will protect the wearer from electric shocks."
	name = "insulated gloves"
	color = COLOR_YELLOW
	icon_state = "white"
	item_state = "lgloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05

/obj/item/clothing/gloves/insulated/cheap                             //Cheap Chinese Crap
	desc = "These gloves are cheap copies of the coveted gloves, no way this can end badly."
	name = "budget insulated gloves"
	siemens_coefficient = 1			//Set to a default of 1, gets overridden in New()

/obj/item/clothing/gloves/insulated/cheap/New()
	..()
	//average of 0.4, better than regular gloves' 0.75
	siemens_coefficient = pick(0, 0.1, 0.2, 0.3, 0.4, 0.6, 1.3)

/obj/item/clothing/gloves/forensic
	desc = "Specially made gloves for forensic technicians. The luminescent threads woven into the material stand out under scrutiny."
	name = "forensic gloves"
	icon_state = "forensic"
	item_state = "bgloves"
	siemens_coefficient = 0.50
	permeability_coefficient = 0.05

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/thick
	desc = "These work gloves are thick and fire-resistant."
	name = "work gloves"
	icon_state = "black"
	item_state = "bgloves"
	siemens_coefficient = 0.50
	permeability_coefficient = 0.05

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/thick/modified
	item_flags = ITEM_FLAG_PREMODIFIED

/obj/item/clothing/gloves/thick/swat
	desc = "These tactical gloves are somewhat fire and impact-resistant."
	name = "\improper SWAT Gloves"
	item_state = "swat_gl"
	force = 5
	armor = list(melee = 80, bullet = 60, laser = 60,energy = 25, bomb = 50, bio = 10, rad = 0)

/obj/item/clothing/gloves/thick/combat //Combined effect of SWAT gloves and insulated gloves
	desc = "These tactical gloves are somewhat fire and impact resistant."
	name = "combat gloves"
	icon_state = "work"
	item_state = "wgloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	force = 5
	armor = list(melee = 80, bullet = 60, laser = 60,energy = 25, bomb = 50, bio = 10, rad = 0)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/thick/botany
	desc = "These leather work gloves protect against thorns, barbs, prickles, spikes and other harmful objects of floral origin."
	name = "thick leather gloves"
	icon_state = "leather"
	item_state = "ggloves"

/obj/item/clothing/gloves/thick/botany/modified
	item_flags = ITEM_FLAG_PREMODIFIED


/obj/item/clothing/gloves/thick/techpriest
	name = "cyborg tech priest hands"
	desc = "The augmented palms and fingers of a tech priest. Designed to allow the Priest to safely work on any machine."
	canremove = 0
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 30, bomb = 20, bio = 0, rad = 60)
	icon_state = "techpriest"
	item_state = "techpriest"
	unacidable = 1
	item_flags = ITEM_FLAG_NODROP

/obj/item/clothing/gloves/latex
	name = "latex gloves"
	desc = "Sterile latex gloves."
	icon_state = "latex"
	item_state = "lgloves"
	siemens_coefficient = 1.1 //thin latex gloves, much more conductive than fabric gloves (basically a capacitor for AC)
	permeability_coefficient = 0.01
	germ_level = 0

/obj/item/clothing/gloves/latex/modified
	item_flags = ITEM_FLAG_PREMODIFIED

/obj/item/clothing/gloves/latex/nitrile
	name = "nitrile gloves"
	desc = "Sterile nitrile gloves"
	icon_state = "nitrile"
	item_state = "ngloves"

/obj/item/clothing/gloves/latex/nitrile/modified
	item_flags = ITEM_FLAG_PREMODIFIED

/obj/item/clothing/gloves/duty
	desc = "These brown duty gloves are made from a durable synthetic."
	name = "work gloves"
	icon_state = "work"
	item_state = "wgloves"
	siemens_coefficient = 0.50
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/duty/modified
	item_flags = ITEM_FLAG_PREMODIFIED

/obj/item/clothing/gloves/tactical
	desc = "These brown tactical gloves are made from a durable synthetic, and have hardened knuckles."
	name = "tactical gloves"
	icon_state = "work"
	item_state = "wgloves"
	force = 5
	siemens_coefficient = 0.50
	permeability_coefficient = 0.05
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/gloves/guards
	desc = "A pair of synthetic gloves and arm pads reinforced with armor plating."
	name = "arm guards"
	icon_state = "guards"
	item_state = "guards"
	body_parts_covered = HANDS|ARMS
	w_class = ITEM_SIZE_NORMAL
	siemens_coefficient = 0.7
	permeability_coefficient = 0.03
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 25, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/gloves/thick/swat/combat/krieg
	icon_state = "krieggloves"
	item_state = "krieggloves"

/obj/item/clothing/gloves/prac_gloves
	name = "practioner gloves"
	desc = "Now you can grope the dead without worrying about what you're contracting."
	icon_state = "prac_gloves"
	item_state = "prac_gloves"

// Astra Militarum Stuff

/obj/item/clothing/gloves/combat/cadian
	name = "Mars Pattern Combat Gloves"
	desc = "The Astra Militarum standard issued gloves, found virtually everywhere in Imperial Space. Protect against most weather conditions and light bruises."
	icon_state = "work"
	item_state = "wgloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 5, bomb = 0, bio = 0, rad = 0)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/combat/krieg
	name = "Krieg Pattern Combat Gloves"
	desc = "The Krieg Guardsman's distinct gloves designed to be resistant against all common chemical and biological attacks, It's also works well as a alternative to hauling corpses due to it distinct smell."
	icon_state = "krieggloves"
	item_state = "krieggloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 30, rad = 0)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/combat/krieg/grenadier
	name = "Krieg Grenadier Pattern Combat Gloves"
	desc = "The Krieg Grenadier's distinct gloves designed to be resistant against all common chemical and biological attacks, as well as being uparmored for extra protection."
	icon_state = "grengloves"
	item_state = "grengloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	armor = list(melee = 0, bullet = 5, laser = 5,energy = 5, bomb = 0, bio = 30, rad = 0)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/sisterofbattle
	name = "Order of the Sacred Rose Power Gauntlets"
	desc = "Gauntlets of the Adepta Sororitas's Order Of Sacred Rose Battle Sisters, Part of their Power Armour System."
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	canremove = 1
	species_restricted = list(SPECIES_HUMAN)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/sisterofbattle/mlsister
	name = "Order of Our Martyred Lady Power Gauntlets"
	desc = "Gauntlets of a sister belonging to The Order of Our Martyred Lady. Part of their Power Armour System."
	icon_state = "mlsister"
	item_state = "mlsister"
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	canremove = 1
	species_restricted = list(SPECIES_HUMAN)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/sisterofbattle/brsister
	name = "Order of the Bloody Rose Power Gauntlets"
	desc = "Gauntlets of a sister belonging to The Order of the Sacred Rose. Part of their power armor system."
	icon_state = "brsister"
	item_state = "brsister"
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	canremove = 1
	species_restricted = list(SPECIES_HUMAN)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE