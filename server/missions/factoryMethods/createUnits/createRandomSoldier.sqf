// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldier.sqf
/*
 * Creates a random civilian soldier.
 *
 * Arguments: [ position, group, init, skill, rank]: Array
 *    position: Position - Location unit is created at.
 *    group: Group - Existing group new unit will join.
 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
 *    skill: Number - (optional, default 0.5)
 *    rank: String - (optional, default "PRIVATE")
 */

if (!isServer) exitWith {};

private ["_soldierTypes", "_uniformTypes", "_vestTypes", "_weaponTypes", "_group", "_position", "_rank", "_soldier"];

_soldierTypes = ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F"];
_uniformTypes = ["U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam_tshirt" ,"U_B_CombatUniform_mcam"];
_vestTypes = ["V_BandollierB_oli","V_BandollierB_khk", "V_BandollierB_rgr", "V_Chestrig_blk", "V_HarnessO_brn"];
_weaponTypes = ["rhs_weap_ak74m", "rhs_weap_ak74m", "rhs_weap_ak74m", "rhs_weap_akm","rhs_weap_akms","SMG_02_F","rhs_weap_akm_gp25", "hgun_PDW2000_Holo_F", "SMG_01_ACO_F", "SMG_02_ARCO_pointg_F"];

_group = _this select 0;
_position = _this select 1;
_rank = [_this, 2, "", [""]] call BIS_fnc_param;

_soldier = _group createUnit [_soldierTypes call SGC_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform (_uniformTypes call SGC_fnc_selectRandom);
_soldier addVest (_vestTypes call SGC_fnc_selectRandom);
[_soldier, _weaponTypes call SGC_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
_soldier addWeapon "SmokeShell";

if (_rank != "") then
{
	_soldier setRank _rank;
};

_soldier spawn refillPrimaryAmmo;
_soldier spawn addMilCap;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

_soldier
