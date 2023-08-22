/obj/structure/sign/double/barsign
	desc = "A jumbo-sized LED sign. This one seems to be showing its age."
	description_info = "If your ID has bar access, you may swipe it on this sign to alter its display."
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "empty"
	appearance_flags = 0
	anchored = 1
	var/cult = 0

/obj/structure/sign/double/barsign/proc/get_valid_states(initial=1)
	. = icon_states(icon)
	. -= "on"
	. -= "narsiebistro"
	. -= "empty"
	if(initial)
		. -= "Off"

/obj/structure/sign/double/barsign/examine(mob/user)
	. = ..()
	switch(icon_state)
		if("Off")
			to_chat(user, "It appears to be switched off.")
		if("narsiebistro")
			to_chat(user, "It shows a picture of a large black and red being. Spooky!")
		if("on", "empty")
			to_chat(user, "The lights are on, but there's no picture.")
		else
			to_chat(user, "It says '[icon_state]'")

/obj/structure/sign/double/barsign/New()
	..()
	icon_state = pick(get_valid_states())

/obj/structure/sign/double/barsign/attackby(obj/item/I, mob/user)
	if(cult)
		return ..()

	var/obj/item/card/id/card = I.GetIdCard()
	if(istype(card))
		if(access_bar in card.GetAccess())
			var/sign_type = input(user, "What would you like to change the barsign to?") as null|anything in get_valid_states(0)
			if(!sign_type)
				return
			icon_state = sign_type
			to_chat(user, "<span class='notice'>You change the barsign.</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
		return

	return ..()

// MORE DECORATION - Mostly statues and other things for decorating the map

/obj/structure/sign/plate
	name = "\improper plate"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "An stone plate, whatever was written on it is now lost to time."
	icon_state = "mplate0"

/obj/structure/sign/plate/written
	name = "\improper plate"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "An stone plate, this one has written a name of someone who seems to be quite older than the place itself."
	icon_state = "mplate1"

/obj/structure/sign/plate/stoneshrine
	name = "\improper wall shrine"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "These kind of shrines are used often outdoors and in certain religious sites..this one seems empty."
	icon_state = "fort1"

/obj/structure/sign/fish
	name = "\improper fish trophy"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "An old Terra souvenir of some kind of moving fish, why would anyone buy this ?"
	icon_state = "fish"

/obj/structure/sign/prices
	name = "\improper priceboard"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A list of products with prices. It does seem old and outdated."
	icon_state = "priceboard"

/obj/structure/sign/chaos
	name = "\improper dark gods symbol"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "An strange metalic symbol of the dark star of chaos."
	icon_state = "chaostar"

/obj/structure/sign/poster
	name = "\improper pleasure club ad"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A poster with a rather obscene image, below the image says 'Bored ? Lonely ? Senile ? Join the pleasure club!',the location of said club seems to have been ripped off."
	icon_state = "obscene6"

/obj/structure/sign/poster/poster2
	name = "\improper guild recruitment ad"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "Your average guild recruitment ad, possibly some pilgrim got paid to put this here."
	icon_state = "guild"

/obj/structure/sign/poster/poster3
	name = "\improper BEWARE"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A poster warning the common Imperial citizen to beware the mutant, the heretic and the alien."
	icon_state = "poster_secure"

/obj/structure/sign/poster/poster4
	name = "\improper paradise world"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A poster depicting a crystal clear beach in some paradise world, too bad only a few lucky heroes or nobles got the chance to live in one."
	icon_state = "beach"

/obj/structure/sign/poster/poster5
	name = "\improper seek the knowledge"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "'JUST AS PLANNED' is the slogan this poster has aswell as an invitation that seems to be a glibberish of symbols and words you dont understand."
	icon_state = "knowledge"

/obj/structure/sign/poster/poster6
	name = "\improper religious ad"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "An ad that explains that if you do not go to your nearest imperial church at least 84 hours per week, you may be considered an heretic."
	icon_state = "poster_religion"

/obj/structure/sign/poster/poster7
	name = "\improper WHITESHIELD 'ENLIST TODAY!'"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "An ad for recruitment, it says that the imperium always is accepting recruits for the imperial guard, starting as white shields though."
	icon_state = "poster_shield"

/obj/structure/sign/poster/poster8
	name = "\improper mutant ad"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A hideous fucking animal and the warning of an inquisitor that states 'Mutants do NOT deserve to live, burn them with righteous fire'."
	icon_state = "ugly"

// Portraits

/obj/structure/sign/portrait_antonio
	name = "\improper Previous Planetary Governor Portrait"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A portrait of someone you dont know, the initials of a name are written 'Antonio M.'"
	icon_state = "antonio"

/obj/structure/sign/portrait_getulio
	name = "\improper Previous Planetary Governor Portrait"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A portrait of someone you dont know, the initials of a name are written 'Getulio C.'"
	icon_state = "getulio"

/obj/structure/sign/portrait_irineu
	name = "\improper Previous Planetary Governor Portrait"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A portrait of someone you dont know, the initials of a name are written 'Irineu A.'"
	icon_state = "irineu"

/obj/structure/sign/portrait_hippocrates
	name = "\improper Previous Planetary Governor Portrait"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A portrait of someone you dont know, the initials of a name are written 'Hippocrates D.'"
	icon_state = "hippocrates"

/obj/structure/sign/banner_count
	name = "\improper House Banner"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "The banner of some possible important house in Elipharius.'"
	icon_state = "count"

/obj/structure/sign/banner_count/flag
	name = "\improper House Flag"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "The banner of some possible important house in Elipharius.'"
	icon_state = "flag_count"

// Library Signs

/obj/structure/sign/library
	name = "\improper Deeds Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books with human deeds."
	icon_state = "deeds"

/obj/structure/sign/library/history
	name = "\improper History Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about the limited history of the Imperium."
	icon_state = "history"

/obj/structure/sign/library/tales
	name = "\improper Tales Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about tales, although most seem to be made up entirely."
	icon_state = "tales"

/obj/structure/sign/library/places
	name = "\improper Places Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about planets and places you'll never be able to go, peasant."
	icon_state = "places"

/obj/structure/sign/library/learn
	name = "\improper Learn Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books that will teach you how to make an Imperial pipebomb."
	icon_state = "learn"

/obj/structure/sign/library/humor
	name = "\improper Humor Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about humor, dark, light, it does not matter.."
	icon_state = "humor"

/obj/structure/sign/library/terror
	name = "\improper Terror Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about horror tales, and histories, aswell as some creatures in hives and in the Imperium, spooky."
	icon_state = "terror"

/obj/structure/sign/library/other
	name = "\improper Other Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about...something."
	icon_state = "other"

/obj/structure/sign/library/stories
	name = "\improper Stories Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about stories, they seem to be updated quite frequently."
	icon_state = "stories"

/obj/structure/sign/library/poetry
	name = "\improper Poetry Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "A library section with books about one of the oldest arts in human history, too bad nearly nobody reads these nowadays."
	icon_state = "poetry"

/obj/structure/sign/library/weird
	name = "\improper Unknown Section"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	desc = "This section seems to be missing the words.. the books seem to be very old and covered in odd leathers and materials you've never seen, best not to touch any here."
	icon_state = "weird"

/obj/structure/sign/circus
	name = "\improper Circus Advertisement"
	icon = 'icons/map_project/circus.dmi'
	desc = "An old circus propaganda poster.. what the hell is it doing down here ?."
	icon_state = "qw1"