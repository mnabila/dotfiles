#!/usr/bin/env sh

## Start GNOME Keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,gpg)
# export SSH_AUTH_SOCK

## Executed by startx (run your window manager from here)
xrdb -load ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash

if [ -d /etc/X11/xinit/xinitrc.d  ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f"  ] && . "$f"
  done
  unset f
fi

# Load .xprofile
[ -f ~/.profile ] && . ~/.profile

# set cursor
xsetroot -cursor_name left_ptr

# Untuk SLiM Session
export XDG_CURRENT_DESKTOP=awesome
case "$1" in
    awesome) exec awesome ;;
    dwm) exec dwm ;;
    i3) exec i3 ;;
    i3-with-shmlog) exec i3-with-shmlog ;;
    sway) exec sway ;;
    instantwm) exec instantwm ;;
    bspwm) exec bspwm ;;
    qtile) exec qtile ;;
    *) exec $XDG_CURRENT_DESKTOP ;;
esac

