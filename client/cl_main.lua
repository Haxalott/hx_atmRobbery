local ox_target = exports.ox_target
local cooldown  = false

exports.ox_target:addModel(Config.TargetOptions.Models.model1,
    {
        label = Config.Lang['target_label'],
        icon = Config.TargetOptions.Main.TargetIcon,
        event = 'hx_atmRobbery:client:rob'
    }
)

local function alertPolice()
    if Config.Dispatch.DispatchSettings.DispatchEnabled then
        if Config.Dispatch.DispatchSettings.Dispatch == 'cd_dispatch' then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = { 'police' },
                coords    = data.coords,
                title     = Config.Lang['dispatch_title'],
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
            -- Put custom trigger here
        end
    end
end

RegisterNetEvent('hx_atmRobbery:client:rob', function()
    local itemCount = exports.ox_inventory:GetItemCount(Config.Item, item)
    if itemCount == 0 then
        lib.notify({
            title       = Config.Lang['notify_title'],
            description = Config.Lang['missing_description'],
            type        = 'error',
            position    = Config.NotifyPos,
            icon        = Config.NotifyIcon,
            iconColor   = '#C53030'
        })
        return
    end

    if cooldown then
        lib.notify({
            title       = Config.Lang['notify_title'],
            description = Config.Lang['cooldown_true'],
            type        = 'error',
            position    = Config.NotifyPos,
            icon        = Config.NotifyIcon,
            iconColor   = '#C53030'
        })
        return
    end

    if cooldown == false and itemCount >= 1 then
        alertPolice()
        local gameData = {
            totalNumbers = Config.MinigameOptions.totalNumbers,
            seconds = Config.MinigameOptions.seconds,
            timesToChangeNumbers = Config.MinigameOptions.timesToChangeNumbers,
            amountOfGames = Config.MinigameOptions.amountOfGames,
            incrementByAmount = Config.MinigameOptions.IncrementByAmount,
        }
        local result = exports['pure-minigames']:numberCounter(gameData)
        if result then
            lib.progressCircle({
                label        = 'Robbing ATM...',
                duration     = 5000,
                position     = 'bottom',
                useWhileDead = false,
                canCancel    = false,
                disable      = {
                    move = true,
                    car  = true,
                },
                anim         = {
                    dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                    clip = 'machinic_loop_mechandplayer'
                },
            })
            TriggerServerEvent('hx_atmRobbery:server:addItem')
            cooldown = true
            Wait(Config.CooldownTime * 1000)
            cooldown = false
            if Config.NotifyOnCooldownEnd then
                lib.notify({
                    title       = Config.Lang['notify_title'],
                    description = Config.Lang['cooldown_end'],
                    type        = 'inform',
                    position    = Config.NotifyPos,
                    icon        = 'sack-dollar'
                })
            else
                return
            end
        elseif result == false then
            TriggerServerEvent('hx_atmRobbery:server:removeItem')
        end
    end
end)

RegisterNetEvent('hx_atmRobbery:client:cooldownRemove', function()
    cooldown = false
    if Config.NotifyOnCooldownEnd then
        lib.notify({
            title       = Config.Lang['notify_title'],
            description = Config.Lang['cooldown_end'],
            type        = 'inform',
            position    = Config.NotifyPos,
            icon        = 'sack-dollar'
        })
    else
        return
    end
end)
