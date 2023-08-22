///////////////////////////////////////////////Alchohol bottles! -Agouri //////////////////////////
//Functionally identical to regular drinks. The only difference is that the default bottle size is 100. - Darem
//Bottles now weaken and break when smashed on people's heads. - Giacom

/obj/item/reagent_containers/food/drinks/bottle
	amount_per_transfer_from_this = 10
	volume = 100
	item_state = "broken_beer" //Generic held-item sprite until unique ones are made.
	force = 5
	var/smash_duration = 5 //Directly relates to the 'weaken' duration. Lowered by armor (i.e. helmets)
	var/isGlass = 1 //Whether the 'bottle' is made of glass or not so that milk cartons dont shatter when someone gets hit by it

	var/obj/item/reagent_containers/glass/rag/rag = null
	var/rag_underlay = "rag"
	table_sound = 'sound/items/placing_glass2.ogg'
	drop_sound = 'sound/items/drop_glass.ogg'
	table_pickup_sound = 'sound/items/generic_lift.ogg'


/obj/item/reagent_containers/food/drinks/bottle/New()
	..()
	if(isGlass) unacidable = 1

/obj/item/reagent_containers/food/drinks/bottle/Destroy()
	if(rag)
		rag.forceMove(src.loc)
	rag = null
	return ..()

//when thrown on impact, bottles smash and spill their contents
/obj/item/reagent_containers/food/drinks/bottle/throw_impact(atom/hit_atom, var/speed)
	..()

	var/mob/M = thrower
	if(isGlass && istype(M) && M.a_intent != I_HELP)
		var/throw_dist = get_dist(throw_source, loc)
		if(speed > throw_speed || smash_check(throw_dist)) //not as reliable as smashing directly
			if(reagents)
				hit_atom.visible_message("<span class='notice'>The contents of \the [src] splash all over [hit_atom]!</span>")
				reagents.splash(hit_atom, reagents.total_volume)
			smash(loc, hit_atom)

//Smashes when shot.
/obj/item/reagent_containers/food/drinks/bottle/bullet_act(obj/item/projectile/P)
	. = ..()
	if(!(P.nodamage) && P.damage_type == BRUTE && !QDELETED(src))
		var/atom/T = get_turf(src)
		smash(T)
		return

/obj/item/reagent_containers/food/drinks/bottle/proc/smash_check(var/distance)
	if(!isGlass || !smash_duration)
		return 0

	var/list/chance_table = list(95, 95, 90, 85, 75, 60, 40, 15) //starting from distance 0
	var/idx = max(distance + 1, 1) //since list indices start at 1
	if(idx > chance_table.len)
		return 0
	return prob(chance_table[idx])

/obj/item/reagent_containers/food/drinks/bottle/proc/smash(var/newloc, atom/against = null)
	if(ismob(loc))
		var/mob/M = loc
		M.drop_from_inventory(src)

	//Creates a shattering noise and replaces the bottle with a broken_bottle
	var/obj/item/broken_bottle/B = new /obj/item/broken_bottle(newloc)
	if(prob(33))
		new/obj/item/material/shard(newloc) // Create a glass shard at the target's location!
	B.icon_state = src.icon_state

	var/icon/I = new('icons/obj/drinks.dmi', src.icon_state)
	I.Blend(B.broken_outline, ICON_OVERLAY, rand(5), 1)
	I.SwapColor(rgb(255, 0, 220, 255), rgb(0, 0, 0, 0))
	B.icon = I

	if(rag && rag.on_fire && isliving(against))
		rag.forceMove(loc)
		var/mob/living/L = against
		L.IgniteMob()

	playsound(src, "shatter", 70, 1)
	src.transfer_fingerprints_to(B)

	qdel(src)
	return B

/obj/item/reagent_containers/food/drinks/bottle/attackby(obj/item/W, mob/user)
	if(!rag && istype(W, /obj/item/reagent_containers/glass/rag))
		insert_rag(W, user)
		return
	if(rag && istype(W, /obj/item/flame))
		rag.attackby(W, user)
		return
	..()

/obj/item/reagent_containers/food/drinks/bottle/attack_self(mob/user)
	if(rag)
		remove_rag(user)
	else
		..()

/obj/item/reagent_containers/food/drinks/bottle/proc/insert_rag(obj/item/reagent_containers/glass/rag/R, mob/user)
	if(!isGlass || rag) return
	if(user.unEquip(R))
		to_chat(user, "<span class='notice'>You stuff [R] into [src].</span>")
		rag = R
		rag.forceMove(src)
		atom_flags &= ~ATOM_FLAG_OPEN_CONTAINER
		update_icon()

/obj/item/reagent_containers/food/drinks/bottle/proc/remove_rag(mob/user)
	if(!rag) return
	user.put_in_hands(rag)
	rag = null
	atom_flags |= ATOM_FLAG_OPEN_CONTAINER
	update_icon()

/obj/item/reagent_containers/food/drinks/bottle/open(mob/user)
	if(rag) return
	..()

/obj/item/reagent_containers/food/drinks/bottle/update_icon()
	underlays.Cut()
	if(rag)
		var/underlay_image = image(icon='icons/obj/drinks.dmi', icon_state=rag.on_fire? "[rag_underlay]_lit" : rag_underlay)
		underlays += underlay_image
		set_light(rag.light_range, rag.light_power, rag.light_color)
	else
		set_light(0)

/obj/item/reagent_containers/food/drinks/bottle/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	var/blocked = ..()

	if(user.a_intent != I_HURT)
		return
	if(!smash_check(1))
		return //won't always break on the first hit

	// You are going to knock someone out for longer if they are not wearing a helmet.
	var/weaken_duration = 0
	if(blocked < 100)
		weaken_duration = smash_duration + min(0, force - target.getarmor(hit_zone, "melee") + 10)

	var/mob/living/carbon/human/H = target
	if(istype(H) && H.headcheck(hit_zone))
		var/obj/item/organ/affecting = H.get_organ(hit_zone) //headcheck should ensure that affecting is not null
		user.visible_message("<span class='danger'>[user] smashes [src] into [H]'s [affecting.name]!</span>")
		if(weaken_duration)
			target.apply_effect(min(weaken_duration, 5), WEAKEN, blocked) // Never weaken more than a flash!
	else
		user.visible_message("<span class='danger'>\The [user] smashes [src] into [target]!</span>")

	//The reagents in the bottle splash all over the target, thanks for the idea Nodrak
	if(reagents)
		user.visible_message("<span class='notice'>The contents of \the [src] splash all over [target]!</span>")
		reagents.splash(target, reagents.total_volume)

	//Finally, smash the bottle. This kills (qdel) the bottle.
	var/obj/item/broken_bottle/B = smash(target.loc, target)
	user.put_in_active_hand(B)

	return blocked

//Keeping this here for now, I'll ask if I should keep it here.
/obj/item/broken_bottle

	name = "Broken Bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	force = 9
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = 1
	edge = 0
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")

/obj/item/broken_bottle/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	playsound(loc, 'sound/weapons/bladeslice.ogg', 50, 1, -1)
	return ..()


/obj/item/reagent_containers/food/drinks/bottle/gin
	name = "Gosk White-Gyn"
	desc = "A bottle of White-Gyn: As expensive as it is liver-destroying!"
	icon_state = "ginbottle"
	center_of_mass = "x=16;y=4"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/gin, 100)

/obj/item/reagent_containers/food/drinks/bottle/whiskey
	name = "Agri-Whiskey"
	desc = "A fairly good-quality grain-based liquor fit for the Imperiums stout defenders!"
	icon_state = "whiskeybottle"
	center_of_mass = "x=16;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/whiskey, 100)

/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey
	name = "Agri-Select Whiskey"
	desc = "Agri-Select. Distilled using techniques older than the Imperium itself: It's seriously good stuff!"
	icon_state = "whiskeybottle2"
	center_of_mass = "x=16;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/specialwhiskey, 100)

/obj/item/reagent_containers/food/drinks/bottle/vodka
	name = "Rahzvod"
	desc = "Kicks like a Grox and tastes like you licked the grease off your lasgun! Commonly dispensed as a ration to the Firstborn Regiment!"
	icon_state = "vodkabottle"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/vodka, 100)

/obj/item/reagent_containers/food/drinks/bottle/tequilla
	name = "Petro-Rotgut"
	desc = "Made from what can only be described as 'Questionable' materials. It'll put you on your ass fast!"
	icon_state = "tequillabottle"
	center_of_mass = "x=16;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/tequilla, 100)

/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing
	name = "Bottle of Nothing"
	desc = "A bottle filled with nothing."
	icon_state = "bottleofnothing"
	center_of_mass = "x=17;y=5"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/nothing, 100)

/obj/item/reagent_containers/food/drinks/bottle/patron
	name = "Wrapp Artiste Patron"
	desc = "Silver laced tequilla, served in space night clubs across the galaxy."
	icon_state = "patronbottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/patron, 100)

/obj/item/reagent_containers/food/drinks/bottle/rum
	name = "Old Foiz"
	desc = "Distilled Sugar. You don't get much more classic than Old Foiz!"
	icon_state = "rumbottle"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/rum, 100)

/obj/item/reagent_containers/food/drinks/bottle/holywater
	name = "Flask of Holy Water"
	desc = "A flask of the chaplain's holy water."
	icon_state = "holyflask"
	center_of_mass = "x=17;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/water/holywater, 100)

/obj/item/reagent_containers/food/drinks/bottle/vermouth
	name = "Vlod"
	desc = "Dry, yet sweet. Of course the bloody Valhallans made it!"
	icon_state = "vermouthbottle"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/vermouth, 100)

/obj/item/reagent_containers/food/drinks/bottle/kahlua
	name = "Recaf Rotgut"
	desc = "Because adding liquor to your cup of mud is just a little too tiresome!"
	icon_state = "kahluabottle"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/coffee/kahlua, 100)

/obj/item/reagent_containers/food/drinks/bottle/goldschlager
	name = "Hive-Spire Goldschlager"
	desc = "Somebody is going to murder you for owning this!"
	icon_state = "goldschlagerbottle"
	center_of_mass = "x=15;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/goldschlager, 100)

/obj/item/reagent_containers/food/drinks/bottle/cognac
	name = "Gleece"
	desc = "A sweet and strongly alchoholic drink. It costs more than you're worth!"
	icon_state = "cognacbottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/cognac, 100)

/obj/item/reagent_containers/food/drinks/bottle/wine
	name = "Vintage Orphan Blood Wine"
	desc = "A faint aura of unease surrounds the bottle. If you listen closely, you can still hear the screams."
	icon_state = "winebottle"
	center_of_mass = "x=16;y=4"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/wine, 100)

/obj/item/reagent_containers/food/drinks/bottle/absinthe
	name = "Estufagemi Wine"
	desc = "Pungant, terpy and generally a hardcore alcoholics version of Wine!"
	icon_state = "absinthebottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/absinthe, 100)

/obj/item/reagent_containers/food/drinks/bottle/melonliquor
	name = "Melon Liquor"
	desc = "A bottle of sweet sugary melon-liquor. Because the God-Emperor is dead!"
	icon_state = "alco-green" //Placeholder.
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/melonliquor, 100)

/obj/item/reagent_containers/food/drinks/bottle/bluecuracao
	name = "Blue Curacao"
	desc = "A fruity, exceptionally azure drink. Somehow still popular in the Grimdarkness!"
	icon_state = "alco-blue" //Placeholder.
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/bluecuracao, 100)

/obj/item/reagent_containers/food/drinks/bottle/herbal
	name = "Liqueur d'Herbe"
	desc = "A bottle of the seventh-finest herbal liquor sold under a generic name in the galaxy. The back label has a load of guff about the monks who traditionally made this particular variety."
	icon_state = "herbal"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/herbal, 100)

/obj/item/reagent_containers/food/drinks/bottle/grenadine
	name = "Grenadine Syrup"
	desc = "Sweet and tangy, a bar syrup used to add color or flavor to drinks."
	icon_state = "grenadinebottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/grenadine, 100)

/obj/item/reagent_containers/food/drinks/bottle/cola
	name = "\improper Imperial Cola"
	desc = "Imperial-Cola in a bottle!"
	icon_state = "colabottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/space_cola, 100)

/obj/item/reagent_containers/food/drinks/bottle/space_up
	name = "\improper Warp-Up"
	desc = "Warp-Up in a bottle!"
	icon_state = "space-up_bottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/space_up, 100)

/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind
	name = "\improper Imperial Ploin-Fizz"
	desc = "Imperial Ploin-Fizz in a bottle!"
	icon_state = "space_mountain_wind_bottle"
	center_of_mass = "x=16;y=6"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/spacemountainwind, 100)

/obj/item/reagent_containers/food/drinks/bottle/pwine
	name = "Madgods Folly"
	desc = "Certainly the finest sin anyone can guzzle down!"
	icon_state = "pwinebottle"
	center_of_mass = "x=16;y=4"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/pwine, 100)

//////////////////////////PREMIUM ALCOHOL ///////////////////////
/obj/item/reagent_containers/food/drinks/bottle/premiumvodka
	name = "Premium Tridistilled Vodka"
	desc = "Premium distilled vodka from the botanical starchs of a 'potato'!"
	icon_state = "premiumvodka"
	center_of_mass = "x=17;y=3"

/obj/item/reagent_containers/food/drinks/bottle/premiumvodka/New()
	..()
	reagents.add_reagent(/datum/reagent/ethanol/vodka/premium, 100)
	var/namepick = pick("Four Stripes","Gilgamesh","Novaya Zemlya","Terran","STS-35")
	var/typepick = pick("Absolut","Gold","Quadruple Distilled","Platinum","Standard")
	name = "[namepick] [typepick]"

/obj/item/reagent_containers/food/drinks/bottle/premiumwine
	name = "House Amasec"
	desc = "You feel pretentious just looking at it. Produced in-house by the Rogue Traders snobbish brethren!"
	icon_state = "premiumwine"
	center_of_mass = "x=16;y=4"

/obj/item/reagent_containers/food/drinks/bottle/premiumwine/New()
	..()
	reagents.add_reagent(/datum/reagent/ethanol/wine/premium, 100)
	var/namepick = pick("Calumont","Sciacchemont","Recioto","Torcalota")
	var/agedyear = rand(2350,2550)
	name = "Chateau [namepick] De Blanc"
	desc += " This bottle is marked as [agedyear] Vintage."

//////////////////////////JUICES AND STUFF ///////////////////////

/obj/item/reagent_containers/food/drinks/bottle/orangejuice
	name = "Orange Juice"
	desc = "Full of vitamins and deliciousness!"
	icon_state = "orangejuice"
	item_state = "carton"
	center_of_mass = "x=16;y=7"
	isGlass = 0
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/juice/orange, 100)

/obj/item/reagent_containers/food/drinks/bottle/cream
	name = "Milk Cream"
	desc = "It's cream. Made from milk. What else did you think you'd find in there?"
	icon_state = "cream"
	item_state = "carton"
	center_of_mass = "x=16;y=8"
	isGlass = 0
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/milk/cream, 100)

/obj/item/reagent_containers/food/drinks/bottle/tomatojuice
	name = "Tomato Juice"
	desc = "Well, at least it LOOKS like tomato juice. You can't tell with all that redness."
	icon_state = "tomatojuice"
	item_state = "carton"
	center_of_mass = "x=16;y=8"
	isGlass = 0
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/juice/tomato, 100)

/obj/item/reagent_containers/food/drinks/bottle/limejuice
	name = "Lime Juice"
	desc = "Sweet-sour goodness."
	icon_state = "limejuice"
	item_state = "carton"
	center_of_mass = "x=16;y=8"
	isGlass = 0
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/juice/lime, 100)

//Small bottles
/obj/item/reagent_containers/food/drinks/bottle/small
	volume = 50
	smash_duration = 1
	atom_flags = 0 //starts closed
	rag_underlay = "rag_small"

/obj/item/reagent_containers/food/drinks/bottle/small/beer
	name = "Imperial Beer"
	desc = "Contains only recycled water, refined starchs and yeast."
	icon_state = "beer"
	center_of_mass = "x=16;y=12"
/obj/item/reagent_containers/food/drinks/bottle/small/beer/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/ethanol/beer, 30)

/obj/item/reagent_containers/food/drinks/bottle/small/ale
	name = "\improper Imperial Bitter"
	desc = "A staple of any hardened son-of-a-bitch's diet."
	icon_state = "alebottle"
	item_state = "beer"
	center_of_mass = "x=16;y=10"
/obj/item/reagent_containers/food/drinks/bottle/small/ale/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/ethanol/ale, 30)


/obj/item/reagent_containers/food/drinks/bottle/amasecpoor
	name = "Rotgut Amasec"
	desc = "Affordable, through of questionable quality and flavour. The beloved drink of the Imperium's Hive-Scum!"
	icon_state = "amasecpoor"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/amasec/cheap, 100)

/obj/item/reagent_containers/food/drinks/bottle/amasecexpensive
	name = "Expensive Amasec"
	desc = "Expensive, aged and meant for the nobility of the Imperium. This bottle of amasec tastes and smells like the embrace of the Emperor himself!"
	icon_state = "amasecpricey"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/amasec/expensive, 100)

/obj/item/reagent_containers/food/drinks/bottle/caddis/extra
	name = "Mourning Collection"
	desc = "Expensive, aged and meant for the nobility of the Imperium. This bottle of wine tastes and smells indescribably good, produced from precious fruits and herbs of the paradise world of Caddis for the lowest class of it's citizens."
	icon_state = "amasecpricey"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/amasec/caddis/extra, 100)

/obj/item/reagent_containers/food/drinks/bottle/caddis/elite
	name = "Golden Tokay"
	desc = "Expensive, aged and meant for the nobility of the Imperium. This bottle of wine tastes and smells indescribably good, produced from precious fruits and herbs of the paradise world of Caddis for the middle-class citizens."
	icon_state = "amasecpricey"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/amasec/caddis/elite, 100)

/obj/item/reagent_containers/food/drinks/bottle/caddis/supreme
	name = "Catalina Malvasia"
	desc = "Expensive, extremely aged and meant for the nobility of the Imperium. This bottle of wine tastes and smells indescribably good, produced from precious fruits and herbs of the paradise world of Caddis for it's highest nobility."
	icon_state = "amasecpricey"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/amasec/caddis/supreme, 100)

/obj/item/reagent_containers/food/drinks/bottle/mjod
	name = "Fenrisian Ale"
	desc = "Extremely strong and toxic beverage, designed to pass through the Adeptus Astartes liver and oolithic kidney. May be lethal for humans, but tastes quite good, so it worths the risk to take a sip sometimes."
	icon_state = "amasecpoor"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/amasec/mjod, 100)

/obj/item/reagent_containers/food/drinks/glass2/chaos
	name = "khorne drink"
	desc = "Just by looking at this glass, it makes you want to FUCKING KILL SOMEONE WITH YOUR BARE, FUCKING, HANDS!"
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "khorne"
	filling_states = "20;40;60;80;100"
	volume = 50
	possible_transfer_amounts = "5;10;15;25"
	rim_pos = "y=25;x_left=12;x_right=21"

/obj/item/reagent_containers/food/drinks/glass2/chaos/New()
	..()
	reagents.add_reagent(/datum/reagent/adrenaline, 10)
	reagents.add_reagent(/datum/reagent/iron, 10)
	reagents.add_reagent(/datum/reagent/blood, 30)

/obj/item/reagent_containers/food/drinks/glass2/chaos/slannesh
	name = "slanneshi drink"
	desc = "A drink that really lifts that arousing mood for some reason the more you look at it."
	icon_state = "slaanesh"
	filling_states = "20;40;60;80;100"
	volume = 50
	possible_transfer_amounts = "5;10;15;25"
	rim_pos = "y=25;x_left=12;x_right=21"

/obj/item/reagent_containers/food/drinks/glass2/chaos/slannesh/New()
	..()
	reagents.add_reagent(/datum/reagent/psilocybin, 10)
	reagents.add_reagent(/datum/reagent/mindbreaker, 10)
	reagents.add_reagent(/datum/reagent/space_drugs, 10)
	reagents.add_reagent(/datum/reagent/methylphenidate, 10)
	reagents.add_reagent(/datum/reagent/adrenaline, 10)

/obj/item/reagent_containers/food/drinks/glass2/chaos/tzeench
	name = "tzeench drink"
	desc = "A drink made just as planned in the grand scheme of things."
	icon_state = "tzeench"
	filling_states = "20;40;60;80;100"
	volume = 50
	possible_transfer_amounts = "5;10;15;25"
	rim_pos = "y=25;x_left=12;x_right=21"

/obj/item/reagent_containers/food/drinks/glass2/chaos/tzeench/New()
	..()
	reagents.add_reagent(/datum/reagent/mindbreaker, 30)
	reagents.add_reagent(/datum/reagent/alkysine, 10)
	reagents.add_reagent(/datum/reagent/tricordrazine, 10)

/obj/item/reagent_containers/food/drinks/glass2/chaos/nurgle
	name = "nurgle drink"
	desc = "The smell is nauseating, and whatever was thrown on it really is sickening to smell."
	icon_state = "nurgle"
	filling_states = "20;40;60;80;100"
	volume = 50
	possible_transfer_amounts = "5;10;15;25"
	rim_pos = "y=25;x_left=12;x_right=21"

/obj/item/reagent_containers/food/drinks/glass2/chaos/nurgle/New()
	..()
	reagents.add_reagent(/datum/reagent/mutagen, 10)
	reagents.add_reagent(/datum/reagent/ethanol/booger, 10)
	reagents.add_reagent(/datum/reagent/toxin, 30)

/obj/item/reagent_containers/food/drinks/flask/goblet
	name = "silver goblet"
	desc = "A goblet fitting for a noble, to drink something more expensive than the goblet itself."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "goblet_silver"
	volume = 60
	center_of_mass = "x=17;y=7"

/obj/item/reagent_containers/food/drinks/flask/goblet/gold
	name = "gold goblet"
	desc = "A goblet fitting for a noble, to drink something more expensive than the goblet itself and the servant who's filling it."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "goblet_gold"
	volume = 60
	center_of_mass = "x=17;y=7"


/obj/item/reagent_containers/food/drinks/bottle/distillery
	name = "High Quality Moonshine"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "moonshine"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/moonshine, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/green_rush
	name = "Green Rush"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "greenrush"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/greenrush, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/blue_rush
	name = "Blue Rush"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "bluerush"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/bluerush, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/oak_scream
	name = "Oak Scream"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "oak_scream"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/oak_scream, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/southern_blood
	name = "Southern Blood"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "southernblood"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/southernblood, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/ancient_eye
	name = "Ancient Eye"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "ancienteye"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/ancienteye, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/thyme_bolt
	name = "Thyme Bolt"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "thymebolt"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/thymebolt, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/red_score
	name = "RedScore"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "redscore"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/redscore, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/spirit_bear
	name = "SpiritBear"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "spiritbear"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/spiritbear, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/old_vinland
	name = "Old Vinland"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "oldvinland"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/oldvinland, 100)

/obj/item/reagent_containers/food/drinks/bottle/distillery/depressing_flash
	name = "Depressing Flash"
	desc = "A nice big jug of moonshine, fitting for poor, homeless, peasants, and specially farmers."
	icon_state = "depflash"
	icon = 'icons/map_project/farm_content.dmi'
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/depressing_flash, 100)