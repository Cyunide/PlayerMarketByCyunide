////// This needs added to class CfgXM8 in config.cpp mission file
class cyMachine	{
	controlID = 85150;
	appID = "App05";
	title = "Player Market By Cyunide";
};

class cyMachineSell {
	controlID = 85160;
	title = "Player Market By Cyunide Sell";
};

////// Set the button text like this
class XM8_App05_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\poptab_ca.paa";
    text = "Player Market";
    onButtonClick = "['cyMachine', 0] call ExileClient_gui_xm8_slide;";
    resource = "XM8SlideCyunide";
};

////// Add this to your config.cpp file at end (Or in existing CfgNetworkMessages if you have it!
////// This class may already be defined in your config.cpp, do a search!
 class CfgNetworkMessages
{
    class getItemGUIRequest
    {
        module="system_transport";
        parameters[]=
        {
            "STRING"
        };
    };
   
    class getItemGUIResponse
    {
        module="system_transport";
        parameters[]=
        {
            "SCALAR",
            "STRING"
        };
    };
	
	class listItemPlayerMarketRequest
    {
        module="system_transport";
        parameters[]=
        {
            "STRING",
			"STRING",
			"SCALAR",
			"STRING",
			"SCALAR"
        };
    };
	
	class listPlayerMarketResponse {
		module="system_transport";
		parameters[]= { "SCALAR" };
	};	
}

////// This needs added to the very end of config.cpp of mission file

class XM8SlideCyunideSell: RscExileXM8Slide
{
	idc = 85160;
	class Controls {
		class cyLblSellItemTitle: RscExileXM8Text
{
	idc = 85161;
	text = "Sell An Item: (WARNING! Listing an item will remove all attatchments on it! They will be lost!)"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 31 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class cylstSellInventory: RscExileXM8Listbox
{
	idc = 85162;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 31 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class cybtnSellGoBack: RscExileXM8ButtonMenu
{
	idc = 85163;
	text = "Go Back"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[] execVM 'MarketByCyunide\Functions\onSellGoBack.sqf';";
};
class cylblSellPrice: RscExileXM8Text
{
	idc = 85164;
	text = "Sell Price:"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class cytxtSellPrice: RscExileXM8Edit
{
	idc = 85165;
	text = "0"; //--- ToDo: Localize;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Amount of pop tabs to sell your item for."; //--- ToDo: Localize;
};
class cybtnSellNow: RscExileXM8ButtonMenu
{
	idc = 85166;
	text = "List Item For Sale"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[] execVM 'MarketByCyunide\Functions\fn_ListItem.sqf';";
};
	};
};

class XM8SlideCyunide: RscExileXM8Slide
{
	idc = 85150;
	class Controls 
	{
		// START PASTE
class cylbl_Title: RscExileXM8Text
{
	idc = 85151;
	text = "Player Market"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class cybtnRefresh: RscExileXM8ButtonMenu
{
	idc = 85152;
	text = "Refresh"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[] execVM 'MarketByCyunide\Functions\onOpen.sqf';";
	
};
class cytxtSearchText: RscExileXM8Edit 
{
	idc = 85153;
	text = "";
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class cybtnSearch: RscExileXM8ButtonMenu
{
	idc = 85154;
	text = "Search"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	 onButtonClick = [(ctrlText 85153)] call CyFs_fnc_doSearch;
	
};
class cylstItems: RscExileXM8Listbox
{
	idc = 85155;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 30.5 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	//onLBSelChanged = "_sTxt = lbText[1500, lbCurSel 1500]; hint _sTxt; systemChat lbData[1500, lbCurSel 1500];";
};
class cyBtnGoBack: RscExileXM8ButtonMenu
{
	idc = 85156;
	text = "Go Back"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "['extraApps', 1] call ExileClient_gui_xm8_slide";
};
class cybtnSellAnItem: RscExileXM8ButtonMenu
{
	idc = 85157;
	text = "Sell An Item"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[] execVM 'MarketByCyunide\Functions\onSellOpenFirst.sqf';";
};
class cybtnBuyItNow: RscExileXM8ButtonMenu
{
	idc = 85158;
	text = "Buy Item"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = [(lbData[85155, lbCurSel 85155])] call CyFs_fnc_RequestBuy;
};
		// END PASTE
	};
};

