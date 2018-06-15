private["_sellPrice","_itemDisplayName","_itemClassName","_myUID","_itemLocation","_listGood","_cyRet","_cyRetCount"];
_sellPrice = ctrlText 85165;
_itemDisplayName = lbText[85162, lbCurSel 85162];
_itemClassName = lbData[85162, lbCurSel 85162];
_itemLocation = lbValue[85162, lbCurSel 85162];
_myUID = getPlayerUID player;

//disableUserInput true;
// First of check the sell price
_sellPrice = _sellPrice call BIS_fnc_parseNumber;
_sellPrice = round _sellPrice;
if (_sellPrice <= 0) then {
	systemChat "Error: Sell price must be a number greater than 0.";
	disableUserInput false;
} else {
	_listGood = true;
	//if (CyPM_MAX_LISTINGS >= 0) then {
		_cyRet = ["countAllMarketListings"] call ExileServer_system_database_query_selectSingle;
		systemChat format["result is %1", (_cyRet)];
		//_cyRetCount = _cyRet select 0;
		//systemChat format["there are %1 rows", _cyRetCount];
	//}


	//["listItemPlayerMarketRequest", [_itemClassName, _itemDisplayName, (_sellPrice), _myUID, (_itemLocation)]] call ExileClient_system_network_send;
};

