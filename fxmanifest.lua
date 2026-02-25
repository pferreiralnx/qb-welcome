fx_version 'cerulean'
game 'gta5'

name 'qb_welcome'
author 'leepedro' -- Discord (https://discord.gg/eE58y5FbkR)
description 'QBCore Welcome Script com UI Tablet'
version '2.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/img/*.png'
}
