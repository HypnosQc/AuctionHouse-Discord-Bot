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

    local goldBid, silverBid, copperBid = ConvertCopperToGoldSilverCopper(startBid)
    local priceStringBid = string.format("[%d Gold %02d Silver %02d Copper]", goldBid, silverBid, copperBid)

    local goldBuyout, silverBuyout, copperBuyout = ConvertCopperToGoldSilverCopper(buyout)
    local priceStringBuyout = string.format("[%d Gold %02d Silver %02d Copper]", goldBuyout, silverBuyout, copperBuyout)

    local hours, minutes = ConvertSecondsToReadableTime(remainingTime)
    local timeString = remainingTime > 0 and string.format("%d hours %d minutes", hours, minutes) or "Auction ended"

    if buyout >= 1 then
        message = string.format("[%s] has listed [%s] with a starting bid of %s and a buyout price of %s. Time left: %s", owner:GetName(), item:GetName(), priceStringBid, priceStringBuyout, timeString)
    else
        message = string.format("[%s] has listed [%s] with a starting bid of %s. Time left: %s", owner:GetName(), item:GetName(), priceStringBid, timeString)
    end
    SendDiscordMessage(message, auctionConfig.auctionWebhookURL)
end

-- Register the event handler for AUCTION_EVENT_ON_ADD
RegisterServerEvent(26, OnAuctionAdd)