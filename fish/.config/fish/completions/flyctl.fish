complete --command flyctl --exclusive --long help --description "Print help"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments apps --description "Manage apps"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments auth --description "Manage authentication"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments autoscale --description "Autoscaling app resources"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments builds --description "Work with Fly builds"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments certs --description "Manage certificates"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments checks --description "Manage health checks"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments completion --description "generate the autocompletion script for the specified shell"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments config --description "Manage an app's configuration"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments dashboard --description "Open web browser on Fly Web UI for this app"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments deploy --description "Deploy an app to the Fly platform"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments destroy --description "Permanently destroys an app"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments dns-records --description "Manage DNS records"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments docs --description "View Fly documentation"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments domains --description "Manage domains"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments help --description "Help about any command"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments history --description "List an app's change history"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments image --description "Manage app image"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments info --description "Show detailed app information"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments ips --description "Manage IP addresses for apps"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments launch --description "Launch a new app"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments list --description "Lists your Fly resources"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments logs --description "View app logs"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments machine --description "Commands that manage machines"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments monitor --description "Monitor deployments"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments move --description "Move an app to another organization"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments open --description "Open browser to current deployed application"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments orgs --description "Commands for managing Fly organizations"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments platform --description "Fly platform information"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments postgres --description "Manage postgres clusters"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments proxy --description "Proxies connections to a fly app"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments regions --description "Manage regions"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments releases --description "List app releases"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments restart --description "Restart an application"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments resume --description "Resume an application"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments scale --description "Scale app resources"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments secrets --description "Manage app secrets"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments ssh --description "Commands that manage SSH credentials"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments status --description "Show app status"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments suspend --description "Suspend an application"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments version --description "Show version information for the flyctl command"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments vm --description "Commands that manage VM instances"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments volumes --description "Volume management commands"
complete --command flyctl --exclusive --condition __fish_use_subcommand --arguments wireguard --description "Commands that manage WireGuard peer connections"
