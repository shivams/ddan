Guakify.sh
==========

This script can be used for "guakifying" any application on Linux (and possibly other Unix variants).

By 'guakifying', I mean the application can be summoned using a desired keystroke, and then made to hide in the background using the same keystroke. This is similar to how the popular Linux terminal emulator "Guake" behaves. 

Requirements
------------

This script has these dependencies:

* wmctrl
* xdotool
* awk
* xwininfo

All these tools are available in standard Linux repositories. In Ubuntu, install them using:

    sudo apt-get install wmctrl xdotool awk xwininfo

How to use
----------

Say you want to guakify "Firefox". First, open a firefox instance. Then, in terminal, run this script:

    ./guakify.sh

It will ask you to select the window of your desired application. Select the Firefox instance. After you select, the script will automatically decipher the "Class" and "Command" for your application window, and it will show you what it found. You can make changes to the "Class" and "Command" if you think it didn't find any of them correctly. 

Then, it will generate a script for you. This script can be used to summon "Firefox". Now, put this script in some folder which is in your path. E.g.:

    mv <generated-script> ~/bin/

Now, you can assign a key to run this script using your Window manager. For example, in Ubuntu Unity, you can go to System Settings -> Keyboard -> Shortcuts and assign a new "Custom Shortcut" to run this script.

What will the generate script do?
---------------------------------

Whe you run the generated script, it will bring your "desired application" to the front if it is already running. If it's not running, it will run the application and bring it in front. If the desired application is already the active window, then it will minimize it. 
