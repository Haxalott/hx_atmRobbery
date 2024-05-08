Config = {}

Config.Reward        = 'black_money' -- black_money and money (money = clean, black_money = Dirty Money)
Config.NotifyPos     = 'top-center' -- 
Config.NotifyIcon    = 'sack-dollar'
Config.MinimumReward = 100
Config.MaxReward     = 10000

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
    totalNumbers = 10,
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

Config.Lang = {
    ['target_label']         = 'Hack ATM',
    ['dispatch_title']       = 'ATM Robbery',
    ['missing_description']  = 'You need a hacking laptop to do this',
    ['notify_title']         = 'ATM Robbery',
    ['fail_description']     = 'You failed the robbery, cops were alerted.' ,
    ['cooldown_true']        = 'You are on cooldown, try again later',
    ['cooldown_end']         = 'You are no longer on cooldown.',
}