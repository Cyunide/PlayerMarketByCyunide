private["_sellPrice","_itemDisplayName","_itemClassName","_myUID","_itemLocation"];
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
	["listItemPlayerMarketRequest", [_itemClassName, _itemDisplayName, (_sellPrice), _myUID, (_itemLocation)]] call ExileClient_system_network_send;
};

