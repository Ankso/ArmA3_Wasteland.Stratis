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

_defaultVest = "rhs_6sh46";
_headGearBlufor = ["rhs_fieldcap_ml", "rhsusf_patrolcap_ucp"];
_headGearOpfor = ["H_Bandanna_camo", "H_Bandanna_khk", "H_Beret_ocamo", "rhs_beanie_green"];
_headGearIndependent = ["H_Booniehat_dgtl", "H_Booniehat_indp"];
_vestIndependent = ["rhs_vest_commander"];

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
				if (_item == "uniform") then { _result = "rhs_uniform_cu_ocp" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _headGearBlufor call SGC_fnc_selectRandom; };
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
				if (_item == "uniform") then { _result = "rhs_uniform_m88_patchless" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _headGearOpfor call SGC_fnc_selectRandom; };
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
				if (_item == "uniform") then { _result = _vestIndependent call SGC_fnc_selectRandom };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _headGearIndependent call SGC_fnc_selectRandom; };
	};
};

_result
