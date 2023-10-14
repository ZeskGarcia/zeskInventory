Shared.Functions.registerServerCallback(GetCurrentResourceName() .. ":getPlayerInventory", function(playerId, invPlayer, cb)
    local inventory
    if (invPlayer == nil) then
        inventory = Player.Functions.getPlayerInventory(playerId)
    else
        inventory = Player.Functions.getPlayerInventory(invPlayer)
    end
    cb(inventory)
end)