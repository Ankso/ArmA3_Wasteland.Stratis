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
                ["wep", "launch_RPG32_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(5,10)],
                ["wep", "launch_I_Titan_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "launch_NLAW_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["mag", ["RPG32_HE_F", "ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,4)]
            ];
		};
		if (_rnd >= 0.30 && _rnd < 0.6) then 
        {
            _boxItems =
            [
                ["wep", "launch_NLAW_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "launch_RPG32_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "launch_B_Titan_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
            ];
        };
        if (_rnd >= 0.6 && _rnd < 0.8) then 
        {
            _boxItems =
            [
                ["wep", "launch_RPG32_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(5,10)],
                ["wep", "launch_B_Titan_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,3)],
                ["wep", "launch_I_Titan_short_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)],
                ["mag", ["Titan_AP", "Titan_AT", "RPG32_HE_F"], RANDOM_BETWEEN(5,10)]
            ];
        };
        if (_rnd >= 0.8) then
        {
            _boxItems =
            [
                ["wep", "launch_NLAW_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "launch_O_Titan_F", RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,3)],
                ["wep", "launch_O_Titan_short_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
                ["mag", ["Titan_AP", "Titan_AT"], RANDOM_BETWEEN(2,5)]
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
                ["itm", ["optic_Aco", "optic_ACO_grn", "optic_Aco_smg", "optic_Hamr", "optic_Holosight"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_M", "muzzle_snds_L", "muzzle_snds_H"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_P07_snds_F", "hgun_Pistol_heavy_01_F", "hgun_Rook40_snds_F", "hgun_Pistol_heavy_02_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault Rifles
                ["wep", ["arifle_MX_F", "arifle_MX_GL_F", "arifle_TRG21_GL_F", "arifle_TRG20_ACO_pointer_F", "arifle_TRG21_ARCO_pointer_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMG
                ["wep", ["LMG_Mk200_F", "arifle_MX_SW_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["optic_ACO_grn", "optic_Holosight", "optic_Arco"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_M", "muzzle_snds_L"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_P07_snds_F", "hgun_Pistol_heavy_01_F", "hgun_Rook40_snds_F", "hgun_Pistol_heavy_02_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault Rifles
                ["wep", ["arifle_Mk20C_ACO_pointer_F", "arifle_Mk20_MRCO_pointer_F", "arifle_Katiba_GL_ACO_F", "arifle_Katiba_ACO_F", "arifle_Katiba_GL_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMGs
                ["wep", "LMG_Zafir_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["optic_Arco", "optic_Aco_smg", "optic_Aco", "optic_Holosight", "optic_Holosight_smg"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_L", "muzzle_snds_M", "muzzle_snds_B", "muzzle_snds_H", "muzzle_snds_acp"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_PDW2000_Holo_snds_F", "SMG_02_ARCO_pointg_F", "SMG_01_Holo_pointer_snds_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault Rifles
                ["wep", ["arifle_MX_GL_F", "arifle_MXM_F", "arifle_MX_Holo_pointer_F", "arifle_MX_GL_ACO_F", "arifle_MXM_Black_F", "arifle_MX_ACO_pointer_snds_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMG
                ["wep", ["LMG_Mk200_pointer_F", "LMG_Mk200_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["optic_Hamr", "optic_Aco", "optic_Holosight", "optic_Aco_smg", "optic_ACO_grn"], RANDOM_BETWEEN(0,2)],
                ["itm", ["muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_M", "muzzle_snds_L", "muzzle_snds_H"], RANDOM_BETWEEN(0,3)],
                // Handguns/SMGs
                ["wep", ["hgun_PDW2000_Holo_snds_F", "SMG_02_ARCO_pointg_F", "SMG_01_Holo_pointer_snds_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
                // Assault rifles
                ["wep", ["arifle_Katiba_C_ACO_pointer_F", "arifle_Katiba_GL_ARCO_pointer_F", "arifle_Katiba_GL_Nstalker_pointer_F", "arifle_Katiba_ACO_pointer_snds_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)],
                // LMGs
                ["wep", ["LMG_Zafir_pointer_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
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
                ["itm", ["optic_Arco", "optic_SOS", "optic_NVS", "optic_DMS"], 1],
                ["wep", ["srifle_DMR_01_F", "srifle_EBR_F"], 2, 5]
            ];
		};
		if (_rnd >= 0.35 && _rnd < 0.7) then 
        {
            _boxItems =
            [
                ["itm", ["optic_Arco", "optic_SOS", "optic_NVS", "optic_DMS"], 1],
                ["wep", ["srifle_DMR_01_F", "srifle_EBR_F"], 2, 5]
            ];
        };
        if (_rnd >= 0.7 && _rnd < 0.85) then 
        {
            _boxItems =
            [
                ["itm", ["optic_SOS", "optic_DMS", "optic_Nightstalker", "optic_LRPS"], 1],
                ["wep", ["srifle_EBR_F", "srifle_LRR_F", "srifle_GM6_F"], 2, 5]
            ];
        };
        if (_rnd >= 0.85) then
        {
            _boxItems =
            [
                ["itm", ["optic_SOS", "optic_DMS", "optic_Nightstalker", "optic_LRPS"], 1],
                ["wep", ["srifle_DMR_01_F", "srifle_LRR_F", "srifle_GM6_F"], 2, 5]
            ];
        };
	};
};

[_box, _boxItems] call processItems;
