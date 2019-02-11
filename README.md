# intuos4-oled
send cool images and text to the Wacom Intuos 4 OLEDs on Linux.

The Intuos4 is an old tablet, but it works well, and you can have fun
playing with the small OLED screens.  There is built-in support in the
Linux kernel, but the access to it is not so obvious (and several
pages on the web are outdated).  The purpose of this project is to
make it easy. It includes text messages, image processing, auto-saving
profiles...

```
usage: intuos4oled.py [-h] [-f] [--rv] [--kr] [--nosync] [-b BUTTON]
                      [-i IMAGE] [--id ID] [--lum LUM] [--font FONT]
                      [--sync SYNC] [-t TEXT] [-s SPAN]
                      command

positional arguments:
  command               update, set, clear, init

optional arguments:
  -h, --help            show this help message and exit
  -f, --flip            Flip images upside-down (for left-handed)
  --rv                  Reverse video
  --kr                  Keep image ratio
  --nosync              Don't synchronize images with datafile
  -b BUTTON, --button BUTTON
                        button number, between 0 and 7
  -i IMAGE, --image IMAGE
                        image file
  --id ID               Wacom Tablet product ID
  --lum LUM             Oled luminance, between 0 and 15
  --font FONT           Font to use for texts
  --sync SYNC           Specify the file used to store and synchronize all
                        images
  -t TEXT, --text TEXT  text message
  -s SPAN, --span SPAN  if the image has to span over several buttons
```

## Examples

```
intuos4oled.py set -i tux.png -b 0
```

This will display the "tux.png" icon on the button #0.

```
intuos4oled.py set -b 7 -i woman64.png -f -s 4
```

This will display the image "woman64.png" on the tablet, spanning over
4 buttons, flipped in order to fit the left-handed mode. The number
'7' here is the top button in the left-handed orientation.

```
intuos4oled.py set -t "Don't forget\nthe bread" -b 2 --font "Ubuntu-C.ttf"
```

This will display some text on button #2. Notice how you can insert a
line break with '\n', and change the font.

## Restore images

After the Tablet has been disconnected, you can easily restore the
previous state:

```
intuos4oled.py update
```

## Installation

### Quick test

You need standard Python and Imagemagick installs. It should work both
with Python2 (for instance with Ubuntu 16.4) or Python3.

If you downloaded the [zip](https://github.com/sanette/intuos4-oled/archive/master.zip) from github, the script is already
executable. But just in case, type:
``` chmod 755 intuos4oled.py ```

There is nothing more to do to start testing. You can try:
```
sudo ./intuos4oled.py set -i tux.png -b 0
```

Depending on your system, the `sudo` might not be necessary. If it is, then
it's easier to simply do once:
```
sudo ./intuos4oled.py init
```

And then for all subsequent calls, you don't need sudo anymore.

### Permanent installation

1. Make sure the script is executable and move it to a location in you
   `$PATH`. Here we use `/usr/local/bin`. This should work for everyone.

```
sudo cp intuos4oled.py /usr/local/bin/
```

2. By using `udev` rules the initialization will be done automagically
   every time you plug in the tablet:

```
sudo cp 99-wacom.rules /etc/udev/rules.d/99-wacom.rules
```
(This might require a restart)

3. Using your session-manager startup scripts, update the tablet with
   `intuos4oled update` whenever you open a session.

## What about mapping keys to buttons?

Well, I don't want to deal with this, because there are already very
nice interfaces from the standard Desktop environments. For instance,
the Wacom config from KDE is awesome. No need to do more!

## More and more todo

A few things that I should consider because I don't see how to do it
with the standard tools:

* write a daemon to check the led status (0, 1, 2 or 3) and
  automatically change icons correspondingly. Or, one could map the
  central button to a script that does this.

* adapt my old 'follow-focus' daemon that will automatically switch
  profile according to the application that has focus (Gimp, Inkscape,
  Firefox, etc.)

* Write a game on the OLED screen and use the touch wheel to play ;)
