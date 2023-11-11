/mob/proc/defaultRitualSuccess(var/mob/ritual_leader)
	to_chat(ritual_leader, "We did it boys, we did the ritual!")


/proc/preservationSuccess(var/mob/ritual_leader)
	var/area/cadiaoutpost/oa/service/chapel/C = get_area(ritual_leader)
	C.consecrated = TRUE //marks the chapel area as consecrated, this will make heretics unable to stand being in it for long


	var/i
	for(i=1, i<= ritual_leader.active_ritual.ritualists.len, i++)
		to_chat(ritual_leader.active_ritual.ritualists[i], "<span class='flick-holy'>+ He heard us.. +</span>")



/mob/proc/invokeSuccess(var/mob/ritual_leader)
//This is a redundant loop, the extra requirement check that is similar exists to show an example of how to use the attribute

	for(var/mob/living/carbon/M in view(6, ritual_leader))
		if(/datum/reagent/water/holywater in M.chem_doses)
			M.happiness -= 5 //Getting the exorcist treatment doesn't feel great
			if(M.faction == "Chaos")
				//Each ritualist adds a 10% chance for the ritual to reveal a bad goy
				if(prob((ritual_leader.active_ritual.ritualists.len * 10)))
					M.spookyMoves() // if this procs the bad boy interogee will do some spooky exorcist floating



/mob/proc/spookyMoves()
	var/mob/living/carbon/human/target = src
	var/default_pixel_x = 0
	var/default_pixel_y = 0
	visible_message("[target.name] begins to t̥͔̻̤͙͍̤̳̬͉̣̖̝̖͔̮͖̩̤͙̪͖̦̭̪̬͙͎̟̮̘̩͉̼͎̹ͣ̅͊̒w͔͍̪̘͚͇̫̩̫̿̾͒͐ͮ͐̿̔̈̀͐̏͛̽̔ͭ̐ͅỉ̬͙̼̪̗̘̰͚̠̙̟͎͍̹̮̯̬̭̙͖͉̬̼͖̻̦͓̯͙̪̜̩͈̺͇͈̰̌̄̈ͩ̊̉ͩ͑ͬͫͬ̆̋̐́͊ͨ̾̋ͪͨͪͭ̾̈ͩͪͣ̆̿̄ͅͅt̖̜̮͔̲̘̩̓̉̽̈ͦ̓̑ͨ͒̊̾̓ͬ͑͑̌ͭͯͪ̀̎̌ͪ͑ͧ̏̑͆̇͛̚̚ͅc̹̳̼̤̬͍̟̲̰̣̲̤͇̣̫̩̥̭̥̭͓̜̯̟̯͕̩͕͚̘̮̙̬͚̜̣̈́ͧ̑͂̂͒̾̃̅͛ͤͧ̏ͣ̌̉͋̒̉͋̋̽ͬͬ̀̍̏ͤͥͅḧ̼̻̦͖̭́ͦ̈̆ͬͯ̌̽͊ ͍̱͇̗͔͔̳̪͉͓͕̫̪̙̞̣̺̩̫̤̲͈̺̞͇̥̪͙͔̲̞̞͕ͪͤ̒̽ͤ̊̀͆̄͐͑͂̇a͙̼̤͈̰̝̩̥̺͙̞̤͇̜͊̈̽̂ͧ̔͆̑͐͑̍ͧ̒ͣͭ̃̎̈́͒ͯͫͧͪ͐̐̇̍ͤͥͬ̔́ͧ̉̑͊͐̋̽̚n̙͚̯̘̪͔̹̮̔ͬͨ̈́͑ͫ͐ͭͭ͆ͩ̆ͧͥ̚ḍ̝̮̞͇̼͔͈̫̫̦̦̠̞̟̩̏ͥ̄̊̅̄͛ͬ͒ͥ͆̉̃ͮ̉͒̎͋ͅ ̬̭̻͉͓̣̖͉͇̘͓̼̮̗̰̖͙̩̳l̗͉͖̬̦̟̰̦͔̜̬̳̜̠̠͈̜̺̝̠̙̻̠͕̎̀ͯ͌̏ͪ̒̇̊͊ͩͯͪ͋̄ͭ͛͛ͅe͎̮̖̣̬̬̹̦͌̆̃͆ͤͅv̻̣̭̼̖̪̥͇͔̮̱͈̲̱̫͔͔͔̦̹̖̳̩̳̖̣͉̯͈̑ͧ́̎̿ͅͅͅi̦̘̳̫̘̺̱͙̘̓ͩ̒̓͋͌́̊́̇ͯ̈́̽͗͂̊̿̋ͥ̃̇̿̄ͦͧͩͪͤͨͅt͇̯͍̲̯̺̜̞̖̬̳̹̤͕̎̀͑̐̈ͧͭ̃ͥ̇̌ͪ̋͋̔̈́̾̔ͦͩ̋̆ͧ̌̿͗̑̈͛ͬ̽̒̉͛ͤ̋́̚̚a͉̩̣͉̹̙͇̖͈͎͈̘̺͎̪͙͔̩̬̤̮̟͈̜̻͙̩̥̩̪͔̪̩̒ͭͣ́ͭ͋̑̿ͦ̄͊̌̃ͬͤͮ̏ͬͅț̮̘͙̪͈̳̖͉͓̦̤͇̣̯͚̗̲̻̤͉̦̮̼̣͙̗̯̹̜͈̼̓̔̆̍ͥͪ͌ͤ̾̓ͯͣ̆ͣͭ̅ͣ̒̒ͨͤͪ̓ͪ̐ͬ̍̿̂̏ͦ̄͑̉̚̚ͅe̺̣̗̬̬̜̓̏ͪ͒̈ͭ͆̾͑̍̅ͪͮͭ̓̀̄͗ͬ̊̀͌͋̐ͧͪ̿̐͊̾̿͑̉̒̈́̀̽̌̅̚̚")






	playsound(get_turf(target), 'sound/effects/pig_squeal.ogg', 95, 5)


	var/i
	for(i=1,i<=20,i++)
		if(target.buckled == null)
			target.pixel_x += (i + 4.5)
			target.pixel_y += (i + 4.5)//less moves when not in a chair, it looks a little too wonky
			sleep(3)
			target.pixel_x = default_pixel_x
			target.pixel_y = default_pixel_y
		else
			var/obj/structure/buckle_obj = target.buckled
			target.pixel_x  += (i + 4.5)
			target.pixel_y  += (i + 4.5) //less moves when not in a chair, it looks a little too wonky
			buckle_obj.pixel_x  += (i + 4.5)
			buckle_obj.pixel_y  += (i + 4.5)
			sleep(3)
			target.pixel_x = default_pixel_x
			target.pixel_y = default_pixel_y
			buckle_obj.pixel_x = default_pixel_x
			buckle_obj.pixel_y = default_pixel_y

