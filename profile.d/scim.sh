#!/bin/sh

# SCIM (Smart Common Input Method platform).  This is used to support the
# entering of text in non-US-English languages.

# For SCIM to work, you need to use a UTF-8 locale.  Make sure it ends on
# ".UTF-8", not "utf-8"!  As an example, you would need to use en_US.UTF-8
# for a US locale (export LANG=en_US.UTF-8), not en_US.
#
# The locale (LANG variable) is set in /etc/profile.d/lang.sh.

if [ -x /usr/bin/scim ]; then
  # Enable legacy X applications to use scim:
  export XMODIFIERS="@im=SCIM"
  ## Enable Qt/KDE applications to use scim (not working with kde4):
  #export QT_IM_MODULE="scim"
  # Make scim start automatically if the "magic key" Ctrl-Space is pressed:
  export XIM_PROGRAM="/usr/bin/scim -d"
fi

if [ -x /usr/bin/scim-bridge ]; then
  # Let GTK applications like Firefox/Thunderbird use scim-bridge as
  # default immodule:
  export GTK_IM_MODULE="scim-bridge"
  # Enable Qt4/KDE4 applications to use scim:
  export QT_IM_MODULE="scim-bridge"
fi

# This ensures scim starts when you logon.
# This will only work if you login through runlevel 4 (graphical login)!!!
# Better is to have it start through Ctrl-Space like configured higher up ^^.
#if [ ! `ls /tmp/scim-socket*` ]; then
#  /usr/bin/scim -d
#fi

# GTK+ environments such as XFce should support SCIM automatically, BUT
# if the first app you run is a Qt one, you'll run into problems.  This
# can be avoided by going into Menu -> Settings -> Autostarted Applications
# and adding SCIM:  /usr/bin/scim -d

# KDE will not start SCIM automatically, so you will need a script such as
# this one in your /root/.kde/Autostart:

#!/bin/bash
#if [ -x /usr/bin/scim ]; then
#  /usr/bin/scim -d &
#fi

# Obviously, uncomment all but the first line.  :-)

