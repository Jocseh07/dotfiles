#!/bin/bash

function run {
  if ! pgrep $1; then
    $@ &
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
# xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &

xrandr --output eDP-1 --primary --mode 2560x1440 --rate 240 --scale 1x1 --output HDMI-1-0  --mode 1920x1080 --rate 60 --scale 1x1 --right-of eDP-1 &
# xrandr --output eDP-1 --primary --mode 2560x1440 --rate 240 --scale 1x1 &
# xrandr --output HDMI-1-0  --mode 1920x1080 --rate 60 --scale 1x1 --right-of eDP-1 &
# xrandr --output HDMI-1-0  --mode 1366x768 --rate 60 --scale 1x1 --right-of eDP-1 &
# xrandr --output HDMI-1-0 --noprimary --mode 1366x768 --rate 60 --scale 1x1 &

$HOME/.config/polybar/launch.sh &

run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-scale ~/.config/bspwm/wall.png &
# feh --bg-fill /usr/share/backgrounds/arco/koi-fishes-1920x1080.png &
#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

# dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &

run nm-applet &
# run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
run xdman-beta &
run redshift &
/usr/lib/polkit-kde-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

/usr/lib/xfce4/notifyd/xfce4-notifyd &
nitrogen --restore &
