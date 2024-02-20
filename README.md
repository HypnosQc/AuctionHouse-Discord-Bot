Big thanks to @Niam5 for fixing and redoing code base to make it work properly!!



# AuctionHouse-Discord-Bot
Azerothcore based core script.
Can be used on every core that use latest from today Eluna Lua Engine / Lua Modules
Lua script that use Webhook to push the information! Trinity ,Mangos and all the others 😏👌

# [1] create an Webhook into your Discord Server.
[1] https://ibb.co/MM1WzTG

# [2] Second Image
[2] https://ibb.co/QMsJBB7

# [3] Last Image (Copy the Webhook url)
[3] https://ibb.co/vQm0Xb7

[3] Change your Bot name
[3] Direct the message to the specific channel of your choice
[3] + you can change his avatar in here too
[3] DONT FORGET SAVE THE WEBHOOK URL FOR NEXT STEP !!!!!

# DOWNLOADING THE LUA BOT FILES
1.Make sure your server use Eluna lua.

2.Edit AuctionHouse_Bot.lua and replace 
# line 2 auctionWebhookURL = "YOUR_WEBHOOK_URL",
# YOUR_WEBHOOK_URL by your WEBHOOKURL Exemple

auctionWebhookURL = "YOUR_WEBHOOK_URL",

to

auctionWebhookURL = "https://discord.com/api/webhooks/1209285815771992114/ILp_CrQINbruBCCh_M-FvWi4UfpQeN0mk0GMRtXXRQQQKM08iXXMf8KasWi2rBbEvx_A",

3.Put the AuctionHouse_Bot.lua into your Core/lua_scripts folder.

4.Restart server or .reload eluna

5.Add Object into auctionhouse should push the informations into the discord channel selected.
