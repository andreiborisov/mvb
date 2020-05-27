# fish3.1

function _mvb_subcommand_create \
  --description 'Create macOS base box'

  set --local name 'macos'
  set --local macos_version
  set --local installer

  set --local operands
  getopts $argv | while read --local key value
    switch $key
      case _
        set --append operands $value
      case n name
        set name $value
      case h help
        _mvb_subcommand_help create
        return
      case '*'
        _mvb_subcommand_help create
        return 1
    end
  end

  if test (count $operands) -ne 2
    _mvb_subcommand_help create
    return 1
  end

  set macos_version $operands[1]
  set installer $operands[2]

  if test ! -d $installer
    echo "Error: coudn't find an installer at $installer"
    return 1
  end

  if not _mvb_check_dependencies create
    return 1
  end

  set --local vagrant_box_dir "$HOME/.vagrant.d/boxes/$name/$macos_version/parallels"

  _mvb_run_macinbox $name $installer
  and _mvb_copy_template $vagrant_box_dir
end
