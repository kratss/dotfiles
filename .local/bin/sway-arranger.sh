#!/bin/bash

# Assign windows to appropriate workspace
swaymsg [title="Anki"]			        move container to workspace 2
swaymsg [title="Element"]		        move container to workspace 1
swaymsg [title="Tasks"]			        move container to workspace 1
swaymsg [title="Thunderbird"] 		    move container to workspace 1
swaymsg [title="TUXEDO.Control.Center"] move container to workspace 1
swaymsg [title="Pomodoro"]		        move container to workspace 5
swaymsg [title="Calendar"]              move container to workspace 1

#swaymsg [title="Pomodoro"]		        move right	
#swaymsg [title="Pomodoro"]		        resize shrink width 500px
swaymsg [workspace=1] layout tabbed
#swaymsg for_window [title="Firefox...Sharing.Indicator"] move down
#swaymsg for_window [title="Firefox...Sharing.Indicator"] resize set height 5px
swaymsg focus_wrapping yes
notify-send "Sway Arranger" "Window arrangement complete"

