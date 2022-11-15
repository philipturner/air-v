; SPIR-V
; Version: 1.0
; Generator: Khronos LLVM/SPIR-V Translator; 14
; Bound: 56
; Schema: 0
               OpCapability Addresses
               OpCapability Linkage
               OpCapability Kernel
               OpCapability Int64
          %1 = OpExtInstImport "OpenCL.std"
               OpMemoryModel Physical64 OpenCL
               OpEntryPoint Kernel %49 "vecAdd"
               OpExecutionMode %49 ContractionOff
               OpSource OpenCL_C 102000
               OpName %vecAdd "vecAdd"
               OpDecorate %vecAdd LinkageAttributes "vecAdd" Export
               OpDecorate %10 FuncParamAttr NoAlias
               OpDecorate %10 Alignment 8
               OpDecorate %11 FuncParamAttr NoAlias
               OpDecorate %11 Alignment 8
               OpDecorate %12 FuncParamAttr NoAlias
               OpDecorate %12 Alignment 8
               OpDecorate %13 FuncParamAttr NoAlias
               OpDecorate %13 Alignment 4
               OpDecorate %18 Alignment 8
               OpDecorate %19 Alignment 8
               OpDecorate %20 Alignment 8
               OpDecorate %22 Alignment 8
               OpDecorate %24 Alignment 4
               OpDecorate %50 FuncParamAttr NoAlias
               OpDecorate %50 Alignment 8
               OpDecorate %51 FuncParamAttr NoAlias
               OpDecorate %51 Alignment 8
               OpDecorate %52 FuncParamAttr NoAlias
               OpDecorate %52 Alignment 8
               OpDecorate %53 FuncParamAttr NoAlias
               OpDecorate %53 Alignment 4
               OpDecorate %50 FuncParamAttr NoAlias
               OpDecorate %51 FuncParamAttr NoAlias
               OpDecorate %52 FuncParamAttr NoAlias
               OpDecorate %53 FuncParamAttr NoAlias
       %uint = OpTypeInt 32 0
      %ulong = OpTypeInt 64 0
     %uint_5 = OpConstant %uint 5
    %ulong_0 = OpConstant %ulong 0
       %void = OpTypeVoid
      %float = OpTypeFloat 32
    %v2float = OpTypeVector %float 2
%_ptr_CrossWorkgroup_v2float = OpTypePointer CrossWorkgroup %v2float
%_ptr_UniformConstant_uint = OpTypePointer UniformConstant %uint
          %8 = OpTypeFunction %void %_ptr_CrossWorkgroup_v2float %_ptr_CrossWorkgroup_v2float %_ptr_CrossWorkgroup_v2float %_ptr_UniformConstant_uint
%_ptr_Function__ptr_CrossWorkgroup_v2float = OpTypePointer Function %_ptr_CrossWorkgroup_v2float
%_ptr_Function__ptr_UniformConstant_uint = OpTypePointer Function %_ptr_UniformConstant_uint
%_ptr_Function_uint = OpTypePointer Function %uint
       %bool = OpTypeBool
     %vecAdd = OpFunction %void DontInline %8
         %10 = OpFunctionParameter %_ptr_CrossWorkgroup_v2float
         %11 = OpFunctionParameter %_ptr_CrossWorkgroup_v2float
         %12 = OpFunctionParameter %_ptr_CrossWorkgroup_v2float
         %13 = OpFunctionParameter %_ptr_UniformConstant_uint
         %14 = OpLabel
         %18 = OpVariable %_ptr_Function__ptr_CrossWorkgroup_v2float Function
         %19 = OpVariable %_ptr_Function__ptr_CrossWorkgroup_v2float Function
         %20 = OpVariable %_ptr_Function__ptr_CrossWorkgroup_v2float Function
         %22 = OpVariable %_ptr_Function__ptr_UniformConstant_uint Function
         %24 = OpVariable %_ptr_Function_uint Function
               OpStore %18 %10 Aligned 8
               OpStore %19 %11 Aligned 8
               OpStore %20 %12 Aligned 8
               OpStore %22 %13 Aligned 8
               OpStore %24 %uint_5 Aligned 4
         %26 = OpLoad %uint %24 Aligned 4
         %27 = OpLoad %_ptr_UniformConstant_uint %22 Aligned 8
         %30 = OpInBoundsPtrAccessChain %_ptr_UniformConstant_uint %27 %ulong_0
         %31 = OpLoad %uint %30 Aligned 4
         %33 = OpULessThan %bool %26 %31
               OpBranchConditional %33 %15 %16
         %15 = OpLabel
         %34 = OpLoad %_ptr_CrossWorkgroup_v2float %18 Aligned 8
         %35 = OpLoad %uint %24 Aligned 4
         %36 = OpUConvert %ulong %35
         %37 = OpInBoundsPtrAccessChain %_ptr_CrossWorkgroup_v2float %34 %36
         %38 = OpLoad %v2float %37 Aligned 8
         %39 = OpLoad %_ptr_CrossWorkgroup_v2float %19 Aligned 8
         %40 = OpLoad %uint %24 Aligned 4
         %41 = OpUConvert %ulong %40
         %42 = OpInBoundsPtrAccessChain %_ptr_CrossWorkgroup_v2float %39 %41
         %43 = OpLoad %v2float %42 Aligned 8
         %44 = OpFAdd %v2float %38 %43
         %45 = OpLoad %_ptr_CrossWorkgroup_v2float %20 Aligned 8
         %46 = OpLoad %uint %24 Aligned 4
         %47 = OpUConvert %ulong %46
         %48 = OpInBoundsPtrAccessChain %_ptr_CrossWorkgroup_v2float %45 %47
               OpStore %48 %44 Aligned 8
               OpBranch %16
         %16 = OpLabel
               OpReturn
               OpFunctionEnd
         %49 = OpFunction %void DontInline %8
         %50 = OpFunctionParameter %_ptr_CrossWorkgroup_v2float
         %51 = OpFunctionParameter %_ptr_CrossWorkgroup_v2float
         %52 = OpFunctionParameter %_ptr_CrossWorkgroup_v2float
         %53 = OpFunctionParameter %_ptr_UniformConstant_uint
         %54 = OpLabel
         %55 = OpFunctionCall %void %vecAdd %50 %51 %52 %53
               OpReturn
               OpFunctionEnd
