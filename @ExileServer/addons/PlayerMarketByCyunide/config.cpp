///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Server Config File
// Copyright ©2018
///////////////////////////////////////////////////////////////

class CfgPatches
{
	class PlayerMarketByCyunide
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};

class CfgFunctions {
	class PlayerMarketByCyunide {
		class main {
			file = "PlayerMarketByCyunide\bootstrap";
			class preInit {
				preInit = 1;
			};
			class postInit {
				postInit = 1;
			};
		};
	};
};