// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"rhs_btr60_vmf",
		"rhs_btr60_vdv",
		"rhs_btr60_vv",
		"rhs_btr60_msv",
		"rhs_btr70_vmf",
		"rhs_btr70_vdv",
		"rhs_btr70_vv",
		"rhs_btr70_msv",
		"rhs_btr80_msv",
		"rhs_btr80_vdv",
		"rhs_btr80a_msv",
		"rhs_btr80a_vv",
		"rhs_btr70_chdkz",
		"rhsusf_m113_usarmy",
		"rhsusf_m113d_usarmy",
		"rhsusf_m113_usarmy",
		"rhsusf_m113d_usarmy",
		"rhs_zsu234_aa",
		"rhs_zsu234_chdkz",
		"rhs_zsu234_aa",
		"rhs_zsu234_chdkz"
	] call SGC_fnc_selectRandom;

	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["rhs_zsu234_aa", "rhs_zsu234_chdkz"] > 0): { "Anti Aircraft Vehicle" };
		case (_vehicleClass isKindOf "Tank_F"):                                             { "Infantry Fighting Vehicle" };
		default                                                                             { "Armored Personnel Carrier" };
	};

	_locationsArray = MainMissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
