/obj/item/grenade/dynamite
	name = "dynamite"
	desc = "A bundle of Adhomian dynamite."
	icon_state = "dynamite"
	item_state = "dynamite"
	activation_sound = 'sound/items/flare.ogg'

/obj/item/grenade/dynamite/attack_self(mob/user as mob)
	return

/obj/item/grenade/dynamite/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if(active)
		return
	var/prepared = FALSE
	if(W.iswelder())
		var/obj/item/weldingtool/WT = W
		if(WT.isOn())
			activate(user)
			user.visible_message("<span class='danger'>\The [user] casually lights \the [name] with [W].</span>")
			prepared = TRUE

	else if(isflamesource(W))
		activate(user)
		user.visible_message("<span class='danger'>\The [user] lights \the [name].</span>")
		prepared = TRUE

	else if(istype(W, /obj/item/flame/candle))
		var/obj/item/flame/candle/C = W
		if(C.lit)
			activate(user)
			user.visible_message("<span class='danger'>\The [user] lights \the [name].</span>")
			prepared = TRUE

	else if(istype(W, /obj/item/grenade/dynamite))
		var/obj/item/grenade/dynamite/C = W
		if(C.active)
			activate(user)
			user.visible_message("<span class='danger'>\The [user] lights \the [name].</span>")
			prepared = TRUE

	if(prepared)
		if(iscarbon(user))
			user.swap_hand()
			var/mob/living/carbon/C = user
			C.throw_mode_on()


/obj/item/grenade/dynamite/prime()
	var/turf/O = get_turf(src)
	explosion(O, -1, -1, 3, 4)
	qdel(src)
	return


/obj/item/grenade/dynamite/throw_impact(atom/hit_atom)
	..()
	if(!active)
		if(prob(25))
			prime()

/obj/item/grenade/dynamite/ex_act(var/severity = 2.0)
	if(!active)
		prime()

/obj/item/grenade/dynamite/fire_act()
	if(!active)
		prime()