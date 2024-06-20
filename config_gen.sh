#!/bin/bash
export KBUILD_BUILD_USER=ghazzor

PATH=$PWD/toolchain/bin:$PATH
export LLVM_DIR=$PWD/toolchain/bin
export LLVM=1

export ARCH=arm64

ARGS='
CC=clang
LD='${LLVM_DIR}/ld.lld'
ARCH=arm64
CROSS_COMPILE='${LLVM_DIR}/llvm-'
CROSS_COMPILE_COMPAT='${LLVM_DIR}/llvm-'
AR='${LLVM_DIR}/llvm-ar'
NM='${LLVM_DIR}/llvm-nm'
AS='${LLVM_DIR}/llvm-as'
OBJCOPY='${LLVM_DIR}/llvm-objcopy'
OBJDUMP='${LLVM_DIR}/llvm-objdump'
READELF='${LLVM_DIR}/llvm-readelf'
OBJSIZE='${LLVM_DIR}/llvm-size'
STRIP='${LLVM_DIR}/llvm-strip'
LLVM_AR='${LLVM_DIR}/llvm-ar'
LLVM_DIS='${LLVM_DIR}/llvm-dis'
LLVM_NM='${LLVM_DIR}/llvm-nm'
LLVM=1
'
rm -rf vendor/holi-qgki_defconfig
ARCH=arm64 AR=llvm-ar REAL_CC=clang CROSS_COMPILE_COMPAT='${LLVM_DIR}/llvm-' CC=clang CROSS_COMPILE='${LLVM_DIR}/llvm-' LD='${LLVM_DIR}/ld.lld' CLANG_TRIPLE=aarch64-linux-gnu- TARGET_PRODUCT=fogos LLVM=1 LLVM_IAS=1 TARGET_BUILD_VARIANT=user scripts/gki/generate_defconfig.sh holi-qgki_defconfig 2>&1 | tee some.log
rm -rf out
make ${ARGS} O=out vendor/holi-qgki_defconfig
