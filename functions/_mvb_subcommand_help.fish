# fish3.1

function _mvb_subcommand_help \
  --description 'Print help' \
  --argument-names subcommand

  switch $subcommand
    case ''
      echo 'mvb (macOS Vagrant boxes) is a toolchain for the creation and publishing of macOS Vagrant base boxes for the Parallels provider.'
      echo
      echo 'Usage: mvb create [OPTIONS] MACOS_VERSION INSTALLER'
      echo '   or: mvb package [OPTIONS] MACOS_VERSION BOX_FILE'
      echo '   or: mvb publish [OPTIONS] REPO BOX_VERSION CHANGELOG BOX_FILE'
      echo '   or: mvb help'
      echo '   or: mvb version'
      echo
      echo 'Options:'
      echo '  -h, --help     Show help for the subcommand'
    case create
      echo 'Create macOS MACOS_VERSION base box for the Parallels provider from INSTALLER.'
      echo
      echo 'Usage: mvb create [OPTIONS] MACOS_VERSION INSTALLER'
      echo
      echo 'Options:'
      echo '  -n, --name     Name of the Vagrant box  (default: macos)'
      echo '  -h, --help     Show this help'
    case package
      echo 'Package macOS MACOS_VERSION box into the BOX_FILE.'
      echo
      echo 'Usage: mvb package [OPTIONS] MACOS_VERSION BOX_FILE'
      echo
      echo 'Options:'
      echo '  -n, --name     Name of the Vagrant box                       (default: macos)'
      echo '  -p, --prune    Remove locally installed box after packaging  (default: false)'
      echo '  -h, --help     Show this help'
    case publish
      echo 'Publish BOX_FILE into the Vagrant Cloud REPO as a BOX_VERSION with CHANGELOG.'
      echo
      echo 'Usage: mvb publish [OPTIONS] REPO BOX_VERSION CHANGELOG BOX_FILE'
      echo
      echo 'Options:'
      echo '  -p, --prune    Remove packaged box after publishing  (default: false)'
      echo '  -h, --help     Show this help'
  end
end
