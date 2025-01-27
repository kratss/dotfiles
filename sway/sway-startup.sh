#! /bin/bash
# swaymsg workspace 1
# swaymsg workspace_layout tabbed
swaymsg exec "mullvad-exclude firefox --profile \
  /home/m/.mozilla/firefox/pb8kmivp.SwayWM \
  --new-window https://matrix.endor.cyou" &
swaymsg exec "mullvad-exclude qutebrowser \
  -B .local/share/qutebrowser2/ \
  -C .config/qutebrowser/config-no-vpn.py \
  --untrusted-args https://element.endor.cyou" &
swaymsg exec korganizer &
swaymsg exec flatpak run org.mozilla.Thunderbird &
swaymsg exec tuxedo-control-center &
sleep 20
~/.config/sway/sway_arranger.sh
