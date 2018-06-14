_path = "MarketByCyunide\customize.sqf"";
call compile preprocessFileLineNumbers _path;

// Make sure that if customize.sqf got mucked up, still proceed with defaults
if(isNil "CyPM_MAX_LISTINGS") then { CyPM_MAX_LISTINGS = -1; }
if(isNil "CyPM_MAX_LISTINGS_USER") then { CyPM_MAX_LISTINGS_USER = -1; }
if(isNil "CyPM_MAX_SELL_AMOUNT") then { CyPM_MAX_SELL_AMOUNT = -1; }
if(isNil "CyPM_MIN_SELL_AMOUNT") then { CyPM_MIN_SELL_AMOUNT = -1; }