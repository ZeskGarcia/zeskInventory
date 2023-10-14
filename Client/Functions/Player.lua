Player = {}
Player.Functions = {}

Player.Functions.OpenInventory = function()
    Shared.Functions.triggerServerCallback(GetCurrentResourceName() .. ":getPlayerInventory", function(inventory)
        if (inventory and inventory.success) then
            sendNuiMessage('showInventory', {
                inventoryItems = inventory.response
            })
        else
            print("Failed getting player inventory")
        end
    end, nil)
end

Player.Functions.CloseInventory = function()
    sendNuiMessage('closeInventory', {})
end

Player.Functions.removeInventoryItem = function(player, item)
    local targetedPlayer
    if (player and item) then
        targetedPlayer = player
    elseif (player == nil and item) then
        targetedPlayer = nil
    else
        print("Item or Player must be specified")
        return    
    end
    
    Shared.Functions.triggerServerCallback(GetCurrentResourceName() .. ":removeInventoryItem", function(response)
        if (response and response.success) then
            print("Successfully remove item from player inventory")
        else
            print("Couldn't Remove the item from the inventory")
        end
    end, {
        targetPlayer = targetedPlayer,
        item = item
    })
end