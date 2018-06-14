///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////
_responseCode = _this select 0;
_itemClassName = _this select 1;
 
// _responseCode isEqualTo 0
switch (_responseCode) do {
	case 0:
	{ 
	systemChat "Item purchased!";
	lbDelete [85155, lbCurSel 85155];
	};
	
	case 1:
	{ systemChat "Error: You do not have enough space to purchase this item."; };
		
	case 2:
	{ systemChat "Error: You do not have enough Poptabs to purchase this item."; };
	
	case 3:
	{ 
	systemChat "Error: This item no longer exists on the Market."; 
	lbDelete [85155, lbCurSel 85155];
	};
	
	case 42: { systemChat "TEST LOOP COMPLETE!"; };
	
};
 
