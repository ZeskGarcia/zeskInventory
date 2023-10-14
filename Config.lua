Config = {
  Framework = "esx", -- currently only ESX
  FrameworkName = "es_extended", -- Current Framework Name, example: es_extended (ESX Legacy)
  NewVersion = true, -- Enable this if you framework works with the exports function.

  Keys = {
    OpenInv = {
      Enabled = true, -- Enable if you want to also use the inventory with a custom key.
      Key = 38, -- Add here the key you want to use
      Command = "openinventory", -- Add here the command you want to use
      EnableCmd = true
    }
  },

  Base64 = {
    Encode = function(data)
        local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        return ((data:gsub('.', function(x) 
            local r,b='',string.byte(x)
            for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
            return r;
        end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
            if (#x < 6) then return '' end
            local c=0
            for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
            return b:sub(c+1,c+1)
        end)..({ '', '==', '=' })[#data%3+1])
    end,
    Decode = function(data)
        local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        data = string.gsub(data, '[^'..b..'=]', '')
        return (data:gsub('.', function(x)
            if (x == '=') then return '' end
            local r,f='',(b:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
            return r;
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if (#x ~= 8) then return '' end
            local c=0
            for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
        end))
    end
  },
  Hex = {
    Encode = function(str)
      return (str:gsub('.', function(c)
          return string.format('%02X', string.byte(c))
      end))
    end,
    Decode = function(str)
      return (str:gsub('..', function(cc)
          return string.char(tonumber(cc, 16))
      end))
    end
  }
}
