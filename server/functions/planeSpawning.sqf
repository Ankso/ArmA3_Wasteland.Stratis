// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: planeSpawning.sqf
//	@file Author: AgentRev
//	@file Created: 21/09/2013 17:13
//	@file Args:

if (!isServer) exitWith {};

private "_markers";
_markers = [];

{
	if (["planeSpawn_", _x] call fn_startsWith) then
	{
        _markers pushBack _x;
		
	};
} forEach allMapMarkers;

_finalSpawn = _markers call SGC_fnc_selectRandom;
_noBuzzard = ["_noBuzzard", _finalSpawn] call fn_findString != -1;
[markerPos _finalSpawn, markerDir _finalSpawn, _noBuzzard] call planeCreation;

diag_log "WASTELAND SERVER - 1 Plane Spawned";
