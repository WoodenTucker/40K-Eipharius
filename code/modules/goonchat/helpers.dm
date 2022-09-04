GLOBAL_VAR_INIT(TAB, "&nbsp;&nbsp;&nbsp;&nbsp;")

GLOBAL_LIST_INIT(symbols_unicode_keys, list(
	"‚" = "&#x201A;",
	"„" = "&#x201E;",
	"…" = "&#x2026;",
	"†" = "&#x2020;",
	"‡" = "&#x2021;",
	"‰" = "&#x2030;",
	"‹" = "&#x2039;",
	"‘" = "&#x2018;",
	"’" = "&#x2019;",
	"“" = "&#x201C;",
	"”" = "&#x201D;",
	"•" = "&#x2022;",
	"–" = "&#x2013;",
	"—" = "&#x2014;",
	"™" = "&#x2122;"
))
/proc/symbols_to_unicode(text)
	for(var/key in GLOB.symbols_unicode_keys)
		text = replacetext(text, key, GLOB.symbols_unicode_keys[key])
	return text

/proc/color_macro_to_html(text)
	text = replacetext(text,"\red","<span class='red'>")
	text = replacetext(text,"\blue","<span class='blue'>")
	text = replacetext(text,"\green","<span class='green'>")
	return text


//Converts an icon to base64. Operates by putting the icon in the iconCache savefile,
// exporting it as text, and then parsing the base64 from that.
// (This relies on byond automatically storing icons in savefiles as base64)
/proc/icon2base64(icon/icon, iconKey = "misc")
	if (!isicon(icon))
		return FALSE
	WRITE_FILE(GLOB.iconCache[iconKey], icon)
	var/iconData = GLOB.iconCache.ExportText(iconKey)
	var/list/partial = splittext(iconData, "{")
	return replacetext(copytext(partial[2], 3, -5), "\n", "")

/proc/icon2base64html(thing)
	if (!thing)
		return
	var/static/list/bicon_cache = list()
	if (isicon(thing))
		var/icon/I = thing
		var/icon_base64 = icon2base64(I)

		if (I.Height() > world.icon_size || I.Width() > world.icon_size)
			var/icon_md5 = md5(icon_base64)
			icon_base64 = bicon_cache[icon_md5]
			if (!icon_base64) // Doesn't exist yet, make it.
				bicon_cache[icon_md5] = icon_base64 = icon2base64(I)


		return "<img class='icon icon-misc' src='data:image/png;base64,[icon_base64]'>"

	// Either an atom or somebody fucked up and is gonna get a runtime, which I'm fine with.
	var/atom/A = thing
	var/key = "[istype(A.icon, /icon) ? "\ref[A.icon]" : A.icon]:[A.icon_state]"


	if (!bicon_cache[key]) // Doesn't exist, make it.
		var/icon/I = icon(A.icon, A.icon_state, SOUTH, 1)
		if (ishuman(thing)) // Shitty workaround for a BYOND issue.
			var/icon/temp = I
			I = icon()
			I.Insert(temp, dir = SOUTH)

		bicon_cache[key] = icon2base64(I, key)

	return "<img class='icon icon-[A.icon_state]' src='data:image/png;base64,[bicon_cache[key]]'>"

