/*
 * This function disables simulation for vehicles to don't use Physix until a player uses/damages/etc them.
 * The function waits some seconds before disable Physix, to let the vehicle touch the ground when spawned.
 * It should be called using spawn, not call, or it will hang your script for some seconds.
 * 
 * Author: [SGC] Ankso
 */

_eventsList = ["Dammaged", "Engine", "EpeContactStart", "Explosion", "HandleDamage", "Hit", "Killed", "GetIn"];

sleep 5;

// Disable Physix to don't waste server resources
_this enableSimulationGlobal false;

// Re-enable Physix if the vehicle is used/damaged/killed etc
{
    _this addEventHandler [_x, {
        (_this select 0) enableSimulationGlobal true;
        (_this select 0) removeAllEventHandlers "Dammaged";
        (_this select 0) removeAllEventHandlers "Engine";
        (_this select 0) removeAllEventHandlers "EpeContactStart";
        (_this select 0) removeAllEventHandlers "Explosion";
        (_this select 0) removeAllEventHandlers "HandleDamage";
        (_this select 0) removeAllEventHandlers "Hit";
        (_this select 0) removeAllEventHandlers "Killed";
        (_this select 0) removeAllEventHandlers "GetIn";
        (_this select 0) setVariable ["A3W_handleDamageEH", (_this select 0) addEventHandler ["HandleDamage", vehicleHandleDamage]];
        (_this select 0) setVariable ["A3W_dammagedEH", (_this select 0) addEventHandler ["Dammaged", vehicleDammagedEvent]];
    }];
} forEach _eventsList;
