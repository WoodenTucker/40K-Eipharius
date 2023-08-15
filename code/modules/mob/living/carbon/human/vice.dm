/mob/living/carbon/human/proc/handle_vice()
	if(vice)
	/*
		if(vice == "Parental Instincts") return //They have events that handle their happiness, no timer needed
	*/
		if (viceneed < 0)
			viceneed = 0 //no banking need by afking in da chapel

		if(src.vice == "Piety")
			if(src.loc.loc.name == "Chapel" ) //src loc goes to the tile, need to access the tiles loc
				src.viceneed -= rand(35,45)
				if(prob(5))
					to_chat(src, "<span class='goodmood'>+ I feel at ease here. +</span>\n")

		if(src.vice == "Neat Freak")
			if(sleeping || src.faction == "nurgle") return

			if(src.happiness < -17) //stops them from acquiring infinite sad
				src.happiness = -17

			for(var/obj/effect/decal/cleanable/H in view(3, src))
				if(src.vice == "Neat Freak" && src.faction != "nurgle")
					if(prob(2))
						to_chat(src, "<span class='badmood'>+ Emperor it's filthy here... +</span>\n")
						src.happiness -= 0.2
			for(var/obj/item/reagent_containers/food/snacks/poo/H in view(3, src))
				if(src.vice == "Neat Freak" && src.faction != "nurgle")
					if(prob(2))
						to_chat(src, "<span class='badmood'>+ Emperor it's filthy here... +</span>\n")
						src.happiness -= 0.2
			return

		if(src.vice == "Alcohol" || src.vice == "Obscura")
			if(sleeping) return

			for(var/drug in src.chem_doses)
				if(src.vice == "Alcohol")
					var/textSlice = copytext("[drug]",1,23) //this is incredibly fucking hacky but drug is an associated array and the key is an obj for some fucking reason
					if(textSlice == "/datum/reagent/ethanol")
						src.viceneed -= rand(6,9)
						if(prob(2))
							to_chat(src, "<span class='goodmood'>+ Now I'm buzzing... +</span>\n")
				if(src.vice == "Obscura")
					var/textSlice = copytext("[drug]",1,0) //this is incredibly fucking hacky but drug is an associated array and the key is an obj for some fucking reason
					if(textSlice == "/datum/reagent/space_drugs")
						src.viceneed -= rand(6,9)
						if(prob(2))
							to_chat(src, "<span class='goodmood'>+ I finally feel human again... +</span>\n")




		if(viceneed < 1000 && vice != "Glutton")
			spawn(10)
				viceneed += rand(1,2)
				clear_event("vice")

		else if(viceneed < 1000 && vice == "Glutton" && nutrition < 375)
			spawn(10)
				viceneed += rand(1,2)
				clear_event("vice")

		else if(viceneed <= 1000 && vice == "Glutton" && nutrition >= 375)
			spawn(10)
				viceneed -= rand(3,6)
				clear_event("vice")

	if(viceneed > 1000)
		viceneed = 1000

	if(viceneed >= 450 && viceneed <= 649)
		if(prob(1))
			to_chat(src, "<span class='badmood'>+ The all too familiar itch returns to your mind... +</span>\n")
	else if(viceneed >= 650 && viceneed <= 849)
		if(prob(2))
			to_chat(src, "<span class='badmood'>+ It's getting harder to ignore... +</span>\n")
	else if(viceneed >= 650 && viceneed <= 999)
		if(prob(3))
			to_chat(src, "<span class='badmood'>+ I need to feed my vice... +</span>\n")



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