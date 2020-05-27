# fish3.1

function mvb \
  --description "Create and publish macOS Vagrant boxes for the Parallels provider"

  set --local subcommand $argv[1]

  if test -z $subcommand
    _mvb_subcommand_help
    return 1
  end

  switch $subcommand
    case create
      _mvb_subcommand_create $argv[2..-1]
    case package
      _mvb_subcommand_package $argv[2..-1]
    case publish
      _mvb_subcommand_publish $argv[2..-1]
    case help --help -h
      _mvb_subcommand_help
    case version --version -v
      _mvb_subcommand_version
    case '*'
      _mvb_subcommand_help
      return 1
  end
end
