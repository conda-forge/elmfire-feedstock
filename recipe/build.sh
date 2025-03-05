#!/bin/bash

set -ex

# Need to drop gfortran flags for OSX
if [[ ${target_platform} =~ .*osx.* ]]; then
  sed -i 's/ -unroll//' ${SRC_DIR}/build/linux/Makefile_elmfire
fi

cd build/linux && ./make_gnu.sh
cp bin/elmfire_$ELMFIRE_VERSION $PREFIX/bin/elmfire
cp bin/elmfire_debug_$ELMFIRE_VERSION $PREFIX/bin/elmfire_debug
cp bin/elmfire_post_$ELMFIRE_VERSION $PREFIX/bin/elmfire_post
cp bin/elmfire_post_debug_$ELMFIRE_VERSION $PREFIX/bin/elmfire_post_debug
