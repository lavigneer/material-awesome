local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'env alacritty',
    rofi = rofi_command,
    lock = 'i3lock',
    quake = 'alacritty',

    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'env google-chrome-stable',
    editor = 'nvim', -- gui text editor
    files = 'nautilus',
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom -b --experimental-backends --dbus --config ' ..
		filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    'numlockx on', -- enable numlock
    'dex --autostart --environment awesome',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
