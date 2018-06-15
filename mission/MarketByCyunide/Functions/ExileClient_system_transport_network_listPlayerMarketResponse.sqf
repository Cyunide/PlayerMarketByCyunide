private["_responseCode","_itemClassName","_added"];

_responseCode = _this select 0;
_itemClassName = lbData[85162, lbCurSel 85162];
_added = true;
// remove the item from the player
switch (_responseCode) do {
	case 0:
	{ 
		player removeWeaponGlobal _itemClassName;
	};	
	case 1:
	{ 
		player removeItemFromUniform _itemClassName;
	};
	case 2:
	{ 
		player removeItemFromVest _itemClassName;
	};
	case 3:
	{ 
		player removeItemFromBackpack _itemClassName;
	};
	case 4:
	{ 
		player unassignItem _itemClassName;
		player removeItem _itemClassName;
	};
	case 5:
	{ 
		removeHeadgear player;
	};
	case 6:
	{ 
		removeGoggles player;
	};
	case 7:
	{ 
		removeUniform player;
	};
	case 8:
	{ 
		removeVest player;
	};
	case 9:
	{ 
		removeBackpackGlobal player;
	};
	case 77:
	{
		systemChat "Max amount of listings already created. Please try again later.";
		_added = false;
	};
	case 78:
	{
		systemChat "You cannot sell an item for that many poptabs, please lower the amount.";
		_added = false;
	};
	case 79:
	{
		systemChat "You cannot sell an item for that many poptabs, please raise the amount.";
		_added = false;
	};
	case 80:
	{
		systemChat "You cannot create any more listings until your existing ones have sold.";
		_added = false;
	};
};

if (_added) then{
	lbDelete[85162, lbCurSel 85162];

	disableUserInput false;
	systemChat "Item listed on Player Market!";
};
