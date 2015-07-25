/*
 * Replaces original BIS_fnc_selectRandom for a more "random" one...
 */

private "_rnd";

if (count _this > 0) then
{
    _rnd = (count _this) - 1;
    _rnd = floor (random _rnd);
    _rnd = _this select _rnd;
};
_rnd;