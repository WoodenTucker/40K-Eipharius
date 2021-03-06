/obj/item/reagent_containers/food/drinks/cans
	volume = 40 //just over one and a half cups
	amount_per_transfer_from_this = 5
	atom_flags = 0 //starts closed

//DRINKS

/obj/item/reagent_containers/food/drinks/cans/cola
	name = "\improper Imperial Cola"
	desc = "About as refreshing as luke-warm piss. Very likely made FROM recycled piss!"
	icon_state = "cola"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/cola/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/space_cola, 30)

/obj/item/reagent_containers/food/drinks/cans/waterbottle
	name = "bottled water"
	desc = "Pure drinking water, imported from some hive recycling plant."
	icon_state = "waterbottle"
	center_of_mass = "x=15;y=8"

/obj/item/reagent_containers/food/drinks/cans/waterbottle/New()
	..()
	reagents.add_reagent(/datum/reagent/water, 30)

/obj/item/reagent_containers/food/drinks/cans/waterbottle/open(mob/user)
	playsound(loc,'sound/effects/bonebreak1.ogg', rand(10,50), 1)
	to_chat(user, "<span class='notice'>You twist open \the [src], destroying the safety seal!</span>")
	atom_flags |= ATOM_FLAG_OPEN_CONTAINER

/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind
	name = "\improper Imperial Ploin-Fizz"
	desc = "Fizzy ploin juice. Rather sweet and tangy!"
	icon_state = "space_mountain_wind"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/spacemountainwind, 30)

/obj/item/reagent_containers/food/drinks/cans/thirteenloko
	name = "\improper Thirteen Loko"
	desc = "The Head Practitioner has advised crew members that consumption of Thirteen Loko may result in seizures, blindness, drunkeness, or even death. Please Drink Responsibly."
	icon_state = "thirteen_loko"
	center_of_mass = "x=16;y=8"

/obj/item/reagent_containers/food/drinks/cans/thirteenloko/New()
	..()
	reagents.add_reagent(/datum/reagent/ethanol/thirteenloko, 30)

/obj/item/reagent_containers/food/drinks/cans/dr_gibb
	name = "\improper Dr. Russ"
	desc = "A delicious blend of 42 different flavours. Including Bloodthirster juice!"
	icon_state = "dr_gibb"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/dr_gibb/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/dr_gibb, 30)

/obj/item/reagent_containers/food/drinks/cans/starkist
	name = "\improper Stun-kist"
	desc = "A stunning taste. Knocks you right off your feet."
	icon_state = "starkist"
	center_of_mass = "x=16;y=10"
/obj/item/reagent_containers/food/drinks/cans/starkist/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/brownstar, 30)

/obj/item/reagent_containers/food/drinks/cans/space_up
	name = "\improper Warp-Up"
	desc = "Sends your taste-buds to the warp! Because it tastes like SHIT!"
	icon_state = "space-up"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/space_up/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/space_up, 30)

/obj/item/reagent_containers/food/drinks/cans/lemon_lime
	name = "\improper Lemon-Lime"
	desc = "Lemon Lime? Lemon-Fucking-Lime? You expect to get anything but ploin-juice on YOUR salary?!"
	icon_state = "lemon-lime"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/lemon_lime/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/lemon_lime, 30)

/obj/item/reagent_containers/food/drinks/cans/iced_tea
	name = "\improper Cadia-Stands Iced Tea"
	desc = "That sweet, refreshing flavor of... Tea? If you listen closely you can still hear the screams."
	icon_state = "ice_tea_can"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/iced_tea/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/tea/icetea, 30)

/obj/item/reagent_containers/food/drinks/cans/grape_juice
	name = "\improper Grapel Juice"
	desc = "500 pages of rules of how to appropriately enter into a combat with this juice!"
	icon_state = "purple_can"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/grape_juice/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/juice/grape, 30)

/obj/item/reagent_containers/food/drinks/cans/tonic
	name = "\improper Servitor Tonic Water"
	desc = "Quinine tastes funny, but at least it'll keep that Space Malaria away."
	icon_state = "tonic"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/tonic/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/tonic, 50)

/obj/item/reagent_containers/food/drinks/cans/sodawater
	name = "soda water"
	desc = "A can of soda water. Still water's more refreshing cousin."
	icon_state = "sodawater"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/sodawater/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/sodawater, 50)