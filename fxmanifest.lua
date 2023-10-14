fx_version 'cerulean'
game {'gta5'}

shared_scripts {
  'Config.lu*',
  'Shared.lu*'
}

client_scripts {
  'Client/*.lu*',
  'Client/**/*.lu*'
}

server_scripts {
  'Server/*.lu*',
  'Server/**/*.lu*'
}

files {
  'nui/*.html',
  'nui/**/*.css',
  'nui/**/*.js'
}

ui_page 'nui/Nui.html'