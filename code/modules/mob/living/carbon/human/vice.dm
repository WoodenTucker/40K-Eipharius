/mob/living/carbon/human/proc/handle_vice()
	if(vice)
		if(vice == "Parental Instincts") return //They have events that handle their happiness, no timer needed

		if(src.vice == "Piety")
			if(src.loc.loc.name == "Chapel") //src loc goes to the tile, need to access the tiles loc
				src.viceneed -= rand(15,25)
				if(prob(5))
					to_chat(src, "<span class='goodmood'>+ I feel at ease here. +</span>\n")

		if(src.vice == "Neat Freak")
			if(sleeping || src.faction == "Nurgle") return

			for(var/obj/effect/decal/cleanable/H in view(5, src))
				if(src.vice == "Neat Freak" && src.faction != "Nurgle")
					if(prob(2))
						to_chat(src, "<span class='badmood'>+ Emperor it's filthy here... +</span>\n")
						src.happiness -= 0.2
			for(var/obj/item/reagent_containers/food/snacks/poo/H in view(5, src))
				if(src.vice == "Neat Freak" && src.faction != "Nurgle")
					if(prob(2))
						to_chat(src, "<span class='badmood'>+ Emperor it's filthy here... +</span>\n")
						src.happiness -= 0.2
			return


		if(viceneed < 1000 && vice != "Glutton")
			spawn(10)
				viceneed += rand(1,3)
				clear_event("vice")

		else if(viceneed < 1000 && vice == "Glutton" && nutrition < 375)
			spawn(10)
				viceneed += rand(1,3)
				clear_event("vice")

		else if(viceneed < 1000 && vice == "Glutton" && nutrition >= 375)
			spawn(10)
				viceneed -= rand(3,6)
				clear_event("vice")

	if(viceneed > 1000)
		viceneed = 1000

	if (viceneed < 0)
		viceneed = 0 //no banking need by afking in da chapel

	if(viceneed >= 1000)
		switch(vice)
			if("Lho")
				add_event("vice", /datum/happiness_event/vice/smoke)
				if(sleeping) return

				if(prob(5))
					to_chat(src, "<br><span class='graytextbold'>⠀+ I need a lho stick. +</span><br>")
			if("Piety")
				add_event("vice", /datum/happiness_event/vice/piety)
				if(sleeping) return

				if(prob(5))
					to_chat(src, "<br><span class='graytextbold'>⠀+ I need to feel closer to Him. +</span><br>")

			if("Alcohol")
				add_event("vice", /datum/happiness_event/vice/alco)
				if(sleeping) return

				if(prob(5))
					to_chat(src, "<br><span class='graytextbold'>⠀+ I need a drink. +</span><br>")
			if("Obscura")
				add_event("vice", /datum/happiness_event/vice/obscura)
				if(sleeping) return

				if(prob(1))
					to_chat(src, "<br><span class='graytextbold'>⠀+ I need another hit of obscura +</span><br>")
			if("Glutton")
				add_event("vice", /datum/happiness_event/vice/glutton)
				if(sleeping) return

				if(prob(1))
					to_chat(src, "<br><span class='graytextbold'>⠀+ I need to eat more, I'm starving! +</span><br>")