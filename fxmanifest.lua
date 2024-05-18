fx_version 'cerulean'
game       'gta5'
lua54      'yes'

author      'Haxalott'
description 'Rob atms'
version     '1.0.2'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'lang.lua'
}