private["_display","_slidesControlGroup","_slideControl","_configName","_itemDisplayName","_buffItem","_index","_buffData"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_slidesControlGroup = _display displayCtrl 4007;
_slideControl = _display ctrlCreate ["XM8SlideCyunide", 85150, _slidesControlGroup];
['cyMachine', 1] call ExileClient_gui_xm8_slide; 
[] execVM 'MarketByCyunide\Functions\onOpen.sqf';