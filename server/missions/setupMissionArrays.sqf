// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

MainMissions =
[
	// Mission filename, weight
	["mission_APC", 0.5],
	["mission_MBT", 0.25],
	["mission_LightArmVeh", 0.6],
	["mission_ArmedHeli", 0.35],
	["mission_CivHeli", 0.5],
	["mission_Plane", 0.25]
];

SideMissions =
[
    ["mission_MiniConvoy", 0.75],
	["mission_SunkenSupplies", 0.5],
	["mission_AirWreck", 1.5],
	["mission_WepCache", 1.5],
	["mission_Outpost", 1.5],
	// ["mission_HostileHelicopter", 0.5],
	// ["mission_TownInvasion", 2],
	["mission_Truck", 1]
];

MoneyMissions =
[
	["mission_MoneyShipment", 1]
];

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;

MissionSpawnMarkers = [];
MainMissionSpawnMarkers = [];
SunkenMissionMarkers = [];
PlaneMissionMarkers = [];
{
	switch (true) do
	{
		case (["Mission_", _x] call fn_startsWith):
		{
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["MainMission_", _x] call fn_startsWith):
		{
			MainMissionSpawnMarkers pushBack [_x, false];
		};
		case (["SunkenMission_", _x] call fn_startsWith):
		{
			SunkenMissionMarkers pushBack [_x, false];
		};
		case (["MissionPlane_", _x] call fn_startsWith):
		{
            PlaneMissionMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;

LandConvoyPaths = [];
{
	LandConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf");

CoastalConvoyPaths = [];
{
	CoastalConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf");
