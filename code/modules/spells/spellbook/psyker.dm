//40k Edit: Added in Psyker abilities

/datum/spellbook/psyker
	name = "The Psyker's Primer"
	feedback = "PS"
	desc = "Covered in holy seals."
	book_desc = "Learn the basics of your abilities."
	title = "The Psyker's Primer"
	title_desc = "Buy abilities using your available ability slots."
	book_flags = CAN_MAKE_CONTRACTS|INVESTABLE
	//max_uses = rand (2,6)
	max_uses = 100

	spells = list(/spell/targeted/projectile/dumbfire/passage = 	1,
				/spell/aoe_turf/knock = 							1,
				/spell/targeted/equip_item/shield = 				2,
				/spell/targeted/projectile/dumbfire/fireball = 		2,
				/spell/targeted/torment = 							1,
				/spell/targeted/heal_target = 						2,
				/spell/targeted/genetic/mutate = 					4,
				/spell/aoe_turf/conjure/mirage = 					1,
				/spell/area_teleport = 								2,
				/spell/radiant_aura =								1,
				/spell/targeted/subjugation = 						1,
				/spell/aoe_turf/disable_tech = 						1,
				/spell/aoe_turf/smoke = 							1,
				/spell/hand/charges/blood_shard = 					1,
				/spell/hand/charges/blood_shard/burning = 					1,
				/spell/radiant_aura/psyker = 					1,
				/spell/radiant_aura/psyker/ultimate = 					1,
				/spell/targeted/ethereal_jaunt = 					2
				)
