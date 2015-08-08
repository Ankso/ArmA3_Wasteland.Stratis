// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_MBT.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
        "rhs_t80b",
		"rhs_t72ba_tv",
		"rhs_t72ba_tv",
		"rhs_t72bc_tv",
		"rhs_t72bb_tv",
		"rhs_t72bb_tv",
		"rhs_t72bb_chdkz",
		"rhsusf_m1a1fep_d",
		"rhsusf_m1a1aimd_usarmy",
		"rhsusf_m1a2sep1d_usarmy",
		"rhs_sprut_vdv",
		"rhs_bmp1_vdv",
		"rhs_bmp1p_vdv",
		"rhs_bmp1k_msv",
		"rhs_bmp1d_tv",
		"rhs_bmp2e_vdv",
		"rhs_bmp2_tv",
		"rhs_bmp2k_msv",
		"rhs_bmp2d_vmf",
		"rhs_bmd2_chdkz",
		"rhs_bmd1",
		"rhs_bmd1k",
		"rhs_bmd1pk",
		"rhs_bmd2m",
		"rhs_bmd2k",
		"rhs_prp3_vdv",
		"rhs_prp3_msv",
		"rhs_prp3_vmf",
		"rhs_bmd4_vdv",
		"rhs_bmd4ma_vdv"
	] call SGC_fnc_selectRandom;

	_missionType = "Main Battle Tank";
	_locationsArray = MainMissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
