/datum/job/commander
	title = "Commander"
	flag = COMMANDER
	department = "Imperial Army"
	head_position = TRUE
	department_flag = ADHOMAI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the King"
	selection_color = "#ffdddd"
	req_admin_notify = TRUE
	outfit = /datum/outfit/job/adhomai/military/commander
	species_blacklist = list("Zhan-Khazan Tajara", "M'sai Tajara", HUMAN_SPECIES, UNATHI_SPECIES, SKRELL_SPECIES, VAURCA_SPECIES, DIONA_SPECIES, IPC_SPECIES)
	account_allowed = FALSE

/datum/outfit/job/adhomai/military/commander
	name = "Commander"

	uniform = /obj/item/clothing/under/uniform/hand
	shoes = /obj/item/clothing/shoes/jackboots/unathi
	r_pocket = /obj/item/weapon/key/hand
	l_pocket = /obj/item/weapon/storage/wallet/rich
	back = /obj/item/weapon/storage/backpack/satchel
	gloves = /obj/item/clothing/gloves/brown/tajara
	backpack_contents = list(
		/obj/item/weapon/key/soldier = 1,
		/obj/item/weapon/key/armory = 1,
		/obj/item/weapon/reagent_containers/food/drinks/flask/canteen/adhomian/nka = 1,
		/obj/item/weapon/flame/lighter/adhomian/nka = 1)

/datum/job/supply_officer
	title = "Supply Officer"
	flag = SUPPLYOFFICER
	department = "Imperial Army"
	department_flag = ADHOMAI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commander"
	selection_color = "#ffeeee"
	account_allowed = FALSE

	outfit = /datum/outfit/job/adhomai/military/supply_officer

	species_blacklist = list(HUMAN_SPECIES, UNATHI_SPECIES, SKRELL_SPECIES, VAURCA_SPECIES, DIONA_SPECIES, IPC_SPECIES)

/datum/outfit/job/adhomai/military/supply_officer
	name = "Quatermaster"

	uniform = /obj/item/clothing/under/uniform/supply
	shoes = /obj/item/clothing/shoes/jackboots/unathi
	r_pocket = /obj/item/weapon/key/armory
	l_pocket = /obj/item/weapon/storage/wallet/medium
	belt = /obj/item/weapon/gun/projectile/colt/nka
	backpack_contents = list(
		/obj/item/weapon/key/soldier = 2,
		/obj/item/clothing/accessory/holster/armpit = 1,
		/obj/item/weapon/reagent_containers/food/drinks/flask/canteen/adhomian/nka = 1,
		/obj/item/weapon/flame/lighter/adhomian/nka = 1)

/datum/job/levy
	title = "Levy"
	flag = LEVY
	department = "Imperial Army"
	department_flag = ADHOMAI
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Commander"
	selection_color = "#ffeeee"
	outfit = /datum/outfit/job/adhomai/military
	account_allowed = FALSE

/datum/outfit/job/adhomai/military
	name = "Levy"

	uniform = /obj/item/clothing/under/uniform/levy
	shoes = /obj/item/clothing/shoes/tajara
	head = /obj/item/clothing/head/nka
	r_pocket = /obj/item/weapon/key/soldier
	backpack_contents = list(
		/obj/item/weapon/reagent_containers/food/drinks/flask/canteen/adhomian/nka = 1,
		/obj/item/weapon/flame/lighter/adhomian/nka = 1)

/datum/job/grenadier
	title = "Royal Grenadier"
	flag = GRENADIER
	department = "Imperial Army"
	department_flag = ADHOMAI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Commander"
	selection_color = "#ffeeee"
	outfit = /datum/outfit/job/adhomai/military/grenadier
	species_blacklist = list("Tajara", "M'sai Tajara", HUMAN_SPECIES, UNATHI_SPECIES, SKRELL_SPECIES, VAURCA_SPECIES, DIONA_SPECIES, IPC_SPECIES)

	account_allowed = FALSE

/datum/outfit/job/adhomai/military/grenadier
	name = "Royal Grenadier"
	allow_backbag_choice = FALSE

	uniform = /obj/item/clothing/under/uniform/grenadier
	head = /obj/item/clothing/head/helmet/nka/grenadier
	shoes = /obj/item/clothing/shoes/armored_boots/grenadier
	gloves = /obj/item/clothing/gloves/grenadier/armored
	suit = /obj/item/clothing/suit/armor/nka/grenadier
	back = /obj/item/weapon/storage/backpack/satchel/grenadier
	suit_store = /obj/item/weapon/gun/projectile/grenadier
	l_pocket = /obj/item/weapon/storage/wallet/medium
	belt = /obj/item/weapon/storage/belt/security/tactical/nka
	backpack_contents = list(
		/obj/item/ammo_magazine/boltaction = 2,
		/obj/item/weapon/grenade/frag/nka = 3,
		/obj/item/clothing/accessory/storage/bayonet = 1,
		/obj/item/weapon/reagent_containers/food/drinks/flask/canteen/adhomian/nka = 1,
		/obj/item/weapon/flame/lighter/adhomian/nka = 1)

/datum/job/sharpshooter
	title = "Sharpshooter"
	flag = SHARPSHOOTER
	department = "Imperial Army"
	department_flag = ADHOMAI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Commander"
	selection_color = "#ffeeee"
	outfit = /datum/outfit/job/adhomai/military/sharpshooter
	account_allowed = FALSE

/datum/outfit/job/adhomai/military/sharpshooter
	name = "Sharpshooter"
	allow_backbag_choice = FALSE

	uniform = /obj/item/clothing/under/uniform/sharpshooter
	l_hand = /obj/item/weapon/gun/projectile/shotgun/pump/rifle/nka/scoped
	l_pocket = /obj/item/weapon/storage/wallet/medium
	backpack_contents = list(
		/obj/item/weapon/reagent_containers/food/drinks/flask/canteen/adhomian/nka = 1,
		/obj/item/weapon/flame/lighter/adhomian/nka = 1)

/datum/job/combatengineer
	title = "Combat Engineer"
	flag = COMBATENGINEER
	department = "Imperial Army"
	department_flag = ADHOMAI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Commander"
	selection_color = "#ffeeee"

	outfit = /datum/outfit/job/adhomai/military/combatengineer

	account_allowed = FALSE

/datum/outfit/job/adhomai/military/combatengineer
	name = "Combat Engineer"

	uniform = /obj/item/clothing/under/uniform/combat_engineer
	back = /obj/item/weapon/storage/backpack/satchel/engineer
	l_pocket = /obj/item/weapon/storage/wallet/medium
	belt = /obj/item/weapon/pickaxe/drill/mattock
	backpack_contents = list(
		/obj/item/weapon/landmine = 3,
		/obj/item/weapon/landmine/frag = 2,
		/obj/item/weapon/crowbar = 1,
		/obj/item/device/gps = 1,
		/obj/item/weapon/reagent_containers/food/drinks/flask/canteen/adhomian/nka = 1,
		/obj/item/weapon/flame/lighter/adhomian/nka = 1)