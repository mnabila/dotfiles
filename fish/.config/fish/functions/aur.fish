function aur --argument-names args --description "AUR helper for package maintainer"
    switch "$args"
        case init
            set pkgname (basename $PWD)
            git init
            git branch -m main master
            echo "ssh://aur@aur.archlinux.org/$pkgname"

        case commit
            rm .SRCINFO
            makepkg --printsrcinfo >.SRCINFO

            set pkgver (cat PKGBUILD | grep pkgver= | cut -d = -f 2)
            set pkgrel (cat PKGBUILD | grep pkgrel= | cut -d = -f 2)
            git status
            git add .
            git commit -m "chore: release $pkgver-$pkgrel"

        case push
            git push origin master

        case list
            echo "List Packages"
            echo " "
            ssh aur@aur.archlinux.org list-repos

        case "" help
            echo "Usage: aur [options]"
            echo " "
            echo "Available Options:"
            echo "init      Create AUR package"
            echo "srcinfo   Generate SRCINFO"
            echo "release   Commit package"
            echo "push      Push package to repository"
            echo "list      List package in repository"
            echo "help      Show help"
    end
end
