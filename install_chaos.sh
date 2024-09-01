#!/bin/bash

source i686_chaos.env

mkdir -p $PREFIX
cd $PREFIX

if [ ! -e $PREFIX/source ]
then
mkdir $PREFIX/source
fi
cd $PREFIX/source

if [ ! -e ./binutils-gdb ]
then
git clone git@github.com:idrol/binutils-chaos.git binutils-gdb
fi

if [ ! -e ./gcc ]
then
git clone git@github.com:idrol/gcc-chaos.git gcc
fi
