# Free TON Multisig Assembly Reproduction

## Prerequisite

 - Node.js >= 14.x installed

## Instructions
First (After you clone the repo of course) get solc v0.21 by running:
``` bash
bash setup_tool.sh [compiler_commit] [linker_version]
bash setup_tool.sh 1657b4f3541f19f3d23f87ac32800efe714bccc7 latest
```
Then, get the latest version of tvm linker in whatever way you want, and place the `tvm_linker` executable in the repository's root directory.
After that, you can run:
``` bash
bash verify_optimized.sh SafeMultisigWallet
bash verify_optimized.sh SetcodeMultisigWallet
bash verify_optimized.sh SafeMultisigWallet24
bash verify.sh SetcodeMultisigWallet24
```  

To verify Surf Multisig Wallet, you need solc v0.28:

``` bash
bash setup_tool.sh b0f69a8615d084e0202886e1d9deab9de41cfe3b latest
```

Then, you can run:
``` bash
bash verify_optimized.sh SurfMultisigWallet
```
