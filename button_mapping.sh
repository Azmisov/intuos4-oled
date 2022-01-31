#!/bin/bash
: '
Sets intuos4 button mapping
https://bartssolutions.blogspot.com/2015/02/how-to-configure-wacom-intuos-express.html

keymap format:
 "x" = press/release x
 "+x" = press x
 "-x" = release x
for multiple keypresses, separate with space
'

# top 4 buttons
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 2 key "a"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 3 key "b"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 8 key "c"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 9 key "d"

# middle ring button
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 1 key "e"

# bottom 4 butons
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 10 key "f"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 11 key "g"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 12 key "h"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 13 key "i"