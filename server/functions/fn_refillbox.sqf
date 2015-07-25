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
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
    case "mission_supplies":
    {
        _flareColor = ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"];
        _flareColor = _flareColor call SGC_fnc_selectRandom;
        _boxItems =
        [
            // Items
            ["mag", "HandGrenade", RANDOM_BETWEEN(20, 40)],
            ["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(0, 10)],
            ["mag", _flareColor, RANDOM_BETWEEN(2, 10)],
            ["itm", "Binocular", RANDOM_BETWEEN(4, 5)],
            ["itm", "Medikit", RANDOM_BETWEEN(1, 3)],
            ["itm", "Toolkit", RANDOM_BETWEEN(0, 1)],
            ["itm", "optic_Aco", RANDOM_BETWEEN(0, 2)],
            ["itm", "optic_Holosight", RANDOM_BETWEEN(2, 4)],
            ["itm", "optic_ACO_grn", RANDOM_BETWEEN(2, 4)],
            ["itm", "optic_Arco", RANDOM_BETWEEN(0, 1)],
            ["itm", "optic_Hamr", RANDOM_BETWEEN(0, 1)],
            ["itm", "muzzle_snds_acp", RANDOM_BETWEEN(0, 2)],
            ["itm", "muzzle_snds_L", RANDOM_BETWEEN(0, 2)],
            ["itm", "muzzle_snds_M", RANDOM_BETWEEN(0, 2)],
            ["itm", "muzzle_snds_H", RANDOM_BETWEEN(0, 1)]
        ];
        _rndVest = random 1;
        if (_rndVest < 0.2) then
        {
            _boxItems pushBack ["itm", "V_TacVest_camo", 2];
        };
    };
	case "mission_USLaunchers":
	{
        _rnd = random 1;
        if (_rnd < 0.30) then 
        {
            _boxItems =
            [
                // Item type, Item class(es), # of items, # of magazines per weapon
                ["wep", "launch_RPG32_F", 3, 3],
                ["wep", "launch_NLAW_F", 1, 1],
                ["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
            ];
		};
		if (_rnd >= 0.30 && _rnd < 0.7) then 
        {
            _boxItems =
            [
                ["wep", "launch_RPG32_F", 3, 3],
                ["wep", "launch_NLAW_F", 1, 1],
                ["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
            ];
        };
        if (_rnd >= 0.7 && _rnd < 0.85) then 
        {
            _boxItems =
            [
                ["wep", "launch_RPG32_F", 3, 4],
                ["wep", "launch_B_Titan_F", 2, 2],
                ["wep", "launch_I_Titan_short_F", 1, 2],
                ["mag", "Titan_AT", RANDOM_BETWEEN(0, 5)]
            ];
        };
        if (_rnd >= 0.85) then
        {
            _boxItems =
            [
                ["wep", "launch_RPG32_F", 3, 4],
                ["wep", "launch_B_Titan_F", 2, 2],
                ["wep", "launch_I_Titan_short_F", 1, 2],
                ["mag", "Titan_AT", RANDOM_BETWEEN(0, 5)]
            ];
        };
	};
	case "mission_USSpecial":
	{
        _boxItems = [];
		_rnd = random 1;
        if (_rnd < 0.8) then 
        {
            _rndWep = random 1;
            // MK20s
            if (_rndWep < 0.25) then
            {
                _boxItems pushBack ["wep", "arifle_Mk20_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_Mk20_GL_ACO_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_Mk20_Holo_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_Mk20C_ACO_pointer_F", 2, 5];
            };
            // TRG2Xs
            if (_rndWep >= 0.25 && _rndWep < 0.5) then
            {
                _boxItems pushBack ["wep", "arifle_TRG20_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_TRG21_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_TRG21_GL_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_TRG20_ACO_Flash_F", 2, 5];
            };
            // Katibas
            if (_rndWep >= 0.5 && _rndWep < 0.75) then
            {
                _boxItems pushBack ["wep", "arifle_Katiba_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_Katiba_C_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_Katiba_GL_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_Katiba_GL_ACO_F", 2, 5];
            };
            // MXs
            if (_rndWep >= 0.75) then
            {
                _boxItems pushBack ["wep", "arifle_MX_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_MX_GL_ACO_pointer_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_MX_GL_Black_F", 2, 5];
                _boxItems pushBack ["wep", "arifle_MXC_ACO_pointer_F", 2, 5];
            };
            _rndWep = random 1;
            // LMGs
            if (_rndWep < 0.5) then
            {
                _boxItems pushBack ["wep", "LMG_Mk200_pointer_F", 1, 3];
            }
            else
            {
                _boxItems pushBack ["wep", "LMG_Zafir_pointer_F", 1, 3];
            };
            _rndWep = random 1;
            // Handguns/SMGs
            if (_rndWep < 0.25) then
            {
                _boxItems pushBack ["wep", "hgun_ACPC2_snds_F", 3, 3];
            };
            if (_rndWep >= 0.25 && _rndWep < 0.5) then
            {
                _boxItems pushBack ["wep", "hgun_Pistol_heavy_01_MRD_F", 3, 3];
            };
            if (_rndWep >= 0.5 && _rndWep < 0.75) then
            {
                _boxItems pushBack ["wep", "hgun_Pistol_heavy_02_Yorris_F", 3, 3];
            };
            if (_rndWep >= 0.75) then
            {
                _boxItems pushBack ["wep", "SMG_02_ARCO_pointg_F", 3, 3];
            };
		}
        else
        {
            // MXMs
            _boxItems pushBack ["wep", "arifle_MX_SW_Black_F", 2, 5];
            _boxItems pushBack ["wep", "arifle_MXM_Black_F", 2, 5];
            _boxItems pushBack ["wep", "arifle_MXM_F", 2, 5];
            _boxItems pushBack ["wep", "arifle_MXC_Holo_pointer_snds_F", 2, 5];
            _boxItems pushBack ["wep", "arifle_MX_SW_Black_F", 1, 5];
            _rndWep = random 1;
            // LMG
            if (_rndWep < 0.5) then
            {
                _boxItems pushBack ["wep", "LMG_Mk200_MRCO_F", 1, 3];
            }
            else
            {
                _boxItems pushBack ["wep", "LMG_Zafir_pointer_F", 1, 3];
            };
            _rndWep = random 1;
            // Handguns/SMGs
            if (_rndWep < 0.25) then
            {
                _boxItems pushBack ["wep", "SMG_01_Holo_pointer_snds_F", 2, 5];
            };
            if (_rndWep >= 0.25 && _rndWep < 0.5) then
            {
                _boxItems pushBack ["wep", "SMG_02_ACO_F", 2, 5];
            };
            if (_rndWep >= 0.5 && _rndWep < 0.75) then
            {
                _boxItems pushBack ["wep", "hgun_PDW2000_Holo_snds_F", 2, 5];
            };
            if (_rndWep >= 0.75) then
            {
                _boxItems pushBack ["wep", "hgun_Pistol_heavy_01_MRD_F", 2, 5];
            };
        };
	};
	case "mission_Main_A3snipers":
	{
		_rnd = random 1;
        if (_rnd < 0.85) then 
        {
            _boxItems =
            [
                ["itm", "optic_DMS", 1],
                ["itm", "optic_MRCO", 1],
                ["itm", "optic_SOS", 1],
                ["itm", "optic_NVS", 1],
                ["wep", "srifle_DMR_01_F", 2, 5],
                ["wep", "srifle_EBR_F", 2, 5],
                ["wep", "srifle_LRR_F", 2, 5],
                ["wep", "SMG_01_Holo_pointer_snds_F", 2, 5]
            ];
		}
		else
        {
            _boxItems =
            [
                ["itm", "optic_DMS", 1],
                ["itm", "optic_MRCO", 1],
                ["itm", "optic_SOS", 1],
                ["itm", "optic_LRPS", 1],
                ["wep", "srifle_DMR_01_F", 2, 5],
                ["wep", "srifle_EBR_F", 2, 5],
                ["wep", "srifle_LRR_F", 1, 5],
                ["wep", "srifle_GM6_F", 1, 5],
                ["wep", "SMG_01_Holo_pointer_snds_F", 2, 5]
            ];
        };
	};
};

[_box, _boxItems] call processItems;
