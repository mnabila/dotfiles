```
                       __          __       ___      ___
                      /\ \        /\ \__  /'___\ __ /\_ \
                      \_\ \    ___\ \ ,_\/\ \__//\_\\//\ \      __    ____
                      /'_` \  / __`\ \ \/\ \ ,__\/\ \ \ \ \   /'__`\ /',__\
                     /\ \L\ \/\ \L\ \ \ \_\ \ \_/\ \ \ \_\ \_/\  __//\__, `\
                     \ \___,_\ \____/\ \__\\ \_\  \ \_\/\____\ \____\/\____/
                      \/__,_ /\/___/  \/__/ \/_/   \/_/\/____/\/____/\/___/
```

# Dotfiles

![GitHub](https://img.shields.io/github/license/mnabila/dotfiles?style=for-the-badge)
![GitHub repo size](https://img.shields.io/github/repo-size/mnabila/dotfiles?label=Dotfiles%20Size&style=for-the-badge)

Tempat backup konfigurasi desktop - dengan bantuan GNU/stow

# Daftar Isi

<!-- TOC depthFrom:2 -->

- [Dotfiles](#Dotfiles)
- [Details](#Details)
- [ScreenShut](#ScreenShut)
- [Instalasi](#Instalasi)
  - [Instalasi GNU/Stow di Arch Linux](#instalasi-gnu%2Fstow-di-arch-linux)
  - [Download Folder Konfigurasi](#download-folder-configurasi)

<!-- /TOC -->

# Details

|         Item          | Value                                           |
| :-------------------: | :---------------------------------------------- |
|          OS           | ArchLinux                                       |
|          WM           | i3-gaps, bspwm, awesomewm                       |
|         Shell         | zsh _([zimfw](https://github.com/zimfw/zimfw))_ |
|          DM           | lightdm, SLIM                                   |
|         Font          | iosevka, iosevka nerd font                      |
|      Compositor       | picom(compton fork),xcompmgr                    |
|     Notification      | dunst                                           |
|       Terminal        | urxvt, Termite, Suckless terminal               |
|       Launcher        | rofi, dmenu, jgmenu, j4-dmenu-desktop           |
|          Bar          | polybar                                         |
|       Wallpaper       | feh                                             |
|      Lock Screen      | i3lock, mantablockscreen, slimlock              |
|   Logout / Shutdown   | script                                          |
|    Volume Control     | pulsemixer, amixer                              |
| Brightness Controller | light                                           |
|    Network Applet     | nm-applet, connman-gtk                          |
|      Text Editor      | neovim                                          |

# ScreenShut

#### i3-gaps

![i3gaps](https://github.com/mnabila/dotfiles/blob/master/screenshot/i3gaps-2.png?raw=true)
![i3gaps workflow](https://github.com/mnabila/dotfiles/blob/master/screenshot/i3gaps-workflow-2.png?raw=true)

#### bspwm

![bspwm](https://github.com/mnabila/dotfiles/blob/master/screenshot/bspwm.png?raw=true)

#### awesomewm

![bspwm](https://github.com/mnabila/dotfiles/blob/master/screenshot/awesomewm.png?raw=true)

#### tmux

![tmux](https://github.com/mnabila/dotfiles/blob/master/screenshot/tmux-2.png?raw=true)

#### zsh

![zsh](https://github.com/mnabila/dotfiles/blob/master/screenshot/zsh.png?raw=true)

# Instalasi

#### Instalasi GNU/Stow di Arch Linux

> **Apa sih GNU/Stow itu ?**
>
> GNU/Stow merupakan sebuah symlink farm manager atau lebih mudah dipahami dengan symlink
> manager sehingga pengguna tidak direpotkan lagi mengetikkan semua pathnya apabila ingin
> melakukan symlink dari folder asal ke folder tujuan.

> **Perbedaan perintah GNU/Stow dan perintah ln untuk membuat symlink ? (contoh tmux)**
>
> **ln**
>
> `$ ln -s /path/folder/asal/tmux/ /path/folder/tujuan/tmux`
>
> **GNU/Stow**
>
> `$ stow tmux`

> **untuk menghapus symlink yang di hasilkan bagaimana ?**
>
> **ln**
>
> `$ unlink /path/folder/tujuan/tmux`
>
> **GNU/Stow**
>
> `$ stow -D tmux`

> **Kenapa sih harus menggunakan GNU/Stow ?**
>
> Dikarenakan banyaknya configurasi yang ada adakalanya pengguna sangat direpotkan uuntuk memanagementnya ketika bermigrasi dari sistem operasi satu ke operasi yang lain.
> Dengan adanya GNU/Stow ini pengguna sedikit terbantu karna tidak perlu lagi copy manual config dari folder dotfiles ke folder configurasi yang ada.
> Cukup dengan membuat symlink dari folder dotfiles ke folder configurasi sehingga ketika ada perubahana juga cukup mudah managementnya.

install paket GNU/Stow di Arch Linux

```
$ sudo pacman stow
```

daftar perintah di GNU/Stow

```
stow (GNU Stow) version 2.3.1

SYNOPSIS:

    stow [OPTION ...] [-D|-S|-R] PACKAGE ... [-D|-S|-R] PACKAGE ...

OPTIONS:

    -d DIR, --dir=DIR     Set stow dir to DIR (default is current dir)
    -t DIR, --target=DIR  Set target to DIR (default is parent of stow dir)

    -S, --stow            Stow the package names that follow this option
    -D, --delete          Unstow the package names that follow this option
    -R, --restow          Restow (like stow -D followed by stow -S)

    --ignore=REGEX        Ignore files ending in this Perl regex
    --defer=REGEX         Don't stow files beginning with this Perl regex
                          if the file is already stowed to another package
    --override=REGEX      Force stowing files beginning with this Perl regex
                          if the file is already stowed to another package
    --adopt               (Use with care!)  Import existing files into stow package
                          from target.  Please read docs before using.
    -p, --compat          Use legacy algorithm for unstowing

    -n, --no, --simulate  Do not actually make any filesystem changes
    -v, --verbose[=N]     Increase verbosity (levels are from 0 to 5;
                            -v or --verbose adds 1; --verbose=N sets level)
    -V, --version         Show stow version number
    -h, --help            Show this help

Report bugs to: bug-stow@gnu.org
Stow home page: <http://www.gnu.org/software/stow/>
General help using GNU software: <http://www.gnu.org/gethelp/>
```

#### Memasang Dotfiles

Langkah pertama yakni clone dulu dotfiles yang ada. dengan perintah dibawah ini

> Note:
> pastikan folder tujuan nya berada di folder /home/\$USER agar mudah managementnya

```
$ git clone https://github.com/mnabila/dotfiles.git ~/Dotfiles
```

Untuk memasang confignya cukup mudah ketikkan perintah dibawah ini.

> kita ambil contoh ingin memasang config tmux

```
$ stow tmux
```

## Download Folder Configurasi

sebelum melakukan download folder configurasi yang perlu kita persiapkan yakni git dan subversion

```
$ sudo pacman -S git subversion
```

lalu tambahkan custom function dibawah ini pada bashrc atau zshrc kalian

```
git-svn(){
  if [[ ! -z "$1" && ! -z "$2" ]]; then
          echo "Starting clone/copy ..."
          repo=$(echo $1 | sed 's/\/$\|.git$//')
          svn export "$repo/trunk/$2"
  else
          echo "Use: git-svn <repository> <subdirectory>"
  fi
}
```
untuk pengguna fish bisa tamabahkan script berikut ini dalam file ~/.config/fish/functions/git-svn.fish

```

function git-svn --description "Download subfolder in git repository"
    set repository $argv[1]
    set subfolder $argv[2]
    if test -n $repository && test -n $subfolder
        echo "Starting clone/copy ..."
        set repo (echo $repository | sed 's/\/$\|.git$//')
        svn export "$repo/trunk/$subfolder"
    else
        echo "Use: git-svn <repository> <subdirectory>"
    end
end
```

untuk menggunakan cukup ketikkan perintah seperti dibawah ini

```
$ git-svn "url repository yang kalian inginkan" "folder yang ada di repository"
```

> kita ambil contoh ingin download configurasi tmux saja

```
$ git-svn https://github.com/mnabila/dotfiles tmux
```

Begitulah sedikit tutorial dari pemilik dotfiles

# Perlu Dukun ?

- [Telegram - mnabila](https://t.me/mnabila)
- [Twitter - mnabiladani](https://twitter.com/mnabiladani)
