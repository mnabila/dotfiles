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
	sudo reflector --verbose --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist $@
}

rmorphans() {
	pacman -Qdtq | sudo pacman -Rns -
}
