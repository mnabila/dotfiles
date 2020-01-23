#!/bin/sh
#
# This script launches jgmenu in short-lived mode.
# It can be run with a parallel with a long-running invocation of jgmenu
#

config_file=$(mktemp)
trap "rm -f ${config_file}" EXIT

cat <<'EOF' >${config_file}
tint2_look          = 0
terminal_exec       = termite
#columns             = 1

menu_margin_x       = 5
menu_margin_y       = 25
#menu_width          = 200
#menu_height_min     = 0
#menu_height_max     = 0
menu_height_mode    = static
menu_padding_top    = 5
menu_padding_right  = 5
menu_padding_bottom = 5
menu_padding_left   = 5
menu_radius         = 1
menu_halign         = right
menu_valign         = bottom

font                = Iosevka Nerd Font Light 10

color_menu_bg       = #282828 85
color_menu_border   = #d3dae3 8

color_norm_bg       = #282828 00
color_norm_fg       = #d3dae3 100

color_sel_bg        = #ffffff 20
color_sel_fg        = #eeeeee 100
color_sel_border    = #eeeeee 8

color_sep_fg        = #ffffff 20
EOF

(
printf "%b\n" "logout,i3-msg exit,logout"
printf "%b\n" "poweroff,systemctl -i poweroff,shutdown"
printf "%b\n" "reboot,systemctl -i reboot,reboot"
printf "%b\n" "sleep,systemctl -i suspend,suspend"
) | jgmenu --simple --config-file=${config_file}
