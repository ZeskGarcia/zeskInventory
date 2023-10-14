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
    end, '')
end