dunst &
picom &
~/.fehbg &
udiskie &


# Start Def applications

$TERMINAL &
$BROWSER &


# Remap capslock to escape
# when tapped
# And super when held

setxkbmap -option caps:super
xcape -e 'Super_L=Escape'


(sleep 1 && xdotool key alt+3) & #Start on tag 3
exec dwm

