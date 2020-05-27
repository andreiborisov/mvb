# fish3.1

function _mvb_subcommand_publish \
  --description 'Publish packaged box in Vagrant Cloud' \
  --argument-names repo box_version changelog box_file

  set --local prune false

  set --local operands
  getopts $argv | while read --local key value
    switch $key
      case _
        set --append operands $value
      case p prune
        set prune $value
      case h help
        _mvb_subcommand_help publish
        return
      case '*'
        _mvb_subcommand_help publish
        return 1
    end
  end

  if test (count $argv) -ne 4
    _mvb_subcommand_help publish
    return 1
  end

  if test ! -f $box_file
    echo "Error: could not find a packaged box at $box_file"
    return 1
  end

  if not _mvb_check_dependencies publish
    return 1
  end

  set --local checksum (string match --regex '[0-9a-z]{64}' -- (shasum -a 256 $box_file))

  _mvb_run_cloud $repo $box_version $changelog $checksum $box_file
  and if test $prune = 'true'
    rm -f $box_file
  end
end
