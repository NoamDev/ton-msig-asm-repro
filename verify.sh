#!/usr/bin/env bash

set -o errexit

solc=$(pwd)/bin/solc
lib=$(pwd)/bin/stdlib_sol.tvm
tvm_linker=$(pwd)/bin/tvm_linker

cd sources
$solc $1.sol
$tvm_linker compile --lib "$lib" "$1.code" -o "$1.tvc"
$tvm_linker disasm text "$1.tvc" > "$1.disasmed.code"

cd ../original
$tvm_linker disasm text "$1.tvc" > "$1.disasmed.code"
cd ..

sha256sum "sources/$1.disasmed.code" "original/$1.disasmed.code"
