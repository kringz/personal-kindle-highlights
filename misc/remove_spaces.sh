find /search/path -depth -name '* *' \
    -execdir bash -c 'mv "$1" "${1// /_}"' _ {} \;
