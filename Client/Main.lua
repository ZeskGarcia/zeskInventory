Framework = nil

if (Config.Framework and string.upper(Config.Framework) == "ESX") then
  if (Config.Framework and Config.NewVersion) then
    Framework = exports[Config.FrameworkName]:getSharedObject()
  else
    CreateThread(function()
      while (Framework == nil) do
        TriggerEvent('esx:getSharedObject', function(obj)
          Framework = obj
        end)
        Wait(0)
      end
    end)
  end
end

CreateThread(function()
  while (true) do
    Wait(0) -- Add a Sleep Timeout of 0 ms.
    
    -- Open Inventory Key.

    if (Config.Keys.OpenInv.Enabled and IsControlJustPressed(0, Config.Keys.OpenInv.Key)) then
      Player.Functions.OpenInventory()
    end
  end
end)