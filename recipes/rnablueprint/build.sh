#!/bin/bash

export BOOST_ROOT="${PREFIX}"

libs=
if [[ ${target_platform} =~ linux.* ]] ; then
    libs=-lrt
fi
py_interface=
if [[ ${PY3K} == 1 ]] ; then
    py_interface='--disable-python2'
else
    py_interface='--disable-python'
fi

autoreconf -fi
./configure \
  --prefix=${PREFIX} \
  $py_interface \
  LIBS="${libs}"

make -j
make check
make install
