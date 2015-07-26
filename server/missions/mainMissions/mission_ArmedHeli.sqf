// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"B_Heli_Light_01_armed_F",
		"B_Heli_Light_01_armed_F",
		"B_Heli_Transport_01_F",
		"B_Heli_Transport_01_F",
		"O_Heli_Light_02_F",
		"O_Heli_Light_02_F",
		"I_Heli_light_03_F",
		"RHS_Mi8AMTSh_UPK23_vvs",
		"RHS_Mi8MTV3_FAB_vvs",
		"RHS_Mi24P_CAS_vvs"
	] call SGC_fnc_selectRandom;

	_missionType = "Armed Helicopter";
	_locationsArray = MainMissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
