fx_version 'bodacious'
games { 'gta5' }

author 'Dislaik'
description 'Zombie System for ESX Framework'
version '1.2.9'


shared_script '@es_extended/imports.lua'


client_scripts {
	'config.lua',
	'client/main.lua',
	'client/loot.lua'
}

server_script {
	'server/main.lua'
}
