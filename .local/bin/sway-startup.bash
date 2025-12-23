#! /bin/bash
swaymsg workspace 1
swaymsg layout tabbed
swaymsg exec flatpak run org.gnome.Calendar &
swaymsg exec flatpak run net.thunderbird.Thunderbird &
swaymsg exec keepassxc &
swaymsg exec mullvad-exclude flatpak run org.gnome.Fractal
# swaymsg mullvad-exclude qutebrowser -B .local/share/qutebrowser2/ -C .config/qutebrowser/config-no-vpn.py --untrusted-args https://matrix.endor.cyou &
