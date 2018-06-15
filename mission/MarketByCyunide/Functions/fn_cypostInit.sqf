_path = "MarketByCyunide\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "CyPM_MAX_LISTINGS") then { CyPM_MAX_LISTINGS = -1; };
if(isNil "CyPM_MAX_LISTINGS_USER") then { CyPM_MAX_LISTINGS_USER = -1; };
if(isNil "CyPM_MAX_SELL_AMOUNT") then { CyPM_MAX_SELL_AMOUNT = -1; };
if(isNil "CyPM_MIN_SELL_AMOUNT") then { CyPM_MIN_SELL_AMOUNT = -1; };