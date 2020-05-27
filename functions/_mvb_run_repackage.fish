# fish3.1

function _mvb_run_repackage \
  --description 'Repackage box using `vagrant box repackage`' \
  --argument-names name macos_version output_file

  set --local temp_dir (mktemp -d 2>/dev/null; or mktemp -d -t 'temp')

  pushd $temp_dir; and vagrant box repackage "$name" parallels "$macos_version"

  if test $status -ne 0
    echo "Error: repackage failed"
    popd
    return 1
  end

  popd
  mv -f $temp_dir/package.box $output_file
end
