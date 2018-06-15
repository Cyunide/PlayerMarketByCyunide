///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////

private["_sessionID","_parameters","_playerObject","_playerUID","_itemID","_itemClassName","_itemPrice","_playerMoney","_buff","_tabsleft","_page","_pageSize","_continueLoading","_itemCategory","_itemType","_added","_weaponType","_sellerUID","_sellerCurrentLocker"];

_sessionID = _this select 0;
_parameters = _this select 1;

try {
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then {
		throw 1;
	};
	if !(alive _playerObject) then {
		throw 2;
	};	
	_playerUID = _playerObject getVariable ["ExileOwnerUID", -1];
	// At this point we have the users ID and UID etc. Now get the parameter.
	_itemID = _parameters select 0;
	// We have the item ID, lets get its info from the database
	_cyRet = format["loadMarketSingleItem:%1", _itemID] call ExileServer_system_database_query_selectFull;
	_cyRetCount = count _cyRet;
	if (_cyRetCount == 1) then {
		_buff = _cyRet select 0;
		_itemClassName = _buff select 0;
		_itemPrice = parseNumber(_buff select 1);
		_sellerUID = _buff select 2;
		_playerMoney = _playerObject getVariable ['ExileMoney', 0];
		_sellerCurrentLocker = format["getLocker:%1", _sellerUID] call ExileServer_system_database_query_selectSingle;
		_sellerCurrentLocker = _sellerCurrentLocker select 0;
		if (_playerMoney >= _itemPrice) then {
			if (_playerObject canAdd _itemClassName) then {	
				// Good can afford and add to inventory
				//_playerObject addItem _itemClassName;
				[_playerObject, _itemClassName] call ExileClient_util_playerCargo_add;
				// Update the list
				format["removeFromPlayerMarket:%1", _itemID] call ExileServer_system_database_query_fireAndForget;
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
				// charge pop tabs
				_tabsleft = _playerMoney - _itemPrice;
				_playerObject setVariable ["ExileMoney", _tabsleft, true];
				format["setPlayerMoney:%1:%2", _tabsleft, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
				 //_playerObject setVariable ['ExileLocker', 1337, true];
				format["updateLocker:%1:%2", _sellerCurrentLocker + _itemPrice, _sellerUID] call ExileServer_system_database_query_fireAndForget;
				// finally reply to client
				[_sessionID, "getItemGUIResponse", [0, _itemClassName]] call ExileServer_system_network_send_to;
				
			} else {
				// Not enough space in inventory is there a slot?
				diag_log "Not enough space in bags checking inventory slots...";
				_added = false;
				_itemInformation = [_itemClassName] call BIS_fnc_itemType;
				_itemCategory = _itemInformation select 0;
				_itemType = _itemInformation select 1;
				
				switch (_itemCategory) do {
					case "Weapon": {
						_weaponType = getNumber( configFile >> "CfgWeapons" >> _itemClassName >> "type"); 
						switch (_weaponType) do {
							case 1: {
								if ((primaryWeapon _playerObject) isEqualTo "") then {
									_playerObject addWeaponGlobal _itemClassName;
									removeAllPrimaryWeaponItems _playerObject;
									_added = true;
								};
							};
							case 4: {
								if ((secondaryWeapon _playerObject) isEqualTo "") then {
									_playerObject addWeaponGlobal _itemClassName;
									_added = true;
								};
							};
							case 2: {
								if ((handgunWeapon _playerObject) isEqualTo "") then {
									_playerObject addWeaponGlobal _itemClassName;
									removeAllHandgunItems _player;
									_added = true;
								};
							};
						};					
					};
					case "Equipment": {
						switch (_itemType) do {
							case "Glasses": {
								if ((goggles _playerObject) isEqualTo "") then {
									_playerObject linkItem _itemClassName;
									_added = true;
								};
							};
							case "Headgear": {
								if ((headgear _playerObject) isEqualTo "") then {
									_playerObject addHeadgear _itemClassName;
									_added = true;
								};
							};
							case "Vest": {
								if ((vest _playerObject) isEqualTo "") then {
									_playerObject addVest _itemClassName;
									_added = true;
								};
							};
							case "Uniform": {
								if ((uniform _playerObject) isEqualTo "") then {
									_playerObject forceAddUniform _itemClassName;
									_added = true;
								};
							};
							case "Backpack": {
								if ((backpack _playerObject) isEqualTo "") then {
									_playerObject addBackpackGlobal _itemClassName;
									_added = true;
								};
							};
						};
					};
				};
				if (_added) then {
					// Update the list
					format["removeFromPlayerMarket:%1", _itemID] call ExileServer_system_database_query_fireAndForget;
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
					// charge pop tabs
					_tabsleft = _playerMoney - _itemPrice;
					_playerObject setVariable ["ExileMoney", _tabsleft, true];
					format["setPlayerMoney:%1:%2", _tabsleft, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
					//_playerObject setVariable ['ExileLocker', 1337, true];
					format["updateLocker:%1:%2", _sellerCurrentLocker + _itemPrice, _sellerUID] call ExileServer_system_database_query_fireAndForget;
					[_sessionID, "getItemGUIResponse", [0, _itemClassName]] call ExileServer_system_network_send_to;
				} else {
					[_sessionID, "getItemGUIResponse", [1, _itemClassName]] call ExileServer_system_network_send_to;
				};				
			};
		} else {
			[_sessionID, "getItemGUIResponse", [2, _itemClassName]] call ExileServer_system_network_send_to; // Not enough pop tabs
		};
	} else {
		[_sessionID, "getItemGUIResponse", [3, _itemClassName]] call ExileServer_system_network_send_to;
	};

} catch {
	// crap
	[_sessionID, "getItemGUIResponse", [3, _itemClassName]] call ExileServer_system_network_send_to;
};


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
