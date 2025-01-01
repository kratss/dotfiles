#! /bin/bash
swaymsg workspace 1
swaymsg workspace_layout tabbed
swaymsg exec "mullvad-exclude firefox --profile \
  /home/m/.mozilla/firefox/pb8kmivp.SwayWM \
  --new-window https://matrix.endor.cyou" &
swaymsg exec foot nvim todo.md
swaymsg exec korganizer
swaymsg exec flatpak run org.mozilla.Thunderbird &
swaymsg exec tuxedo-control-center &
swaymsg exec gnome-pomodoro &
sleep 20
sway_arranger.sh
