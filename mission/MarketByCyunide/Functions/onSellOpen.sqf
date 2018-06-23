private["_display","_slidesControlGroup","_slideControl","_configName","_itemDisplayName","_buffItem","_index","_buffData"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_slidesControlGroup = _display displayCtrl 4007;
_slideControl = _display ctrlCreate ["XM8SlideCyunideSell", 5160, _slidesControlGroup];
//['cyMachineSell', 0] call ExileClient_gui_xm8_slide; 

lbClear 85162;

if !(primaryWeapon player isEqualTo "") then {
	_configName = (primaryWeapon player) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> (primaryWeapon player) >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> (primaryWeapon player) >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (primaryWeapon player);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 0];
	};
};

if !(secondaryWeapon player isEqualTo "") then {
	_configName = (secondaryWeapon player) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> (secondaryWeapon player) >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> (secondaryWeapon player) >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (secondaryWeapon player);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 0];
	};
};


{
	_configName = (_x) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _x >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> _x >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (_x);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 1];
	};
} forEach uniformItems player;

if (count (uniformItems player) isEqualTo 0) then {
	if !(uniform player isEqualTo "") then {
		_configName = (uniform player) call ExileClient_util_gear_getConfigNameByClassName;
		_itemDisplayName = getText(configFile >> _configName >> (uniform player) >> "displayName");
		if !(_itemDisplayName isEqualTo "") then {
			_index = lbAdd [85162, (_itemDisplayName)];		
			lbSetPicture[85162, _index, getText(configFile >> _configName >> (uniform player) >> "picture")];
			lbSetPictureColor [85162, _index, [1,1,1,1]];
			_buffData = (uniform player);
			lbSetData [85162, _index, _buffData];
			lbSetValue [85162, _index, 7];
		};
	};
};

{
	_configName = (_x) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _x >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> _x >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (_x);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 2];
	};
} forEach vestItems player;

if (count (vestItems player) isEqualTo 0) then {
	if !(vest player isEqualTo "") then {
		_configName = (vest player) call ExileClient_util_gear_getConfigNameByClassName;
		_itemDisplayName = getText(configFile >> _configName >> (vest player) >> "displayName");
		if !(_itemDisplayName isEqualTo "") then {
			_index = lbAdd [85162, (_itemDisplayName)];		
			lbSetPicture[85162, _index, getText(configFile >> _configName >> (vest player) >> "picture")];
			lbSetPictureColor [85162, _index, [1,1,1,1]];
			_buffData = (vest player);
			lbSetData [85162, _index, _buffData];
			lbSetValue [85162, _index, 8];
		};
	};
};

{
	_configName = (_x) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _x >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> _x >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (_x);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 3];
	};
} forEach backpackItems player;

if (count (backpackItems player) isEqualTo 0) then {
	if !(backpack player isEqualTo "") then {
		_configName = (backpack player) call ExileClient_util_gear_getConfigNameByClassName;
		_itemDisplayName = getText(configFile >> _configName >> (backpack player) >> "displayName");
		if !(_itemDisplayName isEqualTo "") then {
			_index = lbAdd [85162, (_itemDisplayName)];		
			lbSetPicture[85162, _index, getText(configFile >> _configName >> (backpack player) >> "picture")];
			lbSetPictureColor [85162, _index, [1,1,1,1]];
			_buffData = (backpack player);
			lbSetData [85162, _index, _buffData];
			lbSetValue [85162, _index, 9];
		};
	};
};

{
	_configName = (_x) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _x >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> _x >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (_x);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 4];
	};
} forEach assignedItems player;

_buffItem = headgear player;
if !(_buffItem isEqualTo "") then {
	_configName = (headgear player) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _buffItem >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> _buffItem >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (_buffItem);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 5];
	};
};

_buffItem = goggles player;
if !(_buffItem isEqualTo "") then {
	_configName = (goggles player) call ExileClient_util_gear_getConfigNameByClassName;
	_itemDisplayName = getText(configFile >> _configName >> _buffItem >> "displayName");
	if !(_itemDisplayName isEqualTo "") then {
		_index = lbAdd [85162, (_itemDisplayName)];		
		lbSetPicture[85162, _index, getText(configFile >> _configName >> _buffItem >> "picture")];
		lbSetPictureColor [85162, _index, [1,1,1,1]];
		_buffData = (_buffItem);
		lbSetData [85162, _index, _buffData];
		lbSetValue [85162, _index, 6];
	};
};

lbSetCurSel [85162, 0];
