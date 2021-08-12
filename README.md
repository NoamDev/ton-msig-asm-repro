# Free TON Multisig Assembly Reproduction

## Instructions
First (After you clone the repo of course) get solc v0.21 by running:
``` bash
$ ./install_0_21_solc.sh
```
Then, get the latest version of tvm linker in whatever way you want, and place the `tvm_linker` executable in the repository's root directory.
After that, you can run:
``` bash
./verify_optimized.sh SafeMultisigWallet
./verify_optimized.sh SetcodeMultisigWallet
./verify_optimized.sh SafeMultisigWallet24
./verify.sh SetcodeMultisigWallet24
```  
