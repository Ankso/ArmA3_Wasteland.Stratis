// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, [GoT] JoSchaap, MercyfulFate, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

diag_log "WASTELAND SERVER - Initializing Server Vars";

#include "setupServerPVars.sqf"

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Quadbike_01_F",
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"C_Offroad_01_F",
	"C_Offroad_01_F",
	"C_Van_01_box_F",
	"C_Van_01_transport_F"
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"I_MRAP_03_F",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F",
	"B_G_Offroad_01_F",
	"B_MRAP_01_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_transport_F"
	
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
    "B_G_Offroad_01_armed_F"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_police_F",
	"C_Boat_Civil_01_rescue_F",
	"I_Boat_Transport_01_F",
	"O_Lifeboat"
];

//Object List - Random Spawns.
objectList =
[
	"B_supplyCrate_F",
	"B_supplyCrate_F",
	"CamoNet_INDP_open_F",
	"CamoNet_INDP_open_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagBunker_Tower_F",
	"Land_BarGate_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall4_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall6_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
//	"Land_Mil_WallBig_4m_F",
	"Land_Pipes_large_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	"Land_Sacks_goods_F",
	"Land_Shoot_House_Wall_F",
	"Land_BarrelWater_F"
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"B_Heli_Light_01_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_unarmed_F",
	"I_Heli_Transport_02_F",
	"C_Heli_Light_01_civil_F"
];

//Object List - Random Planes.
staticPlaneList =
[
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F",
	"I_Plane_Fighter_03_CAS_F",
	"I_Plane_Fighter_03_AA_F"
];

//Random Weapon List - Change this to what you want to spawn in cars
vehicleWeapons =
[
    // -- Handguns --
 	"hgun_P07_F",
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_PDW2000_F",
	"CUP_hgun_Colt1911",
	"CUP_hgun_Compact",
	"CUP_hgun_Duty_M3X",
	"CUP_hgun_Glock17",
	"CUP_hgun_M9",
	"CUP_hgun_MicroUzi",
	"CUP_hgun_Phantom",
	"CUP_hgun_Phantom_Flashlight_snds",
	"CUP_hgun_TaurusTracker455",
	"CUP_hgun_SA61",
	
	// -- SMGs --
	"CUP_smg_bizon",
	"CUP_smg_MP5A5",
	
	// -- Assault Rifles --
	"CUP_arifle_AKM",
	"CUP_arifle_AKM",
	"CUP_arifle_AKM",
	"CUP_arifle_AKM",
	"CUP_arifle_AKS",
	"CUP_arifle_AKM",
	"CUP_arifle_AKS",
	"CUP_arifle_AKM",
	"CUP_arifle_AKS",
	"CUP_arifle_AKS74U",
	"CUP_arifle_AK74",
	"CUP_arifle_AKS74U",
	"CUP_arifle_AK74",
	"CUP_srifle_LeeEnfield",
	"CUP_srifle_LeeEnfield",
	"CUP_arifle_M16A2",
	"CUP_arifle_M4A1",
	"CUP_arifle_M16A4_Base",
	"CUP_arifle_Sa58P",
	"CUP_arifle_Sa58V",
	"CUP_arifle_AKS_Gold",
	
	// -- Sniper Rifles --
	"CUP_srifle_SVD",
	
	// -- Shotguns --
	"CUP_sgun_M1014",
	
	// -- Grenade launchers --
	"CUP_glaunch_M79"
];

vehicleWeaponsMilitary =
[
    // -- SMGs --
    "SMG_01_F",
	"SMG_02_F",
	"CUP_smg_MP5SD6",
	"CUP_smg_EVO",
	
	// -- Assault Rifles --
	"CUP_arifle_G36C",
	"CUP_arifle_G36C_camo",
	"CUP_arifle_CZ805_A1",
	"CUP_arifle_XM8_Compact_Rail",
	"CUP_arifle_XM8_Railed",
	"CUP_arifle_L85A2",
	"CUP_arifle_FNFAL",
	"CUP_arifle_M4A1_camo",
	
	// -- Machine guns --
	"CUP_arifle_RPK74",
	
	// -- Sniper Rifles --
	"CUP_srifle_M24_des",
	"CUP_srifle_M24_wdl",
	"CUP_srifle_CZ550",
	"CUP_srifle_SVD_des",
	"CUP_srifle_M14",
	"CUP_srifle_VSSVintorez",
	
	// -- Shotguns --
	"CUP_sgun_Saiga12K",
	
	// -- Rocket Launchers --
	"CUP_launch_RPG7V",
	"CUP_launch_9K32Strela",
	
	// -- Special/Others --
	"arifle_SDAR_F"
];

vehicleAddition =
[
    // -- Suppressors --
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"CUP_muzzle_PBS4",
	"CUP_muzzle_PB6P9",
	"CUP_muzzle_Bizon",
	"CUP_muzzle_snds_M9",
	
	// -- Optics --
	"optic_Holosight",
	"CUP_optic_Eotech533",
	"CUP_optic_Kobra",
    "CUP_optic_CompM4",
	"CUP_optic_PechenegScope",
	
	// -- Others --
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_pointer_IR",
	"CUP_acc_ANPEQ_2",
	"CUP_acc_ANPEQ_15",
	"Medikit",
	"Medikit",
	"Medikit",
	"Medikit",
	"Medikit",
	"Medikit",
	"FirstAidKit",
	"ToolKit"
];

vehicleAdditionMilitary =
[
    // -- Suppressors --
    "CUP_muzzle_snds_G36_black",
	"CUP_muzzle_snds_L85",
	"CUP_muzzle_snds_M16",
	"CUP_muzzle_snds_M16_camo",
	"CUP_muzzle_snds_XM8",
	"CUP_muzzle_snds_M14",
	
    // -- Optics --
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"CUP_optic_HoloBlack",
	"CUP_optic_Eotech533",
	"CUP_optic_CompM4",
	"CUP_optic_CompM2_Black",
	"CUP_optic_TrijiconRx01_black",
	"CUP_optic_CompM2_Woodland2",
	"CUP_optic_CompM2_Desert",
	
    // -- Scopes --
	"CUP_optic_PSO_1",
	"CUP_optic_PSO_1",
	"CUP_optic_ACOG",
	
    // -- Others --
    "FirstAidKit",
	"ToolKit",
    "Medikit",
    "NVGoggles" // Very rare
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red",
	"HandGrenade",
	"MiniGrenade",
	"CUP_1Rnd_HE_M203",
	"CUP_1Rnd_HEDP_M203",
	"CUP_FlareWhite_M203",
	"CUP_FlareRed_M203",
	"CUP_1Rnd_Smoke_M203",
	"CUP_1Rnd_SmokeRed_M203",
	"CUP_1Rnd_SmokeGreen_M203",
	"CUP_1Rnd_SmokeYellow_M203",
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellOrange",
	"SmokeShellBlue",
	"HandGrenade"
];
