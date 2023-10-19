-- Send Data to the NUI window.
-- Function from Jaareet (https://github.com/jaareet)

function sendNuiMessage(action, data)
    local payload = {
        type = tostring(action)
    }

    if (data and type(data) == 'table') then
        for k, v in pairs(data) do
            payload[k] = v
        end
    end
    
    SendNUIMessage(payload)
end