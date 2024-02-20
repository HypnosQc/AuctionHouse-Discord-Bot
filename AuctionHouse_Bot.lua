-- Credits Mithras & Niam5 for code functions --

local auctionConfig = {
    auctionWebhookURL = "YOUR_WEBHOOK_URL",
    lastCheckedTimestamp = 0
}

local function SendDiscordMessage(message, webhookURL)
    local postData = '{"content": "'..message..'"}'
    local curlCommand = 'curl -X POST -H "Content-Type: application/json" -d @- '..webhookURL
    local curlProcess = io.popen(curlCommand, 'w')
    curlProcess:write(postData)
    curlProcess:close()
end

local function ConvertCopperToGoldSilverCopper(copper)
    local gold = math.floor(copper / 10000)
    local remaining = copper % 10000
    local silver = math.floor(remaining / 100)
    local remainingCopper = remaining % 100
    return gold, silver, remainingCopper
end

local function ConvertSecondsToReadableTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    return hours, minutes
end

local function OnAuctionAdd(event, auctionId, owner, item, expireTime, buyout, startBid, currentBid, bidderGUIDLow)
    local remainingTime = expireTime - os.time()

    -- Get the count of the item
    local itemCount = item:GetCount()

    -- Convert start bid and buyout to gold, silver, and copper
    local goldBid, silverBid, copperBid = ConvertCopperToGoldSilverCopper(startBid)
    local goldBuyout, silverBuyout, copperBuyout = ConvertCopperToGoldSilverCopper(buyout)

    -- Format bid and buyout prices
    local priceStringBid = string.format("[%d Gold %02d Silver %02d Copper] ", goldBid, silverBid, copperBid)
    local priceStringBuyout = string.format("[%d Gold %02d Silver %02d Copper] ", goldBuyout, silverBuyout, copperBuyout)

    -- Convert remaining time to readable format
    local hours, minutes = ConvertSecondsToReadableTime(remainingTime)
    local timeString = remainingTime > 0 and string.format("%d hours %d minutes", hours, minutes) or "Auction ended"

    -- Construct the message including item count
    if buyout >= 1 then
        message = string.format("[%s] has listed [%s x%d] with a starting bid of %s and a buyout price of %s. Time left: %s", owner:GetName(), item:GetName(), itemCount, priceStringBid, priceStringBuyout, timeString)
    else
        message = string.format("[%s] has listed [%s x%d] with a starting bid of %s. Time left: %s", owner:GetName(), item:GetName(), itemCount, priceStringBid, timeString)
    end

    -- Send the message to Discord
    SendDiscordMessage(message, auctionConfig.auctionWebhookURL)
end

-- Register the event handler for AUCTION_EVENT_ON_ADD
RegisterServerEvent(26, OnAuctionAdd)
