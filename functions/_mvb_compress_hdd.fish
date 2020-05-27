# fish3.1

function _mvb_compress_hdd \
  --description 'Compress HDD using Parallels CLI disk tool' \
  --argument-names hdd

  prl_disk_tool compact --hdd "$hdd"

  if test $status -ne 0
    echo 'Error: disk compression failed'
    return 1
  end
end
