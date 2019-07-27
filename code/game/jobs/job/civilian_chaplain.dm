//Due to how large this one is it gets its own file
/datum/job/chaplain
	title = "Chaplain"
	flag = CHAPLAIN
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	access = list(access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	minimal_access = list(access_morgue, access_chapel_office, access_crematorium)
	alt_titles = list("Presbyter","Rabbi","Imam","Priest","Shaman","Counselor")
	outfit = /datum/outfit/job/chaplain

/datum/outfit/job/chaplain
	name = "Chaplain"
	jobtype = /datum/job/chaplain
	uniform = /obj/item/clothing/under/rank/chaplain
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset/headset_service
	pda = /obj/item/device/pda/chaplain

/datum/outfit/job/chaplain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	if(visualsOnly)
		return

	var/obj/item/weapon/storage/bible/B = new /obj/item/weapon/storage/bible(get_turf(H)) //BS12 EDIT
	var/obj/item/weapon/storage/S = locate() in H.contents
	if(S && istype(S))
		B.forceMove(S)

	for(var/religion in subtypesof(/datum/religion))
		var/datum/religion/picked_religion = new religion
		if (picked_religion.name == H.religion)
			var/datum/religion/C = picked_religion

			if(C.name == "None" || "Other")
				B.verbs += /obj/item/weapon/storage/bible/proc/Set_Religion
				return 1

			B.icon_state = C.book_sprite
			B.name = C.book_name
			B.deity_name = C.get_gods_name()
			SSticker.Bible_icon_state = C.book_sprite
			SSticker.Bible_item_state = C.book_sprite
			SSticker.Bible_name = C.book_name
			return 1