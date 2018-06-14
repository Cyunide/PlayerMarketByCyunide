private["_responseCode","_itemClassName"];

_responseCode = _this select 0;
_itemClassName = lbData[85162, lbCurSel 85162];
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
};
lbDelete [85162, lbCurSel 85162];

disableUserInput false;
systemChat "Item listed on Player Market!";
