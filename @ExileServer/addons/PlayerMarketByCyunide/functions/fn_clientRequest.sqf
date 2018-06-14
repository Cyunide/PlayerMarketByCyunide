///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////

private["_payload","_messageName","_messageParameters","_allowedParameters","_message","_exception","_itemID","_uid","_playerMoney"];
_payload = _this;
try {
	// Begin sanatize and check
	if (isNil "_payload") then {
		diag_log format["Message payload is not defined! %1", time];
	};
	_messageName = _payload select 0;
	_messageParameters = _payload select 1;
	
	if !(isClass (configFile >> "CfgNetworkMessages" >> _messageName)) then {
		diag_log format["BLOCKED CUZ NOT CONFIGGED!. Payload: %1", _payload];
	};
	_allowedParameters = getArray(configFile >> "CfgNetworkMessages" >> _messageName >> "parameters");
	_uid = _messageParameters select 1;
	
	//  End sanatize and check
	
	// Begin doit!
	_targetPlayerObject = _uid call ExileClient_util_player_objectFromPlayerUID;
	// Check if has enough pop tabs
	_playerMoney = _targetPlayerObject getVariable ['ExileMoney', 0];
	
} catch {
	// debug handler
};
true

