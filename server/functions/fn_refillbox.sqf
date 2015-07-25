// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box allowDamage false; // No more fucking busted crates
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
        _rnd = random 1;
        if (_rnd < 0.30) then 
        {
            _boxItems =
            [
                // Item type, Item class(es), # of items, # of magazines per weapon
                ["wep", "CUP_launch_RPG7V", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(5,10)],
                ["wep", "CUP_launch_Igla", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "CUP_launch_RPG18", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["mag", ["CUP_PG7VL_M", "ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,4)]
            ];
		};
		if (_rnd >= 0.30 && _rnd < 0.6) then 
        {
            _boxItems =
            [
                ["wep", "CUP_launch_NLAW", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "CUP_launch_Mk153Mod0", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["itm", "CUP_optic_SMAW_Scope", RANDOM_BETWEEN(1,3)],
                ["wep", "CUP_launch_FIM92Stinger", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
            ];
        };
        if (_rnd >= 0.6 && _rnd < 0.8) then 
        {
            _boxItems =
            [
                ["wep", "CUP_launch_RPG7V", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(5,10)],
                ["wep", "CUP_launch_9K32Strela", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,3)],
                ["wep", "CUP_launch_Metis", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)],
                ["mag", ["CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M"], RANDOM_BETWEEN(5,10)]
            ];
        };
        if (_rnd >= 0.8) then
        {
            _boxItems =
            [
                ["wep", "CUP_launch_NLAW", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "CUP_launch_M47", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "CUP_launch_FIM92Stinger", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "CUP_launch_Javelin", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)]
            ];
        };
	};
	case "mission_USSpecial":
	{
		_rnd = random 1;
        if (_rnd < 0.35) then 
        {
            _boxItems =
            [
                ["itm", "Binocular", RANDOM_BETWEEN(4,5)],
                ["itm", "Medikit", RANDOM_BETWEEN(1,3)],
                ["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
                ["itm", ["CUP_optic_HoloWdl", "CUP_optic_CompM4", "CUP_optic_CompM2_Woodland", "CUP_optic_TrijiconRx01_desert", "CUP_optic_RCO"], RANDOM_BETWEEN(0,2)],
                ["itm", ["CUP_muzzle_snds_G36_black", "CUP_muzzle_snds_L85", "CUP_muzzle_snds_M16_camo"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["CUP_hgun_M9_snds", "CUP_hgun_Duty_M3X", "CUP_hgun_glock17_flashlight_snds", "CUP_hgun_Colt1911_snds"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // AR-15s
                ["wep", ["CUP_arifle_M4A1_camo", "CUP_arifle_M4A1_camo_AIM_snds", "CUP_arifle_M4A1_camo_GL_Holo_Flashlight", "CUP_arifle_M16A4_ACOG_Laser", "CUP_arifle_M16A4_GL"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // Other NATO Assault rifles
                ["wep", ["CUP_arifle_L85A2_Holo_laser", "CUP_arifle_L85A2_GL_SUSAT_Laser", "CUP_arifle_G36C_camo_holo_snds", "CUP_arifle_G36K_camo", "CUP_arifle_G36A_camo", "CUP_arifle_XM8_Carbine_GL", "CUP_arifle_XM8_Carbine", "CUP_srifle_M15_Aim", "CUP_arifle_CZ805_GL_ZDDot_Laser", "CUP_arifle_CZ805_GL"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMG
                ["wep", "CUP_lmg_M249", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                ["mag", "HandGrenade", RANDOM_BETWEEN(20,40)]
            ];
		};
		if (_rnd >= 0.35 && _rnd < 0.7) then 
        {
            _boxItems =
            [
                ["itm", "Binocular", RANDOM_BETWEEN(4,5)],
                ["itm", "Medikit", RANDOM_BETWEEN(1,3)],
                ["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
                ["itm", ["CUP_optic_Kobra", "CUP_optic_PechenegScope", "CUP_optic_PSO_1"], RANDOM_BETWEEN(0,2)],
                ["itm", ["CUP_muzzle_PB6P9", "CUP_muzzle_PBS4"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["CUP_smg_bizon_snds", "CUP_hgun_Duty_M3X", "CUP_hgun_SA61", "CUP_smg_EVO"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // AKs
                ["wep", ["CUP_arifle_AK107", "CUP_arifle_AK74_GL_kobra", "CUP_arifle_AK107_kobra", "CUP_arifle_Sa58V_Aim_Laser", "CUP_srifle_SVD_des"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMGs
                ["wep", ["CUP_lmg_UK59", "CUP_arifle_RPK74"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                ["mag", "HandGrenade", RANDOM_BETWEEN(20,40)]
            ];
        };
        if (_rnd >= 0.7 && _rnd < 0.85) then 
        {
            _boxItems =
            [
                ["itm", "NVGoggles", 5],
                ["itm", "Binocular", RANDOM_BETWEEN(4,5)],
                ["itm", "Medikit", RANDOM_BETWEEN(1,3)],
                ["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
                ["itm", ["CUP_optic_HoloWdl", "CUP_optic_CompM4", "CUP_optic_CompM2_Woodland", "CUP_optic_TrijiconRx01_desert", "CUP_optic_RCO"], RANDOM_BETWEEN(0,2)],
                ["itm", ["CUP_muzzle_snds_G36_black", "CUP_muzzle_snds_L85", "CUP_muzzle_snds_M16_camo"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["CUP_hgun_M9_snds", "CUP_hgun_Duty_M3X", "CUP_hgun_glock17_flashlight_snds", "CUP_hgun_Colt1911_snds"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // SCARs
                ["wep", ["CUP_arifle_Mk16_CQC_EGLM", "CUP_arifle_Mk16_CQC_SFG", "CUP_arifle_Mk16_STD_FG", "CUP_arifle_Mk16_STD_EGLM", "CUP_arifle_Mk17_CQC_SFG", "CUP_arifle_Mk17_STD_EGLM"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // Others
                ["wep", "CUP_srifle_M14", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // LMG
                ["wep", ["CUP_lmg_Mk48_wdl_Aim_Laser", "CUP_lmg_M240", "CUP_lmg_M60A4"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                ["mag", "HandGrenade", RANDOM_BETWEEN(20,40)]
            ];
        };
        if (_rnd >= 0.85) then
        {
            _boxItems =
            [
                ["itm", "NVGoggles", 5],
                ["itm", "Binocular", RANDOM_BETWEEN(4,5)],
                ["itm", "Medikit", RANDOM_BETWEEN(1,3)],
                ["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
                ["itm", ["CUP_optic_Kobra", "CUP_optic_PechenegScope", "CUP_optic_PSO_1", "CUP_optic_Eotech533", "CUP_optic_PSO_3"], RANDOM_BETWEEN(0,2)],
                ["itm", ["CUP_muzzle_PB6P9", "CUP_muzzle_PBS4"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["CUP_smg_bizon_snds", "CUP_hgun_Duty_M3X", "CUP_hgun_SA61", "CUP_smg_EVO"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault rifles
                ["wep", ["CUP_arifle_AK107", "CUP_sgun_AA12", "CUP_arifle_AK107_kobra", "CUP_arifle_Sa58V_ACOG_Laser", "CUP_srifle_SVD_des", "CUP_arifle_CZ805_B_GL", "CUP_arifle_FNFAL_railed"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMGs
                ["wep", ["CUP_lmg_Pecheneg", "CUP_lmg_PKM"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                ["mag", "HandGrenade", RANDOM_BETWEEN(20,40)]
            ];
        };
	};
	case "mission_Main_A3snipers":
	{
		_rnd = random 1;
        if (_rnd < 0.35) then 
        {
            _boxItems =
            [
                ["itm", ["CUP_optic_Leupold_VX3", "CUP_optic_LeupoldM3LR", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "CUP_optic_RCO"], 1],
                ["wep", ["CUP_srifle_CZ550", "CUP_srifle_M24_wdl", "CUP_srifle_Mk12SPR_LeupoldM3LR", "CUP_srifle_DMR", "CUP_hgun_MicroUzi_snds"], 2, 5]
            ];
		};
		if (_rnd >= 0.35 && _rnd < 0.7) then 
        {
            _boxItems =
            [
                ["itm", ["CUP_optic_PSO_1", "CUP_optic_PSO_3", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "CUP_optic_RCO"], 1],
                ["wep", ["CUP_srifle_VSSVintorez", "CUP_srifle_SVD_des", "CUP_srifle_CZ750", "CUP_srifle_CZ550", "CUP_hgun_Phantom_Flashlight_snds"], 2, 5]
            ];
        };
        if (_rnd >= 0.7 && _rnd < 0.85) then 
        {
            _boxItems =
            [
                ["itm", ["CUP_optic_Leupold_VX3", "CUP_optic_LeupoldM3LR", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "CUP_optic_RCO"], 1],
                ["wep", ["CUP_srifle_AWM_des", "CUP_arifle_Mk20", "CUP_srifle_M24_ghillie", "CUP_srifle_M110", "CUP_smg_MP5SD6"], 2, 5]
            ];
        };
        if (_rnd >= 0.85) then
        {
            _boxItems =
            [
                ["itm", ["CUP_optic_PSO_1", "CUP_optic_PSO_3", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "CUP_optic_RCO"], 1],
                ["wep", ["CUP_srifle_VSSVintorez", "CUP_srifle_ksvk", "CUP_srifle_CZ750", "CUP_srifle_SVD_des_ghillie_pso", "CUP_hgun_Phantom_Flashlight_snds"], 2, 5]
            ];
        };
	};
};

[_box, _boxItems] call processItems;
