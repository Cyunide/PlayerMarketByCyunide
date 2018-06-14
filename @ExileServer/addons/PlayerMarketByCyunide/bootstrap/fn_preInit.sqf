///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_system_transport_network_getItemGUIRequest', 'PlayerMarketByCyunide\functions\ExileServer_system_transport_network_getItemGUIRequest.sqf'],
	['ExileServer_system_transport_network_listItemPlayerMarketRequest', 'PlayerMarketByCyunide\functions\ExileServer_system_transport_network_listItemPlayerMarketRequest.sqf'],
    ['PlayerMarketByCyunide_init', 'PlayerMarketByCyunide\functions\PlayerMarketByCyunide_init.sqf']
];

call PlayerMarketByCyunide_init;