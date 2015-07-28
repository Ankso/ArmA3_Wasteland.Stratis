// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicle", "_vehicleName", "_vehDeterminer"];

// setupVars must be defined in the top mission file

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;

	switch (true) do
	{
		// GMG MRAPs
		case ({ _vehicle isKindOf _x } count
		[
            "rhs_btr60_vmf", "rhs_btr60_vdv", "rhs_btr60_vv",
            "rhs_btr60_msv", "rhs_btr70_vmf", "rhs_btr70_vdv",
            "rhs_btr70_vv", "rhs_btr70_msv", "rhs_btr80_msv",
            "rhs_btr80_vdv", "rhs_btr80a_msv", "rhs_btr80a_vv",
            "rhs_btr70_chdkz", "rhsusf_m113_usarmy", "rhsusf_m113d_usarmy",
            "rhsusf_m113_usarmy", "rhsusf_m113d_usarmy", "rhs_zsu234_aa",
            "rhs_zsu234_chdkz", "rhs_zsu234_aa", "rhs_zsu234_chdkz",
            "rhs_t72ba_tv", "rhs_t80b", "rhs_t72bc_tv",
            "rhs_t72bd_tv", "rhs_bmp1_vdv", "rhs_bmp1p_vdv",
            "rhs_bmp1k_msv", "rhs_bmp1d_tv", "rhs_bmp2e_vdv",
            "rhs_bmp2_tv", "rhs_bmp2k_msv", "rhs_bmp2d_vmf",
            "rhs_bmd2_chdkz", "rhs_bmd1", "rhs_bmd1k",
            "rhs_bmd1pk", "rhs_bmd2m", "rhs_bmd2k",
            "rhs_prp3_vdv", "rhs_prp3_msv", "rhs_prp3_vmf",
            "RHS_M2A2", "RHS_M2A2_BUSKI", "rhs_bmd4_vdv", "rhs_bmd4ma_vdv"
        ] > 0):
		{
			// Empty the fuel tank
			_vehicle setFuel 0;
		};

		// AMV-7 Marshall
		case (_vehicle isKindOf "B_APC_Wheeled_01_cannon_F"):
		{
			_vehicle setVehicleAmmoDef 1;

			// Reduce all shells and MG ammo, reset smoke mags
			_vehicle addMagazineTurret ["SmokeLauncherMag", [0,0]];
			_vehicle setVehicleAmmo 0.5;
		};

		// AFV-4 Gorgon
		case (_vehicle isKindOf "I_APC_Wheeled_03_cannon_F"):
		{
			_vehicle setVehicleAmmoDef 1;

			// Reduce all shells and MG ammo, reset AT missiles and smoke mags
			_vehicle addMagazineTurret ["2Rnd_GAT_missiles", [0]];
			_vehicle addMagazineTurret ["SmokeLauncherMag", [0,0]];
			_vehicle setVehicleAmmo 0.5;
		};

		// BTR-K Kamysh
		case (_vehicle isKindOf "O_APC_Tracked_02_cannon_F"):
		{
			_vehicle setVehicleAmmoDef 1;

			// Reduce all shells and MG ammo, reset AT missiles and smoke mags
			_vehicle addMagazineTurret ["2Rnd_GAT_missiles", [0]];
			_vehicle addMagazineTurret ["SmokeLauncherMag", [0,0]];
			_vehicle setVehicleAmmo 0.5;
		};

		// FV-720 Mora
		case (_vehicle isKindOf "I_APC_tracked_03_cannon_F"):
		{
			_vehicle setVehicleAmmoDef 1;

			// Reduce all shells and MG ammo, reset smoke mags
			_vehicle removeMagazineTurret ["1000Rnd_65x39_Belt_Yellow", [0]];
			_vehicle addMagazineTurret ["SmokeLauncherMag", [0,0]];
			_vehicle setVehicleAmmo 0.5;
		};

		// All other helicopters
		case (_vehicle isKindOf "Helicopter"):
		{
			// Cut all ammo by half
			_vehicle setVehicleAmmoDef 0.5;
			_vehicle setFuel 0;
		};
		
		// All planes
		case (_vehicle isKindOf "Plane"):
		{
			_vehicle setVehicleAmmoDef 0.5;
			_vehicle setFuel 0;
		};
	};

	// Reset all flares to 120
	if (_vehicleClass isKindOf "Air") then
	{
		{
			if (["CMFlare", _x] call fn_findString != -1) then
			{
				_vehicle removeMagazinesTurret [_x, [-1]];
			};
		} forEach getArray (configFile >> "CfgVehicles" >> _vehicleClass >> "magazines");

		_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine", [-1]];
	};

	reload _vehicle;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_vehDeterminer = if ("AEIMO" find (_vehicleName select [0,1]) != -1) then { "An" } else { "A" };

	_missionHintText = format ["%1 <t color='%3'>%2</t> has been immobilized, go get it for your team!", _vehDeterminer, _vehicleName, mainMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	_vehicle lock 1;
	_vehicle setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = format ["The %1 has been captured, well done.", _vehicleName];
};

_this call mainMissionProcessor;
