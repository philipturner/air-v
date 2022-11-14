# Test Shaders

This directory compares two shaders, written in OpenCL C and MSL, as they compile down their typical routes. The OpenCL C shader compiles into SPIR-V and is disassembled. The MSL shader compiles into AIR and is disassembled. Both have identical logic and are extremely similar. They enable investigation into how one might translate SPIR-V into AIR.

How to compile and disassemble the OpenCL shader:

```
# Must have 'spirv-tools' installed on your system.
clang -c -target spir64 -O0 -emit-llvm vecAdd_clc.cl -o vecAdd_clc.bc
llvm-spirv vecAdd_clc.bc -o vecAdd_clc.spv
spirv-dis vecAdd_clc.spv -o vecAdd_clc.spv.ll
```

How to compile and disassemble the Metal shader:

```
# Must have Metal command-line tools installed on your system.
xcrun metal -c vecAdd_msl.metal -o vecAdd_msl.air
xcrun metallib vecAdd_msl.air -o vecAdd_msl.metallib
llvm-dis vecAdd_msl.air -o vecAdd_msl.air.ll
```

To disassemble the `.metallib`, the process is more complex. Run the `metallib-dis` executable exported from this package, which uses [MetalLibraryArchive](https://github.com/YuAo/MetalLibraryArchive) and `llvm-dis` internally.
