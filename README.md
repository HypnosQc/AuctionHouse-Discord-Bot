# AuctionHouse-Discord-Bot

This is an Azerothcore-based core script designed to work with any core that utilizes the latest Eluna Lua Engine or Lua Modules. The Lua script utilizes Webhooks to push auction house information to a designated Discord channel. It's compatible with Trinity, Mangos, and other similar cores.

![image](https://github.com/MithrasOfficial/AuctionHouse-Discord-Bot/assets/2556251/0594dfe7-858a-4c3f-b630-f5aaeec4b5a3)

## Setup Instructions

### 1. Setting Up Discord Webhook
- First, create a Webhook in your Discord Server.
  - Follow this [link](https://ibb.co/MM1WzTG) for instructions.
  - Additionally, refer to the second image [here](https://ibb.co/QMsJBB7).
  - Copy the Webhook URL from the last image [here](https://ibb.co/vQm0Xb7).

### 2. Configuring the Bot
- Modify the Lua script `AuctionHouse_Bot.lua`:
  - Replace `YOUR_WEBHOOK_URL` in line 2 with your actual Webhook URL.
    - For example:
      ```lua
      auctionWebhookURL = "https://discord.com/api/webhooks/1209285815771992114/ILp_CrQINbruBCCh_M-FvWi4UfpQeN0mk0GMRtXXRQQQKM08iXXMf8KasWi2rBbEvx_A",
      ```

### 3. Import Item Display Data to your World Database
By default `thumbnailIcons` is set to `true`. This requires that your `itemdisplayinfo.dbc` data is imported into your world database. This DBC contains the name of the icon images used by each item. Without it, the script has no way of knowing which icons to display.

You can forego this step by setting `thumbnailIcons` to `false` in the `auctionConfig`, but your embeds will not have thumbnail icons.

If you have custom icons on your server, it will be necessary to host your icons yourself and set the `itemIconDB` to a web accessible URI.

### 4. Installation
- Place the `AuctionHouse_Bot.lua` file into your `Core/lua_scripts` folder.

### 5. Finalizing Setup
- Restart your server or use the command `.reload eluna`.
- Objects added to the auction house will now automatically push information to the designated Discord channel.

## Acknowledgement
Special thanks to @Niam5 for fixing and improving the codebase to ensure proper functionality.

Discord embeds improved by ReynoldsCahoon.

Feel free to reach out for any assistance or feedback!
