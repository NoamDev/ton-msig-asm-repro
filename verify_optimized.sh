set -e
cd sources
../solc $1.sol --tvm-optimize
../tvm_linker compile --lib ../stdlib_sol.tvm $1.code -o $1.tvc
../tvm_linker disasm solidity_v1 $1.tvc > $1.disasmed.code
cd ../original
../tvm_linker disasm solidity_v1 $1.tvc > $1.disasmed.code
cd ..
sha256sum sources/$1.disasmed.code original/$1.disasmed.code
