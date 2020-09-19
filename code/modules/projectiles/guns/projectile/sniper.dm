/obj/item/gun/projectile/heavysniper
	name = "anti-materiel rifle"
	desc = "A portable anti-armor rifle fitted with a scope, the PTR-7 is capable of punching through windows and non-reinforced walls with ease. Fires armor piercing 14.5mm shells."
	desc_info = "This is a ballistic weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  The gun's chamber can be opened or closed by using it in your hand.  To reload, open the chamber, add a new bullet \
	then close it.  To use the scope, use the appropriate verb in the object tab."
	icon = 'icons/obj/guns/heavysniper.dmi'
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	caliber = "14.5mm"
	recoil = 4 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/a145
	//+2 accuracy over the LWAP because only one shot
	accuracy = -3
	scoped_accuracy = 4
	var/bolt_open = 0
	var/has_scope = TRUE

	is_wieldable = TRUE

	fire_sound = 'sound/weapons/gunshot/gunshot_dmr.ogg'

	recoil_wielded = 2
	accuracy_wielded = -1

/obj/item/gun/projectile/heavysniper/update_icon()
	if(bolt_open)
		icon_state = "heavysniper-open"
	else
		icon_state = "heavysniper"
	if(wielded)
		item_state = "heavysniper-wielded"
	else
		item_state = "heavysniper"
	update_held_icon()

/obj/item/gun/projectile/heavysniper/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src.loc, 'sound/weapons/blade_open.ogg', 50, 1)
		if(chambered)
			to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			chambered.forceMove(get_turf(src))
			loaded -= chambered
			chambered = null
		else
			to_chat(user, "<span class='notice'>You work the bolt open.</span>")
	else
		to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
		playsound(src.loc, 'sound/weapons/blade_close.ogg', 50, 1)
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/heavysniper/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	if(!wielded)
		to_chat(user, "<span class='warning'>You can't fire without stabilizing the rifle!</span>")
		return 0
	return ..()

/obj/item/gun/projectile/heavysniper/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/heavysniper/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/heavysniper/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	if(!has_scope)
		to_chat(usr, SPAN_WARNING("\The [src] doesn't have a scope!"))
		return

	if(wielded)
		toggle_scope(2.0, usr)
	else
		to_chat(usr, "<span class='warning'>You can't look through the scope without stabilizing the rifle!</span>")

/obj/item/gun/projectile/heavysniper/unathi
	name = "hegemony slugger"
	desc = "An incredibly large firearm, produced by an Ouerean Guild. Uses custom slugger rounds."
	icon = 'icons/obj/guns/unathi_slugger.dmi'
	icon_state = "slugger"
	item_state = "slugger"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)
	w_class = ITEMSIZE_HUGE
	fire_sound = 'sound/effects/Explosion1.ogg'
	caliber = "slugger"
	ammo_type = /obj/item/ammo_casing/slugger
	magazine_type = null
	has_scope = FALSE

/obj/item/gun/projectile/heavysniper/unathi/update_icon()
	if(bolt_open && length(loaded))
		icon_state = "slugger-open-loaded"
	else if(bolt_open && !length(loaded))
		icon_state = "slugger-open"
	else
		icon_state = "slugger"
	if(wielded)
		item_state = "slugger-wielded"
	else
		item_state = "slugger"
	update_held_icon()

/obj/item/gun/projectile/heavysniper/unathi/handle_post_fire(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/has_online_rig = H.wearing_rig && !H.wearing_rig.offline
		if(H.mob_size < 10 && !has_online_rig) // smaller than an unathi
			H.visible_message(SPAN_WARNING("\The [src] goes flying out of \the [H]'s hand!"), SPAN_WARNING("\The [src] flies out of your hand!"))
			H.drop_item(src)
			src.throw_at(get_edge_target_turf(src, reverse_dir[H.dir]), 3, 3)

			var/obj/item/organ/external/LH = H.get_organ(BP_L_HAND)
			var/obj/item/organ/external/RH = H.get_organ(BP_R_HAND)
			var/active_hand = H.hand

			if(active_hand)
				LH.take_damage(30)
			else
				RH.take_damage(30)

/obj/item/gun/projectile/heavysniper/unathi/get_ammo()
	if(chambered)
		return TRUE
	return FALSE

/obj/item/gun/projectile/heavysniper/tranq
	name = "tranquilizer rifle"
	desc = "A nonlethal modification to the PTR-7 anti-materiel rifle meant for sedation and capture of the most dangerous of game. Fires .50 cal PPS shells that deploy a torpor inducing drug payload."
	icon = 'icons/obj/guns/tranqsniper.dmi'
	icon_state = "tranqsniper"
	item_state = "tranqsniper"
	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	caliber = "PPS"
	recoil = 1
	silenced = 1
	fire_sound = 'sound/weapons/gunshot/gunshot_light.ogg'
	max_shells = 4
	ammo_type = null
	accuracy = -3
	scoped_accuracy = 4
	bolt_open = 0
	muzzle_flash = 1

	recoil_wielded = 1
	accuracy_wielded = 2

/obj/item/gun/projectile/heavysniper/tranq/update_icon()
	if(bolt_open)
		icon_state = "tranqsniper-open"
	else
		icon_state = "tranqsniper"
	if(wielded)
		item_state = "tranqsniper-wielded"
	else
		item_state = "tranqsniper"
	update_held_icon()

/obj/item/gun/projectile/dragunov
	name = "marksman rifle"
	desc = "A semi-automatic marksman rifle. Uses 7.62mm rounds."
	icon = 'icons/obj/guns/dragunov.dmi'
	icon_state = "dragunov"
	item_state = "dragunov"

	desc_fluff = "The Ho'taki Marksman Rifle was created by the Shastar Technical University, created through the reverse engineering of captured Tsarrayut’yan rifle. \
	The rifle issued to the feared Das’nrra Marksmen."

	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ILLEGAL = 5)
	caliber = "a762"
	recoil = 2
	fire_sound = 'sound/weapons/gunshot/gunshot_svd.ogg'
	load_method = MAGAZINE
	max_shells = 10

	magazine_type = /obj/item/ammo_magazine/d762
	allowed_magazines = list(/obj/item/ammo_magazine/d762)

	accuracy = -4
	scoped_accuracy = 3

	is_wieldable = TRUE

	recoil_wielded = 1
	accuracy_wielded = 1

/obj/item/gun/projectile/dragunov/update_icon()

	if(ammo_magazine)
		icon_state = "dragunov"
	else
		icon_state = "dragunov-empty"

	if(wielded)
		item_state = "dragunov-wielded"
	else
		item_state = "dragunov"

	update_held_icon()

/obj/item/gun/projectile/dragunov/special_check(mob/user)
	if(!wielded)
		to_chat(user, "<span class='warning'>You can't fire without stabilizing the rifle!</span>")
		return 0
	return ..()

/obj/item/gun/projectile/dragunov/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	if(wielded)
		toggle_scope(2.0, usr)
	else
		to_chat(usr, "<span class='warning'>You can't look through the scope without stabilizing the rifle!</span>")

/obj/item/gun/projectile/automatic/rifle/w556
	name = "scout rifle"
	desc = "A lightweight Neyland 556mi 'Ranger' used within the Sol Navy and Nanotrasen Emergency Response Teams. Equipped with a scope and designed for medium to long range combat, with moderate stopping power. Chambered in 5.56 rounds."
	icon = 'icons/obj/guns/w556.dmi'
	icon_state = "w556rifle"
	item_state = "w556rifle"
	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	caliber = "a556"
	recoil = 4
	load_method = MAGAZINE
	fire_sound = 'sound/weapons/gunshot/gunshot_dmr.ogg'
	max_shells = 10
	ammo_type = /obj/item/ammo_casing/a556/ap
	magazine_type = /obj/item/ammo_magazine/a556/ap
	allowed_magazines = list(/obj/item/ammo_magazine/a556, /obj/item/ammo_magazine/a556/ap)
	accuracy = -4
	scoped_accuracy = 3
	recoil_wielded = 2
	accuracy_wielded = 1
	multi_aim = 0 //Definitely a fuck no. Being able to target one person at this range is plenty.

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="2-round bursts", burst=2, burst_accuracy=list(0,-1,-1), dispersion=list(0, 8))
		)

/obj/item/gun/projectile/automatic/rifle/w556/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	if(wielded)
		toggle_scope(2.0, usr)
	else
		to_chat(usr, "<span class='warning'>You can't look through the scope without stabilizing the rifle!</span>")

/obj/item/gun/projectile/automatic/rifle/w556/update_icon()
	if(wielded)
		item_state = "w556rifle-wielded"
	else
		item_state = "w556rifle"
	update_held_icon()
