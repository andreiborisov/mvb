# fish3.1

function _mvb_run_macinbox \
  --description 'Build macOS Vagrant box using macinbox' \
  --argument-names name installer

  set --local disk '64'
  set --local fstype 'APFS'
  set --local memory '4096'
  set --local cpu '2'
  set --local short 'vagrant'
  set --local full 'Vagrant'
  set --local password 'vagrant'

  sudo macinbox \
    --box-format 'parallels' \
    --name "$name" \
    --disk "$disk" \
    --memory "$memory" \
    --fstype "$fstype" \
    --cpu "$cpu" \
    --full "$full" \
    --short "$short" \
    --password "$password" \
    --installer "$installer" \
    --no-hidpi \
    --no-gui
end
