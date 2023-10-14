Shared = {
    Functions = {
        triggerServerCallback = function(eventName, cb, ...)
            if (Framework and Config.Framework and string.upper(Config.Framework) == "ESX") then
                eventName = Config.Hex.Encode(Config.Hex.Encode(Config.Base64.Encode(Config.Base64.Encode(eventName))))
                Framework.TriggerServerCallback(eventName, cb, ...)
            end
        end,
        registerServerCallback = function(eventName, data)
            if (Framework and Config.Framework and string.upper(Config.Framework) == "ESX") then
                eventName = Config.Hex.Encode(Config.Hex.Encode(Config.Base64.Encode(Config.Base64.Encode(eventName))))
                Framework.RegisterServerCallback(eventName, data)
            end
        end
    }
}