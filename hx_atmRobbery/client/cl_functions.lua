function notify(title, description, type)
    if Config.Notify == 'ox_lib' then
        lib.notify({
            title = title,
            description = description,
            type = type,
            position    = Config.NotifyPos,
            icon        = Config.NotifyIcon
        })
    elseif Config.Notify == 'brutal_notify' then
        exports['brutal_notify']:SendAlert(title, description, 3500, 'info')
    elseif Config.Notify == 'mythic_notify' then
        exports['mythic_notify']:DoHudText('inform', description)
    elseif Config.Notify == 'okokNotify' then
        exports['okokNotify']:Alert(title, description, 3500, 'info', true)
    elseif Config.Notify == 'custom' then
        -- put custom trigger here
    else
        return
    end
end

function alertPolice()
    if Config.Dispatch.DispatchSettings.DispatchEnabled then
        if Config.Dispatch.DispatchSettings.Dispatch == 'cd_dispatch' then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = { 'police' },
                coords    = data.coords,
                title     = Lang['dispatch_title'],
                message   = 'A ' .. data.sex .. ' robbing a ATM at ' .. data.street,
                flash     = 0,
                unique_id = data.unique_id,
                sound     = 1,
                blip      = {
                    sprite  = Config.Dispatch.Blip.sprite,
                    scale   = Config.Dispatch.Blip.scale,
                    colour  = Config.Dispatch.Blip.colour,
                    flashes = Config.Dispatch.Blip.flashes,
                    text    = Config.Dispatch.Blip.text,
                    time    = Config.Dispatch.Blip.time,
                    radius  = Config.Dispatch.Blip.radius,
                }
            })
        elseif Config.Dispatch.DispatchSettings.Dispatch == 'custom' then
            -- put custom trigger here
        end
    end
end