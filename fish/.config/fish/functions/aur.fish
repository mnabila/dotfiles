function aur --argument-names args --description "AUR helper for package maintainer"
    switch "$args"
        case r release
            set version (cat PKGBUILD | grep pkgver= | cut -d = -f 2)
            rm .SRCINFO
            makepkg --printsrcinfo >.SRCINFO
            git status
            git add .
            git commit -m "chore: release $version"
            git push origin master

        case l list
            echo "List Packages"
            echo " "
            ssh aur@aur.archlinux.org list-repos

        case "" h help
            echo "Usage: aur [options]"
            echo " "
            echo "Available Options:"
            echo "r   release   Push package to repository"
            echo "l   list      List package in repository"
            echo "h   help      Show help"
    end
end
