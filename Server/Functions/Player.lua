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

    local inventoryContent = xPlayer.getInventory()

    return inventoryContent
  end
end
