local currVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

CreateThread(function()
    DebugPrint('hx_atmRobbery has started!')
    DebugPrint('Current Version: '.. currVersion)
end)

function DebugPrint(text)
    print('[^2HX_ATMROBBERY^7] ' .. text)
end

function notify(title, description, type)
    if Config.Notify == 'ox_lib' then
        TriggerClientEvent('ox_lib:notify', source, {
            title       = title,
            description = description,
            type        = type,
            icon        = Config.NotifyIcon,
            position    = Config.NotifyPos,
            iconColor   = '#C53030'
        })
    elseif Config.Notify == 'brutal_notify' then
        TriggerClientEvent('brutal_notify:SendAlert', source, title, description, 3500, 'info')
    elseif Config.Notify == 'mythic_notify' then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = description })
    elseif Config.Notify == 'okokNotify' then
        TriggerClientEvent('okokNotify:Alert', source, title, description, 3500, 'info', true)
    else
        DebugPrint(Config.Lang['nil_notify'])
    end
end