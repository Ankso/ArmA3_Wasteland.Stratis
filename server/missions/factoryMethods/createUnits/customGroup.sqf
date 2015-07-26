// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = [_this, 2, 7, [0]] call BIS_fnc_param;
_radius = [_this, 3, 10, [0]] call BIS_fnc_param;

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call SGC_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	switch (true) do
	{
		// Grenadier every 4 units
		case (_i % 4 == 0):
		{
            _unit addUniform "U_B_CombatUniform_mcam_vest";
            _unit addVest "V_HarnessOGL_brn";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			_unit addMagazine "rhs_VOG25";
			_unit addMagazine "rhs_VOG25";
			_unit addMagazine "rhs_VOG25P";
			_unit addMagazine "rhs_VOG25P";
			_unit addWeapon "rhs_weap_ak74m_gp25";
			_unit addWeapon "SmokeShell";
		};
		// AT every 5 units
		case (_i % 5 == 0):
		{
            _unit addUniform "U_B_CombatUniform_mcam_vest";
            _unit addBackpack "B_Kitbag_mcamo";
            _unit addVest "V_Chestrig_khk";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			_unit addWeapon "rhs_weap_ak74m";
			_unit addWeapon "SmokeShell";
		    _unit addWeapon "rhs_weap_rpg18";
		};
		// Rifleman
		default
		{
			

			if (_unit == leader _group) then
			{
                // The officer is the only one that has pistol and uniform
                _unit addUniform "U_I_OfficerUniform";
                _unit addVest (["V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli", "V_TacVestCamo_khk", "V_TacVestIR_blk"] call SGC_fnc_selectRandom);
				_unit addWeapon "rhs_m4_grip_compm4";
				_unit addMagazine "rhs_mag_30Rnd_556x45_Mk318_Stanag";
                _unit addMagazine "rhs_mag_30Rnd_556x45_Mk262_Stanag";
                _unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
                _unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer";
                _unit addWeapon "hgun_P07_F";
                _unit addMagazine "16Rnd_9x21_Mag";
                _unit addMagazine "16Rnd_9x21_Mag";
				_unit setRank "SERGEANT";
				_unit addWeapon "SmokeShell";
			}
			else
			{
                _unit addUniform "U_B_CombatUniform_mcam";
                _unit addVest (["V_BandollierB_khk", "V_BandollierB_cbr", "V_BandollierB_oli", "V_BandollierB_rgr"] call SGC_fnc_selectRandom);
                _unitWeapon = ["rhs_weap_akm", "rhs_weap_ak74m", "rhs_weap_ak74m_desert_npz", "rhs_weap_akms", "SMG_01_F", "SMG_02_F", "SMG_02_F", "hgun_PDW2000_F"] call SGC_fnc_selectRandom;
                switch (_unitWeapon) do
                {
                    case "rhs_weap_akms";
                    case "rhs_weap_akm":
                    {
                        _unit addMagazine "rhs_30Rnd_762x39mm";
                        _unit addMagazine "rhs_30Rnd_762x39mm_89";
                        _unit addMagazine "rhs_30Rnd_762x39mm_tracer";
                    };
                    case "hgun_PDW2000_F";
                    case "SMG_02_F":
                    {
                        _unit addMagazine "30Rnd_9x21_Mag";
                        _unit addMagazine "30Rnd_9x21_Mag";
                        _unit addMagazine "30Rnd_9x21_Mag";
                    };
                    case "SMG_01_F":
                    {
                        _unit addMagazine "30Rnd_45ACP_Mag_SMG_01_Tracer_Green";
                        _unit addMagazine "30Rnd_45ACP_Mag_SMG_01_Tracer_Green";
                        _unit addMagazine "30Rnd_45ACP_Mag_SMG_01_Tracer_Green";
                    };
                    default
                    {
                        _unit addMagazine "rhs_30Rnd_545x39_AK";
                        _unit addMagazine "rhs_30Rnd_545x39_AK";
                        _unit addMagazine "rhs_30Rnd_545x39_AK";
                    };
                };
				_unit addWeapon _unitWeapon;
				_unit addWeapon "SmokeShell";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
