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
# ENV
#
[ -f ~/.profile ] && source ~/.profile

#
# Prompt
#
eval "$(starship init bash)"

#
# Alias
#
alias ls="ls --color=auto"
alias aria2d="aria2c --enable-rpc --auto-file-renaming=false"
alias vi="nvim"

#
# Function
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

scrcpy-preview() {
	scrcpy --no-audio --video-codec=h264 --video-encoder=OMX.google.h264.encoder --max-fps=23 --video-bit-rate=1M --video-buffer=50 --max-size=360 --no-control $@
}

scrcpy-lite() {
	scrcpy --no-audio --video-codec=h264 --video-encoder=OMX.google.h264.encoder --max-fps=23 --video-bit-rate=1M --video-buffer=50 --max-size=720 $@
}

ytv() {
	mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio/best" ytdl://ytsearch:"$*"
}

yta() {
	mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}

yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd <"$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

fix-podman-disk-quota() {
	sudo sysctl -w kernel.keys.maxkeys=10000
	sysctl kernel.keys.maxkeys
}
