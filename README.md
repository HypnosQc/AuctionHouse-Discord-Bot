# AuctionHouse-Discord-Bot

This is an Azerothcore-based core script designed to work with any core that utilizes the latest Eluna Lua Engine or Lua Modules. The Lua script utilizes Webhooks to push auction house information to a designated Discord channel. It's compatible with Trinity, Mangos, and other similar cores.

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

### 3. Installation
- Place the `AuctionHouse_Bot.lua` file into your `Core/lua_scripts` folder.

### 4. Finalizing Setup
- Restart your server or use the command `.reload eluna`.
- Objects added to the auction house will now automatically push information to the designated Discord channel.

## Acknowledgement
Special thanks to @Niam5 for fixing and improving the codebase to ensure proper functionality.

Discord embeds improved by ReynoldsCahoon.

Feel free to reach out for any assistance or feedback!
