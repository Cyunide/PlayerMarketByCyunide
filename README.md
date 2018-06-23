# PlayerMarketByCyunide 1.1
### An addon for Arma 3 Exile

## About

PlayerMarket is an addon for Exile that adds an app to the XM8 tablet that allows players to buy and sell their items. I found that allowing players to have an economy that's driven by other players instead of only having NPC/Traders adds depth, dynamic, and fun to the game! Don't be the server without it!

## What's New

You can now customize the mod! You can set the max global listing limit, max listings per player, min and max sell values!

## Credits

Special thanks to Andrew and the Exile community for an awesome Arma game mode!

## Donation

If you would like to make a donation, do so at http://paypal.me/cyunide

## Upgrading

See ChangeLog.md and UpdateInstructions.md for instructions.

## Install Instructions

#### Step 1: Download & Unzip

When you download the files, you should unzip the file anywhere and you should have 3 folders.

#### Step 2: Copy Server Files

Go into the @ExileServer folder, then into the addons folder. You will see a file called "PlayerMarketByCyunide.pbo". This file needs to be copied to the @ExileServer\addons folder of your server. 

NOTE: You will see a Folder called "PlayerMarketByCyunide" in the same folder as 'PlayerMarketByCyunide.pbo".
This is just the unpacked version of the pbo, you do NOT need to do anything with it. 

#### Step 3: Copy Mission Files

On your server go to the "mpmissions" folder. Whichever map you want to add it to, our example will be Exile.Altis, you need to unpack (unpbo) it.

Go into the Exile.Altis folder (Or whichever map if you used a different one.)
Copy the "MarketByCyunide" from the downloaded file located in \mission\MarketByCyunide.

Copy that folder over and BE SURE TO REPACK YOUR Exile.Altis PBO!

#### Step 4: Database

Import / Execute the playermarket.sql file on your exile database.

#### Step 5: File Edits & Copies

Still in the same folder from the download, find file init.sqf.
In the Exile.Altis folder either copy the init.sqf if it doesnt exist,
or if you have an init.sqf, copy and paste the contents from the download
to the one you already have. (See last image above for reference).

Nice! Now open the description.ext in the downloaded folder,
Copy and paste the contents to your existing description.ext file on your server.
At the VERY end. Not inside any { or }!

Go to the install folder from the download.
It contains 2 files, config.cpp and exile.ini.
Open exile.ini and copy and paste the contents into the exile.ini
Located on your server at @ExileServer\extDB\sql_custom_v2

Finally open config.cpp from the install folder in download.
Follow the instructions, and you are good to go! 
