//////////////////////////////
// Player Market By Cyunide
// Prepare Client Request
//////////////////////////////

private["_itemID"];
_itemID = [_this,0,nil] call BIS_fnc_param;
if (isNil "_itemID") then {
	throw 1;
};

["getItemGUIRequest", [_itemID]] call ExileClient_system_network_send;
	
true
