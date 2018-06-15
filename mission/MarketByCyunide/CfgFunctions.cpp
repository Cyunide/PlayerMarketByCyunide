///////////////////////////////////////////////////////////////
// Player Market By Cyunide
// Copyright ©2018
///////////////////////////////////////////////////////////////
class CyFs { 
	tag = "CyFs";
	class Functions {
		file = "MarketByCyunide\Functions";
		class RequestBuy {};
		class doSearch {};
		class cypostInit { postInit = 1; };
	};
};

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