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
_boxItems = [["mag", "HandGrenade", RANDOM_BETWEEN(20,40)]];

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
                ["wep", "rhs_weap_rpg18", RANDOM_BETWEEN(1,4), 0],
                ["wep", "rhs_weap_rpg7", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
                ["wep", "rhs_weap_igla", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
                ["mag", ["rhs_rpg7_PG7VR_mag", "ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,4)]
            ];
		};
		if (_rnd >= 0.30 && _rnd < 0.6) then 
        {
            _boxItems =
            [
                ["wep", "rhs_weap_M136", RANDOM_BETWEEN(1,3), 0],
                ["wep", "rhs_weap_M136_hedp", RANDOM_BETWEEN(1,3), 0],
                ["wep", "rhs_weap_fim92", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
            ];
        };
        if (_rnd >= 0.6 && _rnd < 0.8) then 
        {
            _boxItems =
            [
                ["wep", "rhs_weap_rpg7_pgo", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(5,10)],
                ["wep", "rhs_weap_rpg26", RANDOM_BETWEEN(1,3), 0],
                ["wep", "rhs_weap_igla", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
                ["mag", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], RANDOM_BETWEEN(3,6)]
            ];
        };
        if (_rnd >= 0.8) then
        {
            _boxItems =
            [
                ["wep", "rhs_weap_M136", RANDOM_BETWEEN(1,4), 0],
                ["wep", "rhs_weap_fgm148", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
                ["wep", "rhs_weap_fim92", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
                ["mag", ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)]
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
                ["itm", ["optic_Aco", "optic_ACO_grn", "optic_Aco_smg", "rhsusf_acc_ACOG", "optic_Holosight", "rhsusf_acc_compm4", "rhsusf_acc_eotech_552"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_L", "rhsusf_acc_M2010S"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_P07_snds_F", "hgun_Pistol_heavy_01_F", "hgun_Rook40_snds_F", "hgun_Pistol_heavy_02_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault Rifles
                ["wep", ["rhs_weap_m4a1_carryhandle_grip2", "rhs_weap_m4a1_carryhandle_bipod", "rhs_weap_m4a1_blockII_M203", "rhs_weap_mk18_m320", "rhs_weap_m16a4_grip_compm4", "rhs_weap_m16a4_carryhandle_bipod", "rhs_weap_m16a4_grip_acog3", "rhs_weap_m16a4_carryhandle_M203", "rhs_weap_sr25"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMG
                ["wep", ["rhs_weap_m249_pip_elcan"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["optic_ACO_grn", "optic_Holosight", "rhs_acc_1p63", "rhs_acc_1p29", "rhs_acc_1p78"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_L", "rhs_acc_dtk3", "rhs_acc_ak5", "rhs_acc_tgpa"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_P07_snds_F", "hgun_Pistol_heavy_01_F", "hgun_Rook40_snds_F", "hgun_Pistol_heavy_02_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault Rifles
                ["wep", ["rhs_weap_ak103_npz_dtk", "rhs_weap_ak103_2_dtk", "rhs_weap_ak103_2", "rhs_weap_ak74m_desert_folded", "rhs_weap_ak74m_gp25_folded", "rhs_weap_ak74m_desert_npz", "rhs_weap_ak74m_camo_pso1m2"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMGs
                ["wep", ["rhs_weap_rpk74", "rhs_weap_rpk74m", "rhs_weap_pkm"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["rhsusf_acc_ACOG3", "optic_Aco_smg", "optic_Aco", "optic_Holosight", "rhsusf_acc_EOTECH"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_L", "rhsusf_acc_M2010S"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_PDW2000_Holo_snds_F", "SMG_02_ARCO_pointg_F", "SMG_01_Holo_pointer_snds_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault Rifles
                ["wep", ["rhs_weap_mk18_eotech_usmc", "rhs_weap_mk18_grip2_eotech_usmc", "rhs_weap_mk18_grip2_KAC", "rhs_weap_mk18_m320", "rhs_weap_m16a4_grip_acog3", "rhs_m4a1_m320_acog2", "rhs_weap_sr25", "rhs_weap_sr25_ec"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMG
                ["wep", ["rhs_weap_m240G", "rhs_weap_m240B", "rhs_weap_m249_pip"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["rhs_acc_pso1m2", "optic_Aco", "optic_Holosight", "rhs_acc_1p78", "optic_ACO_grn"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_L", "rhs_acc_dtk3", "rhs_acc_ak5", "rhs_acc_tgpa"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_PDW2000_Holo_snds_F", "SMG_02_ARCO_pointg_F", "SMG_01_Holo_pointer_snds_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault rifles
                ["wep", ["rhs_weap_ak103_npz_dtk", "rhs_weap_ak103_1_dtk", "rhs_weap_ak74m_camo_1p63", "rhs_weap_ak74m_camo_pso1m2", "rhs_weap_ak74m_plummag_npz"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMGs
                ["wep", ["rhs_weap_pkm", "rhs_weap_pkp"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["optic_Arco", "optic_SOS", "optic_NVS", "optic_DMS", "rhsusf_acc_LEUPOLDMK4"], 2],
                ["wep", ["rhs_weap_XM2010", "rhs_weap_m14ebrri", "rhs_weap_XM2010_d", "rhs_weap_XM2010_sa"], 3, 5]
            ];
		};
		if (_rnd >= 0.35 && _rnd < 0.7) then 
        {
            _boxItems =
            [
                ["itm", ["optic_Arco", "optic_SOS", "optic_NVS", "optic_DMS", "rhs_acc_pso1m2"], 2],
                ["wep", ["rhs_weap_svds_pso1", "rhs_weap_svdp_npz", "rhs_weap_XM2010_d", "rhs_weap_XM2010_sa"], 3, 5]
            ];
        };
        if (_rnd >= 0.7 && _rnd < 0.85) then 
        {
            _boxItems =
            [
                ["itm", ["optic_SOS", "optic_DMS", "optic_Nightstalker", "optic_LRPS", "rhsusf_acc_LEUPOLDMK4"], 1],
                ["wep", ["rhs_weap_m14ebrri", "rhs_weap_XM2010_d", "rhs_weap_M107"], 2, 5]
            ];
        };
        if (_rnd >= 0.85) then
        {
            _boxItems =
            [
                ["itm", ["optic_SOS", "optic_DMS", "optic_Nightstalker", "optic_LRPS", "rhsusf_acc_LEUPOLDMK4"], 1],
                ["wep", ["rhs_weap_svds_pso1", "rhs_weap_XM2010_d", "rhs_weap_M107"], 2, 5]
            ];
        };
	};
};

[_box, _boxItems] call processItems;
