Player = {}
Player.Functions = {}

Player.Functions.getPlayerInventory = function(playerId)
  local xPlayer = nil
  local src = source
  
  if (Config.Framework and string.upper(Config.Framework) == "ESX") then
    if (playerId) then
      xPlayer = Framework.GetPlayerFromId(playerId)
    else
      xPlayer = Framework.GetPlayerFromId(src)
    end

    if (xPlayer ~= nil) then
      local inventoryContent = xPlayer.getInventory()
  
      return { success = true, response = inventoryContent }
    else
      return { success = false, message = "Player Not Found" }
    end
  end
end

Player.Functions.removeInventoryItem = function(item, playerId)
  local xPlayer = nil
  local src = source

  if (Config.Framework and string.upper(Config.Framework) == "ESX") then
    if (playerId) then
      xPlayer = Framework.GetPlayerFromId(playerId)
    else
      xPlayer = Framework.GetPlayerFromId(src)
    end
    
    if (xPlayer ~= nil) then
      local checkItem = xPlayer.getInventoryItem(item)
      if (checkItem and checkItem.count > 0) then
        local currentItemCount = checkItem.count
        xPlayer.removeInventoryItem(item, 1)
        checkItem = xPlayer.getInventoryItem(item)
        if (checkItem and (checkItem.count == (currentItemCount - 1))) then
          return { success = true, message = "Succesfully Removed Item from Player's Inventory" }
        else
          return { success = false, message = "Error removing item" }
        end
      else
        return { success = false, message = "Item Not Found" }
      end
    else
      return { success = false, message = "Player Not Found" }
    end
  end
end
