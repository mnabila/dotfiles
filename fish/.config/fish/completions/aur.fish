complete --command aur --exclusive --long help --description "Show help"
complete --command aur --exclusive --condition __fish_use_subcommand --arguments release --description "Push package to repository"
complete --command aur --exclusive --condition __fish_use_subcommand --arguments list --description "List package in repository"
