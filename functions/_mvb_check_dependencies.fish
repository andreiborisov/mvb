# fish3.1

function _mvb_check_dependencies \
  --description 'Check for mvb runtime dependencies' \
  --argument-names subcommand

  if not type --force-path --quiet vagrant
    echo 'Error: could not find Vagrant'
    return 1
  end

  switch $subcommand
    case create
      if not type --force-path --quiet macinbox
        echo 'Error: could not find macinbox'
        return 1
      end
    case package
      if not type --force-path --quiet prl_disk_tool
        echo 'Error: could not find Parallels Desktop'
        return 1
      end
    case publish
      if not type --force-path --quiet shasum
        echo 'Error: could not find shasum'
        return 1
      end
      if not vagrant cloud auth login --check >/dev/null
        echo 'Error: could not publish the box, because you\'re logged out from Vagrant Cloud'
        return 1
      end
  end
end
