if status is-interactive
    # ungrouped alias
    abbr --add --global sysinfo "neofetch --ascii ~/.config/neofetch/chess.txt"
    abbr --add --global aur-pkg "ssh aur@aur.archlinux.org list-repos"
    abbr --add --global aria2d "aria2c --enable-rpc --auto-file-renaming=false"
    # abbr --add --global ssh "env TERM=xterm-256color ssh"
    abbr --add --global nu "paru --sudoloop -S --noconfirm neovim-git && nvim +JetpackSync"
    abbr --add --global docui "env LC_CTYPE=en_US.UTF-8 TERM=xterm-256color docui"
    abbr --add --global cekisp "curl ipinfo.io"
    abbr --add --global td "tidal-dl -l"
    abbr --add --global pc proxychains

    # pacman
    abbr --add --global pmu "sudo reflector --verbose --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
    abbr --add --global pmu-id "sudo reflector --verbose --country Indonesia --age 12 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist"
    abbr --add --global psu "sudo pacman -Syyuw"

    # youtube-dl
    abbr --add --global ytmkv "youtube-dl --merge-output-format mkv"
    abbr --add --global ytmp4 "youtube-dl --merge-output-format mp4"
    abbr --add --global ytmp3 "youtube-dl --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output '~/Music/youtube/%(title)s.%(ext)s'"

    # nmcli
    abbr --add --global neton "nmcli connection up"
    abbr --add --global netoff "nmcli connection down"

    # mpv
    abbr --add --global ytview "mpv --ytdl-raw-options='geo-bypass=,sub-lang=en,write-auto-sub=' --ytdl-format='bestvideo[height<=?480]+bestaudio/best'"

    # dotfiles
    abbr --add --global nvimrc "cd ~/Dotfiles && git subtree push --prefix=neovim/.config/nvim subtree-nvimrc master:master"
end
