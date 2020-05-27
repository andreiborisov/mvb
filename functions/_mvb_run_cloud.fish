# fish3.1

function _mvb_run_cloud \
  --description 'Create version, provider and upload the box in Vagrant Cloud' \
  --argument-names repo box_version changelog checksum box_file

  vagrant cloud version create \
    -d $changelog \
    $repo \
    $box_version

  and vagrant cloud provider create \
    --checksum $checksum \
    --checksum-type 'sha256' \
    $repo \
    'parallels' \
    $box_version

  and vagrant cloud provider upload \
    $repo \
    'parallels' \
    $box_version \
    $box_file
end
