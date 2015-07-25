// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: createTownMarkers.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19
//	@file Args:

private ["_pos", "_marker"];

{
	_pos = markerPos (_x select 0);
	_marker = createMarker [format ["TownCircle%1", _forEachIndex + 1], _pos];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_x select 1, _x select 1];
	_marker setMarkerColor "ColorBlue";
	_marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.3;
} forEach (call cityList);