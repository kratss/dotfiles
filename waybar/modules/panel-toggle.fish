#!/usr/bin/env fish
if $waybar_panel_visibility
	swaymsg bar bar-1 hidden_state hide
	#sed -i 's/\"layer\":\ \"top\"/\"layer\":\ \"bottom\"/' ~/.config/waybar/config.jsonc
    #killall -SIGUSR2 "waybar -c /home/m/.config/waybar/config-panel.jsonc"
    set waybar_panel_visibility false
else
    swaymsg bar bar-1 hidden_state show 
    set waybar_panel_visibility true
end
