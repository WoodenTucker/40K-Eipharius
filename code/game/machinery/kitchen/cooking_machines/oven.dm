/obj/machinery/cooker/oven
	name = "oven"
	desc = "Cookies are ready, dear."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "oven0"
	on_icon = "oven1"
	off_icon = "oven0"
	cook_type = "baked"
	cook_time = 300
	food_color = "#a34719"
	can_burn_food = 1
//TODO make moe foods for this - wel
	output_options = list(
		"Personal Pizza" = /obj/item/reagent_containers/food/snacks/variable/pizza,
		"Bread" = /obj/item/reagent_containers/food/snacks/variable/bread,
		"Pie" = /obj/item/reagent_containers/food/snacks/variable/pie,
		"Small Cake" = /obj/item/reagent_containers/food/snacks/variable/cake,
		"Hot Pocket" = /obj/item/reagent_containers/food/snacks/variable/pocket,
		"Kebab" = /obj/item/reagent_containers/food/snacks/variable/kebab,
		"Waffles" = /obj/item/reagent_containers/food/snacks/variable/waffles,
		"Pancakes" = /obj/item/reagent_containers/food/snacks/variable/pancakes,
		"Cookie" = /obj/item/reagent_containers/food/snacks/variable/cookie,
		"Donut" = /obj/item/reagent_containers/food/snacks/variable/donut,
		"Baked Rat" = /obj/item/reagent_containers/food/snacks/meat/rat_meat,
		"Baked Shafra" = /obj/item/reagent_containers/food/snacks/shaframeat,
		"Baked Bear" = /obj/item/reagent_containers/food/snacks/bearmeat


		)