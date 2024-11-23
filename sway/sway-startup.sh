#! /bin/bash
swaymsg layout tabbed
exec firefox \
 --new-window https://matrix.endor.cyou \
 --new-window https://mytuxedo.de/index.php/apps/tasks/ &
exec gnome-pomodoro &    
exec flatpak run org.mozilla.Thunderbird &   
exec tuxedo-control-center &
exec gnome-control-center & 
exec gnome-calendar &


