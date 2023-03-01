/////////////////////////////////////////
//Material Rings
/obj/item/clothing/ring/material
	icon = 'icons/obj/clothing/rings.dmi'
	icon_state = "material"
	var/material/material

/obj/item/clothing/ring/material/New(var/newloc, var/new_material)
	..(newloc)
	if(!new_material)
		new_material = DEFAULT_WALL_MATERIAL
	material = get_material_by_name(new_material)
	if(!istype(material))
		qdel(src)
		return
	name = "[material.display_name] ring"
	desc = "A ring made from [material.display_name]."
	color = material.icon_colour

/obj/item/clothing/ring/material/get_material()
	return material

/obj/item/clothing/ring/material/wood/New(var/newloc)
	..(newloc, "wood")
	sales_price = 2

/obj/item/clothing/ring/material/plastic/New(var/newloc)
	..(newloc, "plastic")
	sales_price = 1

/obj/item/clothing/ring/material/steel/New(var/newloc)
	..(newloc, "steel")
	sales_price = 1

/obj/item/clothing/ring/material/silver/New(var/newloc)
	..(newloc, "silver")
	sales_price = 6

/obj/item/clothing/ring/material/gold/New(var/newloc)
	..(newloc, "gold")
	sales_price = 12

/obj/item/clothing/ring/material/platinum/New(var/newloc)
	..(newloc, "platinum")
	sales_price = 14

/obj/item/clothing/ring/material/bronze/New(var/newloc)
	..(newloc, "bronze")
	sales_price = 6

/obj/item/clothing/ring/material/glass/New(var/newloc)
	..(newloc, "glass")
