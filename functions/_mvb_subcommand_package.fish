# fish3.1

function _mvb_subcommand_package \
  --description 'Package locally installed box for publishing'

  set --local name 'macos'
  set --local prune false
  set --local macos_version
  set --local output_file

  set --local operands
  getopts $argv | while read --local key value
    switch $key
      case _
        set --append operands $value
      case n name
        set name $value
      case p prune
        set prune $value
      case h help
        _mvb_subcommand_help package
        return
      case '*'
        _mvb_subcommand_help package
        return 1
    end
  end

  if test (count $operands) -ne 2
    _mvb_subcommand_help package
    return 1
  end

  set macos_version $operands[1]
  set output_file $operands[2]

  if test -e $output_file
    echo "Error: $output_file already exist"
    return 1
  end

  if not _mvb_check_dependencies package
    return 1
  end

  set --local vagrant_box_dir "$HOME/.vagrant.d/boxes/$name/$macos_version/parallels"

  _mvb_compress_hdd $vagrant_box_dir/macinbox.pvm/macinbox.hdd
  and _mvb_run_repackage $name $macos_version $output_file
  and if test $prune = 'true'
    vagrant box remove --force --box-version $macos_version --provider 'parallels' $name
  end
end
