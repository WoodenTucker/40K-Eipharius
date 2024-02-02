/obj/item/organ/external/chest/zombie
	name = "rotting upper body"
	organ_tag = BP_CHEST
	icon_name = "torso"
	max_damage = 180
	min_broken_damage = 35
	w_class = ITEM_SIZE_HUGE //Used for dismembering thresholds, in addition to storage. Humans are w_class 6, so it makes sense that chest is w_class 5.
	body_part = UPPER_TORSO
	vital = 1
	amputation_point = "spine"
	joint = "neck"
	dislocated = -1
	gendered_icon = 1
	cannot_amputate = 1
	parent_organ = null
	encased = "ribcage"
	artery_name = null
	cavity_name = null
  arterial_bleed_severity = 0

/obj/item/organ/external/groin/zombie
	name = "lower body"
	organ_tag = BP_GROIN
	icon_name = "groin"
	max_damage = 100
	min_broken_damage = 35
	w_class = ITEM_SIZE_LARGE
	body_part = LOWER_TORSO
	vital = TRUE
	parent_organ = BP_CHEST
	amputation_point = "lumbar"
	joint = "hip"
	dislocated = -1
	cannot_amputate = TRUE
	gendered_icon = 1
	artery_name = "iliac artery"
	cavity_name = "abdominal"
  arterial_bleed_severity = 0

/obj/item/organ/external/arm/zombie
	organ_tag = BP_L_ARM
	name = "left arm"
	icon_name = "l_arm"
	max_damage = 80
	min_broken_damage = 30
	w_class = ITEM_SIZE_NORMAL
	body_part = ARM_LEFT
	parent_organ = BP_CHEST
	joint = "left elbow"
	amputation_point = "left shoulder"
	can_grasp = 1
	has_tendon = TRUE
	tendon_name = "palmaris longus tendon"
	artery_name = "basilic vein"
	arterial_bleed_severity = 0
	gibbable = TRUE
 
 /obj/item/organ/external/arm/right
	organ_tag = BP_R_ARM
	name = "right arm"
	icon_name = "r_arm"
	body_part = ARM_RIGHT
  max_damage = 80
	joint = "right elbow"
	amputation_point = "right shoulder"
  arterial_bleed_severity = 0

/obj/item/organ/external/leg/zombie
	organ_tag = BP_L_LEG
	name = "left leg"
	icon_name = "l_leg"
	max_damage = 140
	min_broken_damage = 50
	w_class = ITEM_SIZE_NORMAL
	body_part = LEG_LEFT
	icon_position = LEFT
	parent_organ = BP_GROIN
	joint = "left knee"
	amputation_point = "left hip"
	can_stand = 1
	has_tendon = TRUE
	tendon_name = "cruciate ligament"
	artery_name = "femoral artery"
	arterial_bleed_severity = 0
	gibbable = TRUE

/obj/item/organ/external/leg/right/zombie
	organ_tag = BP_R_LEG
	name = "right leg"
	icon_name = "r_leg"
  max_damage = 140
	body_part = LEG_RIGHT
	icon_position = RIGHT
	joint = "right knee"
	amputation_point = "right hip"
  arterial_bleed_severity = 0

/obj/item/organ/external/foot/zombie
	organ_tag = BP_L_FOOT
	name = "left foot"
	icon_name = "l_foot"
	max_damage = 100
	min_broken_damage = 50
	w_class = ITEM_SIZE_SMALL
	body_part = FOOT_LEFT
	icon_position = LEFT
	parent_organ = BP_L_LEG
	joint = "left ankle"
	amputation_point = "left ankle"
	can_stand = 1
	has_tendon = TRUE
	tendon_name = "Achilles tendon"
	arterial_bleed_severity = 0
	gibbable = TRUE

/obj/item/organ/external/foot/right/zombie
	organ_tag = BP_R_FOOT
	name = "right foot"
	icon_name = "r_foot"
	body_part = FOOT_RIGHT
	icon_position = RIGHT
	parent_organ = BP_R_LEG
	joint = "right ankle"
	amputation_point = "right ankle"
  arterial_bleed_severity = 0

/obj/item/organ/external/hand/zombie
	organ_tag = BP_L_HAND
	name = "left hand"
	icon_name = "l_hand"
	max_damage = 100
	min_broken_damage = 50
	w_class = ITEM_SIZE_SMALL
	body_part = HAND_LEFT
	parent_organ = BP_L_ARM
	joint = "left wrist"
	amputation_point = "left wrist"
	can_grasp = 1
	has_tendon = TRUE
	tendon_name = "carpal ligament"
	arterial_bleed_severity = 0
	gibbable = TRUE

/obj/item/organ/external/hand/right/zombie
	organ_tag = BP_R_HAND
	name = "right hand"
	icon_name = "r_hand"
	body_part = HAND_RIGHT
	parent_organ = BP_R_ARM
	joint = "right wrist"
	amputation_point = "right wrist"
  arterial_bleed_severity = 0
