// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldierC.sqf

if (!isServer) exitWith {};

private ["_soldierTypes", "_weaponTypes", "_group", "_position", "_soldier"];

_soldierTypes = ["C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F"];
_weaponTypes = ["CUP_arifle_AKS","CUP_arifle_AKM","CUP_arifle_AK74_GL","CUP_arifle_AKS74U"];
_group = _this select 0;
_position = _this select 1;
_soldier = _group createUnit [_soldierTypes call SGC_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform "U_B_Ghilliesuit";
[_soldier, _weaponTypes call SGC_fnc_selectRandom, 3] call BIS_fnc_addWeapon;

_soldier spawn refillPrimaryAmmo;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

_soldier
