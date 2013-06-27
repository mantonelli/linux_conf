#!/bin/csh

# SCIM (Smart Common Input Method platform).  This is used to support the
# entering of text in non-US-English languages.

# For SCIM to work, you need to use a UTF-8 locale.  Make sure it ends on
# ".UTF-8", not "utf-8"!  As an example, you would need to use en_US.UTF-8
# for a US locale (setenv LANG en_US.UTF-8), not en_US.
#
# The locale (LANG variable) is set in /etc/profile.d/lang.csh.

[ -x /usr/bin/scim ]
if ($status == 0) then
  # Enable legacy X applications to use scim:
  setenv XMODIFIERS "@im=SCIM"
  ## Enable Qt/KDE applications to use scim (does not work for kde4):
  #setenv QT_IM_MODULE "scim"
  # Make scim start automatically if the "magic key" Ctrl-Space is pressed:
  setenv XIM_PROGRAM "/usr/bin/scim -d"
endif

[ -x /usr/bin/scim-bridge ]
if ($status == 0) then
  # Let GTK applications like Firefox/Thunderbird use scim-bridge as
  # default immodule:
  setenv GTK_IM_MODULE "scim-bridge"
  # Enable Qt4/KDE4 applications to use scim:
  setenv QT_IM_MODULE "scim-bridge"
endif

# This ensures scim starts when you logon.
# This will only work if you login through runlevel 4 (graphical login)!!!
# Better is to have it start through Ctrl-Space like configured higher up ^^.
#[ ! `ls /tmp/scim-socket*` ]
#if ($status == 0) then
#  /usr/bin/scim -d
#endif

# GTK+ environments such as XFce should support SCIM automatically, BUT
# if the first app you run is a Qt one, you'll run into problems.  This
# can be avoided by going into Menu -> Settings -> Autostarted Applications
# and adding SCIM:  /usr/bin/scim -d

# KDE will not start SCIM automatically, so you will need a script such as
# this one in your /root/.kde/Autostart:

#!/bin/csh
#[ -x /usr/bin/scim ]
#if ($status == 0) then
#  /usr/bin/scim -d &
#endif

# Obviously, uncomment all but the first line.  :-)

