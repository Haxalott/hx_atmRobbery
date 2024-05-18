Config = {}

Config.Reward        = 'black_money' -- black_money and money (money = clean, black_money = Dirty Money)
Config.NotifyPos     = 'top-center' -- 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left' ONLY FOR OX_LIB
Config.NotifyIcon    = 'sack-dollar' -- ONLY FOR OX_LIB
Config.MinimumReward = 100
Config.MaxReward     = 10000
Config.Webhook = 'CHANGE_ME'
Config.Notify  = 'ox_lib' -- ox_lib, brutal_notify, mythic_notify, okokNotify or custom

Config.NotifyOnCooldownEnd = true -- Notify the player when their cooldown ends?
Config.CooldownTime        = 60 -- Time in seconds

Config.Item = 'hacking_laptop'

Config.TargetOptions = {
    Models = {
        `prop_atm_03`,
        `prop_fleeca_atm`,
        `prop_atm_01`,
        `prop_atm_02`,
    },
    Main = {
        TargetIcon = 'fa-solid fa-code',
    },
}

Config.MinigameOptions = {
    totalNumbers = 1,
    seconds = 15,
    timesToChangeNumbers = 4,
    amountOfGames = 1,
    incrementByAmount = 5,
}

Config.Dispatch = {
    Blip = {
        sprite  = 761,
        scale   = 1.2,
        colour  = 3,
        flashes = false,
        text    = 'ATM Robbery',
        time    = 5,
        radius  = 0,
    },
    DispatchSettings = {
        DispatchEnabled = true,
        Dispatch        = 'cd_dispatch' -- cd_dispatch and custom, put the custom trigger in client > cl_main.lua line 33
    },
}