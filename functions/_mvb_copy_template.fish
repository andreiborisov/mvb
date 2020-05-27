# fish3.1

function _mvb_copy_template \
  --description 'Copy template Vagrantfile to locally installed box location' \
  --argument-names destination

  set --local package_dir (sonar)
  cp $package_dir/template/Vagrantfile $destination/Vagrantfile
end
