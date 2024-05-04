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
    local amount  = math.random(Config.MinimumReward,Config.MaxReward)
    exports.ox_inventory:AddItem(source, Config.Reward, amount)
    TriggerClientEvent('ox_lib:notify', source, {
        title       = Config.Lang['notify_title'],
        description = 'You made '.. amount .. '$',
        type        = 'inform',
        icon        = 'sack-dollar',
        position    = Config.NotifyPos,
        icon        = Config.NotifyIcon
    })
    local Identifier = GetPlayerIdentifierByType(source, 'discord')
    local name       = GetPlayerName(source)
    DebugPrint(name ..' Has robbed an ATM for $'.. amount)
end)