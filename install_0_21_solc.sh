set -e
git clone https://github.com/tonlabs/TON-Solidity-Compiler
cd TON-Solidity-Compiler
git checkout --detach 1657b4f3541f19f3d23f87ac32800efe714bccc7
cd compiler 
sh ./compiler/scripts/install_deps.sh
mkdir build
cd build
cmake .. -DUSE_CVC4=OFF -DUSE_Z3=OFF -DTESTS=OFF -DCMAKE_BUILD_TYPE=Debug
make -j8
cd ../../../
cp TON-Solidity-Compiler/compiler/build/solc/solc ./
cp TON-Solidity-Compiler/lib/stdlib_sol.tvm ./
