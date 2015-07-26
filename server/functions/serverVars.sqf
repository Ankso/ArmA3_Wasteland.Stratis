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
	"C_Van_01_transport_F",
	"RHS_Uaz_msv_01",
	"rhs_uaz_open_MSV_01",
	"rhs_uaz_open_MSV_01",
	"rhs_gaz66_msv",
	"rhs_gaz66_flat_msv",
	"rhs_gaz66o_flat_msv",
	"RHS_Ural_MSV_01",
	"RHS_Ural_Open_MSV_01",
	"RHS_Ural_Open_Flat_MSV_01"
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
	"rhs_uaz_open_vdv",
	"rhs_uaz_vmf",
	"rhs_gaz66_vv",
	"rhs_gaz66o_vdv",
	"RHS_Ural_VMF_01",
	"RHS_Ural_Open_VDV_01",
	"rhsusf_m1025_w",
	"rhsusf_m1025_d",
	"rhsusf_m1025_w_s",
	"rhsusf_m1025_d_s",
	"rhsusf_M1078A1P2_B_wd_fmtv_usarmy",
	"rhsusf_M1078A1P2_wd_fmtv_usarmy"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
    "B_G_Offroad_01_armed_F",
    "RHS_UAZ_chdkz",
    "rhs_uaz_open_chdkz"
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
	"C_Heli_Light_01_civil_F",
	"RHS_Mi8mt_vvs",
	"RHS_Mi8mt_Cargo_vvs"
];

//Object List - Random Planes.
staticPlaneList =
[
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F",
	"I_Plane_Fighter_03_CAS_F",
	"I_Plane_Fighter_03_AA_F",
	"RHS_Su25SM_vvs",
	"RHS_Su25SM_KH29_vvs",
	"RHS_Su25SM_vvsc",
	"RHS_Su25SM_KH29_vvsc"
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
	"SMG_01_F",
	"SMG_02_F",
	
	// -- Assault Rifles --
	"rhs_weap_akm",
	"rhs_weap_akms",
	"rhs_weap_akm_gp25",
	"rhs_weap_akms_gp25",
	"rhs_weap_m4",
	"rhs_weap_ak74m",
	"rhs_weap_m16a4",
	"rhs_weap_aks74u",
	
	// -- Shotguns --
	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD"
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
	
	// -- Assault Rifles --
	"rhs_weap_m16a4",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m16a4_carryhandle_pmag",
	"rhs_weap_m16a4_bipod",
	"rhs_weap_m16a4_carryhandle_bipod",
	"rhs_weap_m16a4_grip",
	"rhs_weap_m16a4_carryhandle_grip",
	"rhs_weap_m16a4_carryhandle_grip_pmag",
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_m4a1_m320",
	"rhs_weap_m4a1_m203",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_pmag",
	"rhs_weap_m4a1_blockII",
	"rhs_weap_m4a1_blockII_KAC",
	"rhs_weap_m4a1_blockII_grip2",
	"rhs_weap_m4a1_blockII_grip2_KAC",
	"rhs_weap_ak103",
	"rhs_weap_ak103_dtk",
	"rhs_weap_ak103_npz",
	"rhs_weap_ak74m",
	"rhs_weap_ak74m_dtk",
	"rhs_weap_ak74m_camo",
	"rhs_weap_ak74m_npz",
	"rhs_weap_ak74m_desert_npz",
	"rhs_weap_ak74m_folded",
	"rhs_weap_ak74m_camo_folded",
	"rhs_weap_ak74m_desert_folded",
	"rhs_weap_ak74m_plummag_folded",
	"rhs_weap_ak74m_gp25_folded",
	"rhs_weap_ak74m_2mag",
	"rhs_weap_ak74m_2mag_npz",
	"rhs_weap_ak74m_2mag_dtk",
	"rhs_weap_ak74m_2mag_camo_npz",
	"rhs_weap_ak74m_desert",
	"rhs_weap_ak74m_gp25",
	"rhs_weap_ak74m_gp25_npz",
	"rhs_weap_ak74",
	"rhs_weap_ak74_gp25",
	"rhs_weap_aks74",
    
    // -- Assault Rifles (powerful) --
    "rhs_weap_sr25",
    "rhs_weap_sr25_ec",
    "rhs_weap_sr25",
    "rhs_weap_sr25_ec",
    
    // -- MGs --
    "rhs_weap_m249_pip",
    "rhs_weap_rpk74m",
    
	// -- Sniper Rifles --
	"rhs_weap_svd",
	"rhs_weap_m14ebrri",
	
	// -- Rocket Launchers --
	"rhs_weap_rpg18",
	"rhs_weap_M136_hedp"
];

vehicleAddition =
[
    // -- Suppressors --
	"muzzle_snds_L",
	"muzzle_snds_acp",
	
	// -- Optics --
	"optic_Holosight",
	"optic_Holosight_smg",
    "optic_Aco",
	"optic_ACO_grn_smg",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",
	
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
	"FirstAidKit",
	"FirstAidKit",
	"FirstAidKit",
	"FirstAidKit",
	"FirstAidKit",
	"FirstAidKit",
	"FirstAidKit",
	"FirstAidKit",
    "FirstAidKit",
	"ToolKit"
];

vehicleAdditionMilitary =
[
    // -- Suppressors --
    "muzzle_snds_acp",
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"rhs_acc_pbs1",
	"rhs_acc_muzzleFlash_dtk",
	"rhs_acc_tgpa",
	"rhs_acc_tgpv",
	"rhsusf_acc_M2010S",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_nt4_black",
	
	
    // -- Optics --
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",
	
    // -- Scopes --
	"rhsusf_acc_ACOG",
	
    // -- Others --
    "rhsusf_acc_harris_bipod",
    "rhsusf_acc_anpeq15",
    "rhsusf_acc_anpeq15_light",
    "rhsusf_acc_muzzleFlash_SF",
    "FirstAidKit",
    "FirstAidKit",
    "FirstAidKit",
    "FirstAidKit",
    "FirstAidKit",
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
	"rhs_mag_M433_HEDP",
	"rhs_VOG25",
	"rhs_VG40OP_white",
	"rhs_VG40OP_green",
	"rhs_VG40OP_red",
	"rhs_mag_M585_white",
	"rhs_mag_m661_green",
	"rhs_mag_m662_red",
	"rhs_mag_m18_green",
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellOrange",
	"SmokeShellBlue",
	"HandGrenade",
	"ItemGPS",
	"ItemGPS",
	"ItemGPS"
];
