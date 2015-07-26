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
		"I_Plane_Fighter_03_AA_F",
		"I_Plane_Fighter_03_CAS_F",
		"B_Plane_CAS_01_F",
		"O_Plane_CAS_02_F",
		"I_Plane_Fighter_03_AA_F",
		"I_Plane_Fighter_03_CAS_F",
		"RHS_Su25SM_vvs",
		"RHS_Su25SM_KH29_vvs",
		"RHS_Su25SM_vvsc",
		"RHS_Su25SM_KH29_vvsc",
		"RHS_Su25SM_vvsc",
		"RHS_Su25SM_KH29_vvsc"
	] call SGC_fnc_selectRandom;

	_missionType = "Armed Jet";
	_locationsArray = PlaneMissionMarkers;

	_nbUnits = AI_GROUP_LARGE;
};

_this call mission_VehicleCapture;
