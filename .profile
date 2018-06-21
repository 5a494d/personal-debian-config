
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# load ssh-keys
/usr/bin/keychain --clear $HOME/.ssh/bit_home
source $HOME/.keychain/$HOSTNAME-sh

# start x windows manager
startx

# start initial configuration to urxvt
#urxvtd --quiet --opendisplay --fork

# load background desktop image -> wallpaper
feh --bg-fill --randomize --no-fehbg ~/Pictures/wallpapers/*
