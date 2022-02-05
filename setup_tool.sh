#!/usr/bin/env bash

set -o errexit

compiler_commit=${1:-1657b4f3541f19f3d23f87ac32800efe714bccc7}
linker_version=${2:-latest}

if [ ! -d tmp/TON-Solidity-Compiler ]; then
  git clone https://github.com/tonlabs/TON-Solidity-Compiler tmp/TON-Solidity-Compiler
fi

if [ ! -d "bin/${compiler_commit}" ]; then
  cd tmp/TON-Solidity-Compiler
  git checkout --detach "${compiler_commit}"
  cd compiler
  . scripts/install_deps.sh
  mkdir -p build
  cd build
  cmake .. -DUSE_CVC4=OFF -DUSE_Z3=OFF -DTESTS=OFF -DCMAKE_BUILD_TYPE=Debug
  make -j"$(nproc)"
  cd ../../../../
  mkdir -p "bin/${compiler_commit}"
  cp tmp/TON-Solidity-Compiler/compiler/build/solc/solc bin/${compiler_commit}/
  cp tmp/TON-Solidity-Compiler/lib/stdlib_sol.tvm bin/${compiler_commit}/
  cat << EOF > bin/${compiler_commit}/switch
#!/usr/bin/env bash
ln -fs "$(pwd)/bin/${compiler_commit}/solc" "$(pwd)/bin/solc"
ln -fs "$(pwd)/bin/${compiler_commit}/stdlib_sol.tvm" "$(pwd)/bin/stdlib_sol.tvm"
EOF
fi
# shellcheck disable=SC1090
. "bin/${compiler_commit}/switch"

npx everdev sol set --linker "${linker_version}"
ln -fs $HOME/.everdev/solidity/tvm_linker "$(pwd)/bin/tvm_linker"
