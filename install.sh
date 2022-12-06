#!/bin/bash

source i686.env

mkdir -p $PREFIX
cd $PREFIX

if [ ! -e $PREFIX/src_i686 ]
then
mkdir $PREFIX/src_i686
fi
cd $PREFIX/src_i686

if [ ! -e binutils.tar.gz ]
then
wget -cO - https://ftp.gnu.org/gnu/binutils/binutils-2.39.tar.gz > binutils.tar.gz
fi

if [ ! -e gcc.tar.gz ]
then
wget -cO - https://ftp.gnu.org/gnu/gcc/gcc-12.2.0/gcc-12.2.0.tar.gz > gcc.tar.gz
fi

if [ ! -e ./binutils ]
then
mkdir binutils
tar -xvzf binutils.tar.gz --strip-components=1 -C binutils
fi

if [ ! -e ./gcc ]
then
mkdir gcc
tar -xvzf gcc.tar.gz --strip-components=1 -C gcc
fi

if [ ! -e ./build_binutils ]
then
mkdir build_binutils
cd build_binutils
../binutils/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j 8
make install
cd ..
fi

if [ ! -e ./build_gcc ]
then
mkdir build_gcc
cd build_gcc
../gcc/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc -j 8
make all-target-libgcc -j 8
make install-gcc
make install-target-libgcc
fi


