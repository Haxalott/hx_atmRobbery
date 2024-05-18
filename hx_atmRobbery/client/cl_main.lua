local ox_target = exports.ox_target
local cooldown  = false

exports.ox_target:addModel(Config.TargetOptions.Models,
    {
        label = Lang['target_label'],
        icon = Config.TargetOptions.Main.TargetIcon,
        event = 'hx_atmRobbery:client:rob'
    }
)

RegisterNetEvent('hx_atmRobbery:client:rob', function()
    local itemCount = exports.ox_inventory:GetItemCount(Config.Item, item)
    if itemCount == 0 then
        notify(Lang['notify_title'], Lang['missing_description'], 'error')
        return
    end

    if cooldown then
        notify(Lang['notify_title'], Lang['cooldown_true'], 'error')
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
                notify(Lang['notify_title'], Lang['cooldown_end'], 'inform')
            else
                return
            end
        elseif result == false then
            TriggerServerEvent('hx_atmRobbery:server:removeItem')
        end
    end
end)