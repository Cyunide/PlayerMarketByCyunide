private["_cyArray","_cyCount","_currentElement","_currentName","_currentPrice","_currendID","_listEntry","_itemInformation","_itemCategory","_itemType","_itemConfig","_index","_itemDisplayName","_needle"];
_cyArray = missionNamespace getVariable "pumba";
_cyCount = (count _cyArray) - 1;
lbClear 85155;
_needle = toLower(_this select 0);

for "_x" from 0 to _cyCount do {
	_currentElement = _cyArray select _x;
	_currentName = (_currentElement select 1);
	_currentPrice = (_currentElement select 2);
	_currendID = (_currentElement select 0);
	_listEntry = format["%1 - %2", _currentName, _currentPrice];
	
	_itemInformation = [(_currentName)] call BIS_fnc_itemType;
	_configName = _currentName call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _currentName >> "displayName");
	if (toLower(_itemDisplayName) find toLower(_needle) >= 0) then {
		_index = lbAdd[85155, format["%1 - %2 Poptabs", (_itemDisplayName), (_currentPrice)]];
		lbSetPicture[85155, _index, getText(configFile >> _configName >> _currentName >> "picture")];
		lbSetPictureColor [85155, _index, [1,1,1,1]];
		lbSetData[85155, _x, (_currendID)];
	};
};
true