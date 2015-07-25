// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);

_defaultVest = "V_Rangemaster_Belt";
_headGearBlufor = ["H_MilCap_dgtl", "H_MilCap_mcamo", "H_Watchcap_camo", "H_Watchcap_khk"];
_headGearOpfor = ["H_Bandanna_camo", "H_Bandanna_khk", "H_Beret_ocamo"];
_headGearIndependent = ["H_Booniehat_dgtl", "H_Booniehat_indp", "H_Shemag_olive", "H_Shemag_khk", "H_MilCap_dgtl", "H_MilCap_mcamo"];
_vestIndependent = ["U_I_OfficerUniform"];

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_B_Ghilliesuit" };
				if (_item == "vest") then { _result = _defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_B_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherB" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "U_B_CombatUniform_mcam" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _headGearBlufor call BIS_fnc_selectRandom; };
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_O_Ghilliesuit" };
				if (_item == "vest") then { _result = _defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_O_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIR" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "U_O_OfficerUniform_ocamo" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _headGearOpfor call BIS_fnc_selectRandom; };
	};
	default
	{
		switch (true) do
		{
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_I_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIA" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = _vestIndependent call BIS_fnc_selectRandom };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _headGearIndependent call BIS_fnc_selectRandom; };
	};
};

_result
