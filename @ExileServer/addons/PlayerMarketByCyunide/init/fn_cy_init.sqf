///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Server Mod Init
// Copyright ©2018
///////////////////////////////////////////////////////////////

private["_cyArray","_cyCount","_cyRet","_cyRetCount","_page","_pageSize","_continueLoading"];

_page = 0;
_pageSize = 50;
_continueLoading = true;
_cyArray = [];

while {_continueLoading} do {
	_cyRet = format["loadMarketItems:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_cyRetCount = count _cyRet;
	if(_cyRetCount > 0) then {
		for "_i" from 0 to _cyRetCount - 1 do {
			_buffArrray = [((_cyRet select _i) select 0), ((_cyRet select _i) select 1), ((_cyRet select _i) select 2), ((_cyRet select _i) select 3)];
			_cyArray pushBack _buffArrray;
		};
	};
	_page = _page + 1;	
	if(_cyRetCount < 50) then {
		_continueLoading = false;
	};
};

missionNamespace setVariable ["pumba", _cyArray, true];