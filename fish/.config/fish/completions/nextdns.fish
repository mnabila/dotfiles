complete --command nextdns --exclusive --long help --description "Print help"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments version --description "show current version"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments install --description "install service init on the system"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments uninstall --description "uninstall service init from the system"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments start --description "start installed service"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments stop --description "stop installed service"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments restart --description "restart installed service"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments status --description "return service status"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments log --description "show service logs"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments upgrade --description "upgrade the cli to the latest version"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments run --description "run the daemon"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments config --description "manage configuration"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments activate --description "setup the system to use NextDNS as a resolver"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments deactivate --description "restore the resolver configuration"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments discovered --description "display discovered clients"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments cache-stats --description "display cache statistics"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments cache-keys --description "dump the list of cached entries"
complete --command nextdns --exclusive --condition __fish_use_subcommand --arguments trace --description "display a stack trace dump"
