#
# ~/.profile
#

# COMMON ENVIRONMENT
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim +Man!"
export LIBVIRT_DEFAULT_URI="qemu:///system"
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/.local/share/node/bin/:$PATH"
export PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"

# MANPAGES
export MANPAGER="nvim +Man!"

# QT THEMES
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1

# Bash History
export HISTSIZE=5000

# Android sdk
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/build-tools/35.0.1/
