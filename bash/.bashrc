#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# FZF
#
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

#
# Prompt
#
eval "$(starship init bash)"

#
# ENV
#
export HISTSIZE=5000

#
# Alias
#
alias ls="ls --color=auto"
alias aria2d="aria2c --enable-rpc --auto-file-renaming=false"
alias sysinfo="neofetch --ascii ~/.config/neofetch/chess.txt"

#
# function
#

pmu() {
  sudo reflector --verbose --latest 3 --protocol https --sort rate --save /etc/pacman.d/mirrorlist $@
}

rmorphans() {
  pacman -Qdtq | sudo pacman -Rns -
}

gpuinfo() {
  glxinfo | grep "OpenGL renderer"
}

http() {
  caddy file-server --listen :8000 --browse
}

ipinfo() {
  curl ipinfo.io
}

sshfm() {
  sshfs -o cache_timeout=600 -o attr_timeout=600 -o entry_timeout=600 -o direct_io -o cache=yes -o kernel_cache $@
}
