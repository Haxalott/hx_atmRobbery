RegisterNetEvent('hx_atmRobbery:server:removeItem', function()
    exports.ox_inventory:RemoveItem(source, Config.Item, 1)
    notify(Lang['notify_title'], Lang['fail_description'], 'error')
end)

RegisterNetEvent('hx_atmRobbery:server:addItem', function()
    local number  = math.random(Config.MinimumReward,Config.MaxReward)
    exports.ox_inventory:AddItem(source, Config.Reward, number)
    notify(Lang['notify_title'], 'You made '.. number .. '$', 'inform')
    local Identifier = GetPlayerIdentifierByType(source, 'discord')
    local name       = GetPlayerName(source)
    sendWebhook(16777215, 'ATM Robbery Logs', "**Player Name:** `"..name.."`\n **Discord ID:** `"..Identifier.."`\n **Amount:** "..number..'')
end)

function sendWebhook(color, name, message)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**HX_ATMROBBERY**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = 'Haxalotts Developments',
              },
          }
      }
  
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end