///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////
private["_sellPrice","_itemDisplayName","_itemClassName","_myUID","_aOne","_cyArray","_cyCount","_cyRet","_cyRetCount","_page","_pageSize","_continueLoading","_sessionID","_itemLocation"];
_sessionID = _this select 0;
_aOne = _this select 1;

_sellPrice = _aOne select 2;
_itemDisplayName = _aOne select 1;
_itemClassName = _aOne select 0;
_myUID = _aOne select 3;
_itemLocation = _aOne select 4;

// Insert the item in the database
_cyRet = format["insertPlayerMarketSellRow:%1:%2:%3:%4", (_itemClassName), (_itemDisplayName), (_sellPrice), (_myUID)] call ExileServer_system_database_query_fireAndForget;

// Then update the variable
_page = 0;
_pageSize = 50;
_continueLoading = true;
_cyArray = [];

while {_continueLoading} do {
	_cyRet = format["loadMarketItems:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_cyRetCount = count _cyRet;
	if(_cyRetCount > 0) then {
		for "_i" from 0 to _cyRetCount - 1 do {
			_buffArrray = [((_cyRet select _i) select 0), ((_cyRet select _i) select 1), ((_cyRet select _i) select 2)];
			_cyArray pushBack _buffArrray;
		};
	};
	_page = _page + 1;	
	if(_cyRetCount < 50) then {
		_continueLoading = false;
	};
};

missionNamespace setVariable ["pumba", _cyArray, true];

// Finally, return to user
[_sessionID, "listPlayerMarketResponse", [(_itemLocation)]] call ExileServer_system_network_send_to;