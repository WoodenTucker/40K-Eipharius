var/global/list/plant_seed_sprites = list()

//Seed packet object/procs.
/obj/item/seeds
	name = "packet of seeds"
	icon = 'icons/obj/seeds.dmi'
	icon_state = "seedy"
	w_class = ITEM_SIZE_SMALL

	var/seed_type
	var/datum/seed/seed
	var/modified = 0

/obj/item/seeds/Initialize()
	update_seed()
	. = ..()

//Grabs the appropriate seed datum from the global list.
/obj/item/seeds/proc/update_seed()
	if(!seed && seed_type && !isnull(plant_controller.seeds) && plant_controller.seeds[seed_type])
		seed = plant_controller.seeds[seed_type]
	update_appearance()

//Updates strings and icon appropriately based on seed datum.
/obj/item/seeds/proc/update_appearance()
	if(!seed) return

	// Update icon.
	overlays.Cut()
	var/is_seeds = ((seed.seed_noun in list(SEED_NOUN_SEEDS, SEED_NOUN_PITS, SEED_NOUN_NODES)) ? 1 : 0)
	var/image/seed_mask
	var/seed_base_key = "base-[is_seeds ? seed.get_trait(TRAIT_PLANT_COLOUR) : "spores"]"
	if(plant_seed_sprites[seed_base_key])
		seed_mask = plant_seed_sprites[seed_base_key]
	else
		seed_mask = image('icons/obj/seeds.dmi',"[is_seeds ? "seed" : "spore"]-mask")
		if(is_seeds) // Spore glass bits aren't coloured.
			seed_mask.color = seed.get_trait(TRAIT_PLANT_COLOUR)
		plant_seed_sprites[seed_base_key] = seed_mask

	var/image/seed_overlay
	var/seed_overlay_key = "[seed.get_trait(TRAIT_PRODUCT_ICON)]-[seed.get_trait(TRAIT_PRODUCT_COLOUR)]"
	if(plant_seed_sprites[seed_overlay_key])
		seed_overlay = plant_seed_sprites[seed_overlay_key]
	else
		seed_overlay = image('icons/obj/seeds.dmi',"[seed.get_trait(TRAIT_PRODUCT_ICON)]")
		seed_overlay.color = seed.get_trait(TRAIT_PRODUCT_COLOUR)
		plant_seed_sprites[seed_overlay_key] = seed_overlay

	overlays |= seed_mask
	overlays |= seed_overlay

	if(is_seeds)
		src.SetName("packet of [seed.seed_name] [seed.seed_noun]")
		src.desc = "It has a picture of [seed.display_name] on the front."
	else
		src.SetName("sample of [seed.seed_name] [seed.seed_noun]")
		src.desc = "It's labelled as coming from [seed.display_name]."

/obj/item/seeds/examine(mob/user)
	. = ..(user)
	if(seed && !seed.roundstart)
		to_chat(user, "It's tagged as variety #[seed.uid].")

/obj/item/seeds/cutting
	name = "cuttings"
	desc = "Some plant cuttings."

/obj/item/seeds/cutting/update_appearance()
	..()
	src.SetName("packet of [seed.seed_name] cuttings")

/obj/item/seeds/random
	seed_type = null

/obj/item/seeds/random/Initialize()
	seed = plant_controller.create_random_seed()
	seed_type = seed.name
	. = ..()

/obj/item/seeds/replicapod
	seed_type = "diona"
	sales_price = 10

/obj/item/seeds/chiliseed
	seed_type = "chili"
	sales_price = 3

/obj/item/seeds/plastiseed
	seed_type = "plastic"
	sales_price = 1

/obj/item/seeds/grapeseed
	seed_type = "grapes"
	sales_price = 2

/obj/item/seeds/greengrapeseed
	seed_type = "greengrapes"
	sales_price = 3

/obj/item/seeds/peanutseed
	seed_type = "peanut"
	sales_price = 2

/obj/item/seeds/cabbageseed
	seed_type = "cabbage"
	sales_price = 1

/obj/item/seeds/shandseed
	seed_type = "shand"
	sales_price = 2

/obj/item/seeds/mtearseed
	seed_type = "mtear"
	sales_price = 2

/obj/item/seeds/berryseed
	seed_type = "berries"
	sales_price = 2

/obj/item/seeds/blueberryseed
	seed_type = "blueberries"
	sales_price = 2

/obj/item/seeds/glowberryseed
	seed_type = "glowberries"
	sales_price = 3

/obj/item/seeds/bananaseed
	seed_type = "banana"
	sales_price = 2

/obj/item/seeds/eggplantseed
	seed_type = "eggplant"
	sales_price = 2

/obj/item/seeds/bloodtomatoseed
	seed_type = "bloodtomato"
	sales_price = 3

/obj/item/seeds/tomatoseed
	seed_type = "tomato"
	sales_price = 2

/obj/item/seeds/killertomatoseed
	seed_type = "killertomato"
	sales_price = 4

/obj/item/seeds/bluetomatoseed
	seed_type = "bluetomato"
	sales_price = 3

/obj/item/seeds/bluespacetomatoseed
	seed_type = "bluespacetomato"
	sales_price = 6

/obj/item/seeds/cornseed
	seed_type = "corn"
	sales_price = 2

/obj/item/seeds/poppyseed
	seed_type = "poppies"
	sales_price = 1

/obj/item/seeds/potatoseed
	seed_type = "potato"
	sales_price = 1

/obj/item/seeds/icepepperseed
	seed_type = "icechili"
	sales_price = 2

/obj/item/seeds/soyaseed
	seed_type = "soybean"
	sales_price = 2

/obj/item/seeds/wheatseed
	seed_type = "wheat"
	sales_price = 1

/obj/item/seeds/riceseed
	seed_type = "rice"
	sales_price = 1

/obj/item/seeds/carrotseed
	seed_type = "carrot"
	sales_price = 2

/obj/item/seeds/reishimycelium
	seed_type = "reishi"
	sales_price = 3

/obj/item/seeds/amanitamycelium
	seed_type = "amanita"
	sales_price = 3

/obj/item/seeds/angelmycelium
	seed_type = "destroyingangel"
	sales_price = 2

/obj/item/seeds/libertymycelium
	seed_type = "libertycap"
	sales_price = 2

/obj/item/seeds/chantermycelium
	seed_type = "mushrooms"
	sales_price = 2

/obj/item/seeds/towermycelium
	seed_type = "towercap"
	sales_price = 3

/obj/item/seeds/glowshroom
	seed_type = "glowshroom"
	sales_price = 3

/obj/item/seeds/plumpmycelium
	seed_type = "plumphelmet"
	sales_price = 2

/obj/item/seeds/walkingmushroommycelium
	seed_type = "walkingmushroom"
	sales_price = 4

/obj/item/seeds/nettleseed
	seed_type = "nettle"
	sales_price = 1

/obj/item/seeds/deathnettleseed
	seed_type = "deathnettle"
	sales_price = 3

/obj/item/seeds/weeds
	seed_type = "weeds"
	sales_price = 1

/obj/item/seeds/harebell
	seed_type = "harebells"
	sales_price = 2

/obj/item/seeds/sunflowerseed
	seed_type = "sunflowers"
	sales_price = 3

/obj/item/seeds/lavenderseed
	seed_type = "lavender"
	sales_price = 3

/obj/item/seeds/brownmold
	seed_type = "mold"
	sales_price = 1

/obj/item/seeds/appleseed
	seed_type = "apple"
	sales_price = 1

/obj/item/seeds/poisonedappleseed
	seed_type = "poisonapple"
	sales_price = 2

/obj/item/seeds/goldappleseed
	seed_type = "goldapple"
	sales_price = 4

/obj/item/seeds/ambrosiavulgarisseed
	seed_type = "ambrosia"
	sales_price = 4

/obj/item/seeds/ambrosiadeusseed
	seed_type = "ambrosiadeus"
	sales_price = 4

/obj/item/seeds/whitebeetseed
	seed_type = "whitebeet"
	sales_price = 3

/obj/item/seeds/sugarcaneseed
	seed_type = "sugarcane"
	sales_price = 2

/obj/item/seeds/watermelonseed
	seed_type = "watermelon"
	sales_price = 3

/obj/item/seeds/pumpkinseed
	seed_type = "pumpkin"
	sales_price = 2

/obj/item/seeds/limeseed
	seed_type = "lime"
	sales_price = 2

/obj/item/seeds/lemonseed
	seed_type = "lemon"
	sales_price = 2

/obj/item/seeds/orangeseed
	seed_type = "orange"
	sales_price = 2

/obj/item/seeds/poisonberryseed
	seed_type = "poisonberries"
	sales_price = 2

/obj/item/seeds/deathberryseed
	seed_type = "deathberries"
	sales_price = 3

/obj/item/seeds/grassseed
	seed_type = "grass"
	sales_price = 1

/obj/item/seeds/cocoapodseed
	seed_type = "cocoa"
	sales_price = 2

/obj/item/seeds/cherryseed
	seed_type = "cherry"
	sales_price = 2

/obj/item/seeds/tobaccoseed
	seed_type = "lho"
	sales_price = 3

/obj/item/seeds/finetobaccoseed
	seed_type = "finetobacco"
	sales_price = 4

/obj/item/seeds/puretobaccoseed
	seed_type = "puretobacco"
	sales_price = 4

/obj/item/seeds/kudzuseed
	seed_type = "kudzu"
	sales_price = 2

/obj/item/seeds/peppercornseed
	seed_type = "peppercorn"
	sales_price = 2

/obj/item/seeds/garlicseed
	seed_type = "garlic"
	sales_price = 2

/obj/item/seeds/onionseed
	seed_type = "onion"
	sales_price = 2

/obj/item/seeds/blackbeanseed
	seed_type = "blackbean"
	sales_price = 2