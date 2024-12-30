Config = {}

Config.SpawnZombie = 150
Config.MinSpawnDistance = 100
Config.MaxSpawnDistance = 150
Config.DespawnDistance = 200

Config.ZombieDropLoot = true
Config.ProbabilityWeaponLoot = 5 -- 30% chance for weapons
Config.ProbabilityMoneyLoot = 95  -- 30% chance for money
Config.ProbabilityItemLoot = 95 -- 40% chance for items
-- Weapons: 30%, Money: 30%, Items: 40%
Config.WeaponLoot = {
	'weapon_switchblade',
    'weapon_bottle',
    'weapon_knife',
    'weapon_poolcue',
}
Config.ItemLoot = {
    'bread',
    'lighter',
    'bandage',
    'marlborocig',
    'clothe',
    'fries',
    'cubancigar',
    'beer',
    'water'
}



Config.ObjectDropLoot = false --false if you experience low performance of server
Config.ObjectsLoot = {
}

Config.ProbabilityWeaponLootObject = 10 -- 2%
Config.ProbabilityMoneyLootObject = 50 -- 20% chance for money
Config.ProbabilityItemLootObject = 40 -- 20% chance for items
-- Weapons: 2%, Money: 20%, Items: 20%, Nothing: 58%
Config.WeaponLootObject ={
	"weapon_switchblade",
    "weapon_bottle",
    "weapon_knife",
    "weapon_poolcue"
}
Config.ItemLootObject = {
	'bread',
    'lighter',
    'bandage',
    'marlborocig',
    'clothe',
    'fries',
    'cubancigar',
    'beer',
    'water'
}



Config.NoPeds = true
Config.Blackout = true
Config.MuteAmbience = true
Config.NotHealthRecharge = true
Config.SafeZone = true
Config.SafeZoneRadioBlip = true
Config.SafeZoneCoords = {
	{x = 226.56, y = -1993.84, z = 19.55, radio = 30.0}
}


Config.MilitaryVehicles = {
    "RHINO",        -- Tank
    "BARRACKS",     -- Military Truck
    "CRUSADER",     -- Military Jeep
    "INSURGENT",    -- Armored Vehicle
    "INSURGENT2",   -- Armored Vehicle Pickup
    "INSURGENT3",   -- Armored Vehicle Custom
    "APC",          -- Armored Personnel Carrier
    "HALFTRACK",    -- Half-track
    "HUNTER",       -- Attack Helicopter
    "LAZER",        -- Fighter Jet
    "HYDRA",        -- VTOL Jet
    "KHANJALI",     -- Tank
    "CHERNOBOG",    -- Missile Launcher Truck
    "THRUSTER",     -- Jetpack
    "MENACER",      -- Armored SUV
    "PATRIOT2",     -- Armored SUV
    "TECHNICAL",    -- Technical Pickup
    "TECHNICAL2",   -- Technical Aqua
    "TECHNICAL3",   -- Technical Custom
    "DUNE3",        -- Dune FAV
    "BARRAGE",      -- Weaponized ATV
    "CARACARA",     -- Weaponized Pickup
    "CARACARA2"     -- Weaponized Pickup Custom
}

Config.Debug = false