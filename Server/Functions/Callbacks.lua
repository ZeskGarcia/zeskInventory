Shared.Functions.registerServerCallback(GetCurrentResourceName() .. ":getPlayerInventory", function(playerId, invPlayer, cb)
    local inventory

    if (invPlayer == nil) then
        inventory = Player.Functions.getPlayerInventory(playerId)
    else
        inventory = Player.Functions.getPlayerInventory(invPlayer)
    end

    cb(inventory)
end)

Shared.Functions.registerServerCallback(GetCurrentResourceName() .. ":removeInventoryItem", function(playerId, invData, cb)
    local targetPlayer
    local removeItem

    if (invData and invData.targetPlayer == nil) then
        targetPlayer = playerId
    elseif (invData and invData.targetPlayer) then
        targetPlayer = invData.targetPlayer
    end

    if (invData and invData.item and invData.item ~= nil) then
        removeItem = invData.item
    else
        print("ITEM Not specified")
        return
    end

    local removedItemResponse = Player.Functions.removeInventoryItem(removeItem, targetPlayer)

    cb(removedItemResponse)
end)