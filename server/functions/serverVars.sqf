// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, [GoT] JoSchaap, MercyfulFate, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer && hasInterface) exitWith {};

diag_log "WASTELAND SERVER - Initializing Server Vars";

if (isServer) then
{
	#include "setupServerPVars.sqf"
};

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
	"B_MRAP_01_F",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F",
	"B_G_Offroad_01_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_transport_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_F"
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

//Essential List - Random Spawns.
essentialsList =
[
	"B_supplyCrate_F",
	"Land_Sacks_goods_F",
	"Land_BarrelWater_F"
];

//Object List - Random Spawns.
objectList =
[
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
	"Land_Shoot_House_Wall_F"
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
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_PDW2000_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_Pistol_heavy_01_F",
	
	// -- SMGs --
	"SMG_01_F",
	"SMG_02_F",
	
	// -- Assault Rifles --
	"arifle_Mk20_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F"
];

vehicleWeaponsMilitary =
[
    // -- SMGs --
    "SMG_01_F",
	"SMG_02_F",
	"SMG_01_F",
	"SMG_02_F",
	"SMG_01_F",
	"SMG_02_F",
	"SMG_01_F",
	"SMG_02_F",
	"SMG_01_F",
	"SMG_02_F",
	"SMG_01_F",
	"SMG_02_F",
	"SMG_01_F",
	"SMG_02_F",
	
	// -- Assault Rifles --
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20C_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_TRG21_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20C_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_TRG21_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20C_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_TRG21_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20C_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_TRG21_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_TRG21_F",
    
    // -- Assault Rifles (powerful) --
    "arifle_MXC_F",
    "arifle_Katiba_C_F",
    "arifle_Katiba_F",
    "arifle_MX_pointer_F",
    
    // -- MGs --
    "arifle_MX_SW_F",
    
	// -- Sniper Rifles --
	"srifle_DMR_01_F",
	
	// -- Rocket Launchers --
	"launch_RPG32_F"
];

vehicleAddition =
[
    // -- Suppressors --
	"muzzle_snds_L",
	"muzzle_snds_acp",
	
	// -- Optics --
	"optic_Holosight",
	"optic_Holosight_smg",
	"optic_Holosight_smg",
    "optic_Aco",
	"optic_ACO_grn_smg",
	
	// -- Others --
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_flashlight",
	"acc_pointer_IR",
	"acc_pointer_IR",
	"acc_pointer_IR",
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
    "muzzle_snds_acp",
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"muzzle_snds_L",
	"muzzle_snds_M",
	"muzzle_snds_acp",
	"muzzle_snds_L",
	"muzzle_snds_M",
	
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
	"optic_ACO_grn_smg",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"optic_ACO_grn_smg",
	
    // -- Scopes --
	"optic_Hamr",
	
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
	"1Rnd_HE_Grenade_shell",
	"UGL_FlareWhite_F",
	"UGL_FlareGreen_F",
	"UGL_FlareRed_F",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"UGL_FlareCIR_F",
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellOrange",
	"SmokeShellBlue",
	"HandGrenade",
	"ItemGPS",
	"ItemGPS",
	"ItemGPS"
];
