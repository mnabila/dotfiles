# ungrouped alias
alias sysinfo="neofetch --ascii ~/.config/neofetch/chess.txt"
alias vim="nvim --noplugin -u /dev/null"
alias aur-pkg="ssh aur@aur.archlinux.org list-repos"
alias aria2d="aria2c --enable-rpc"
alias ssh="env TERM=xterm-256color ssh"
alias nu="paru --sudoloop -S --noconfirm neovim-git && nvim +PackerSync"
alias docui="env LC_CTYPE=en_US.UTF-8 TERM=xterm-256color docui"
alias cekisp="curl ipinfo.io"
alias td="tidal-dl -l"
alias pc="proxychains"

# pacman
alias pmu="pekmen;sudo reflector --verbose --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias pmu-id="pekmen;sudo reflector --verbose --country Indonesia --age 12 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist"
alias psu="sudo pacman -Syyuw"
