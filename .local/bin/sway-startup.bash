#! /bin/bash
swaymsg workspace 1
swaymsg layout tabbed
swaymsg exec keepassxc
swaymsg exec mullvad-exclude flatpak run org.gnome.Fractal
swaymsg exec qutebrowser-fast https://mail.proton.me/u/3/inbox
swaymsg exec protonmail-bridge
# swaymsg mullvad-exclude qutebrowser -B .local/share/qutebrowser2/ -C .config/qutebrowser/config-no-vpn.py --untrusted-args https://matrix.endor.cyou &
