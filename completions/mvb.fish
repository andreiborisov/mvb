set --local subcommands create package publish help version

complete -c mvb -f
complete -c mvb -n "not __fish_seen_subcommand_from $subcommands" -a create -d 'Create base box'
complete -c mvb -n '__fish_seen_subcommand_from create; and not __fish_seen_argument -s h -l help' -r -s n -l name -d 'Name of the box'
complete -c mvb -n '__fish_seen_subcommand_from create; and not __fish_seen_argument -s h -l help' -a '(__fish_complete_path *.app "macOS installer")'

complete -c mvb -n "not __fish_seen_subcommand_from $subcommands" -a package -d 'Package installed box'
complete -c mvb -n '__fish_seen_subcommand_from package; and not __fish_seen_argument -s h -l help' -r -s n -l name -d 'Name of the box'
complete -c mvb -n "__fish_seen_subcommand_from package; and not __fish_seen_argument -s h -l help" -r -s p -l prune -d 'Remove installed box'
complete -c mvb -n '__fish_seen_subcommand_from package; and not __fish_seen_argument -s h -l help' -a '(__fish_complete_path *.box "Box file")'

complete -c mvb -n "not __fish_seen_subcommand_from $subcommands" -a publish -d 'Publish packaged box'
complete -c mvb -n "__fish_seen_subcommand_from publish; and not __fish_seen_argument -s h -l help" -r -s p -l prune -d 'Remove packaged box'

complete -c mvb -n "__fish_seen_subcommand_from create package publish; and not __fish_seen_argument -s h -l help" -s h -l help -d 'Show subcommand help'

complete -c mvb -n "not __fish_seen_subcommand_from $subcommands" -a help -d 'Show help'

complete -c mvb -n "not __fish_seen_subcommand_from $subcommands" -a version -d 'Print version info'
