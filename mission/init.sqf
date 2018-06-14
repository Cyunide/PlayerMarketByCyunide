///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////

waitUntil {!isNull (findDisplay 46)};
{
    _x params [['_function',''],['_file','']];
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function,_code];
} 
forEach
[
   ['ExileClient_system_transport_network_getItemGUIResponse','MarketByCyunide\Functions\ExileClient_system_transport_network_getItemGUIResponse.sqf'],
   ['ExileClient_system_transport_network_listPlayerMarketResponse','MarketByCyunide\Functions\ExileClient_system_transport_network_listPlayerMarketResponse.sqf'],
   ['ExileClient_gui_xm8_slide_cyMachine_onOpen','MarketByCyunide\Functions\onOpen.sqf'],
   ['ExileClient_gui_xm8_slide_cyMachineSell_onOpen','MarketByCyunide\Functions\onSellOpen.sqf']
   
];

