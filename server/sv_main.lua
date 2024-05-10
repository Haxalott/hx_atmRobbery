local currVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

CreateThread(function()
    DebugPrint('hx_atmRobbery has started!')
    DebugPrint('Current Version: '.. currVersion)
end)

function DebugPrint(text)
    print('[^2HX_ATMROBBERY^7] ' .. text)
end

RegisterNetEvent('hx_atmRobbery:server:removeItem', function()
    exports.ox_inventory:RemoveItem(source, Config.Item, 1)
    TriggerClientEvent('ox_lib:notify', source, {
        title       = Config.Lang['notify_title'],
        description = Config.Lang['fail_description'],
        type        = 'error',
        position    = Config.NotifyPos,
        icon        = Config.NotifyIcon
    })
end)

RegisterNetEvent('hx_atmRobbery:server:addItem', function()
    local number  = math.random(Config.MinimumReward,Config.MaxReward)
    exports.ox_inventory:AddItem(source, Config.Reward, number)
    TriggerClientEvent('ox_lib:notify', source, {
        title       = Config.Lang['notify_title'],
        description = 'You made '.. number .. '$',
        type        = 'inform',
        icon        = 'sack-dollar',
        position    = Config.NotifyPos,
    })
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
