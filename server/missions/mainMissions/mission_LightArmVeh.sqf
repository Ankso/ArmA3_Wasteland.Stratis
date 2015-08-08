// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_LightArmVeh.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
        "rhsusf_m113_usarmy",
		"rhsusf_m113d_usarmy",
		"rhsusf_m113_usarmy",
		"rhsusf_m113d_usarmy",
		"rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_M2_d_open_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy",
		"rhsusf_rg33_m2_usmc_d",
		"rhsusf_rg33_m2_d",
		"rhsusf_rg33_usmc_d",
		"rhsusf_rg33_m2_d",
		"rhsusf_m113_usarmy",
		"rhsusf_m113d_usarmy",
		"rhsusf_m113_usarmy",
		"rhsusf_m113d_usarmy",
		"rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_M2_d_open_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy",
		"rhsusf_rg33_m2_usmc_d",
		"rhsusf_rg33_m2_d",
		"rhsusf_rg33_usmc_d",
		"rhsusf_rg33_m2_d"
	] call SGC_fnc_selectRandom;

	_missionType = "Light Armed Vehicle";
	_locationsArray = MainMissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
