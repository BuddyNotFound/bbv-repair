fx_version 'cerulean'
game 'gta5'

description 'bbv-repair'
version '1.0.0'

this_is_a_map 'yes'

client_scripts {
    'wrapper/cl_wrapper.lua',
    'client.lua',
}

server_scripts {
    'wrapper/sv_wrapper.lua',
    'server.lua',
}

shared_scripts {
    'config.lua',
}

lua54 'yes'
