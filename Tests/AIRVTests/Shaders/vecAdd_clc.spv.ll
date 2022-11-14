; SPIR-V
; Version: 1.0
; Generator: Khronos LLVM/SPIR-V Translator; 14
; Bound: 55
; Schema: 0
               OpCapability Addresses
               OpCapability Linkage
               OpCapability Kernel
               OpCapability Int64
          %1 = OpExtInstImport "OpenCL.std"
               OpMemoryModel Physical64 OpenCL
               OpEntryPoint Kernel %48 "vecAdd"
               OpExecutionMode %48 ContractionOff
               OpSource OpenCL_C 102000
               OpName %vecAdd "vecAdd"
               OpDecorate %vecAdd LinkageAttributes "vecAdd" Export
               OpDecorate %9 FuncParamAttr NoAlias
               OpDecorate %9 Alignment 4
               OpDecorate %10 FuncParamAttr NoAlias
               OpDecorate %10 Alignment 4
               OpDecorate %11 FuncParamAttr NoAlias
               OpDecorate %11 Alignment 4
               OpDecorate %12 FuncParamAttr NoAlias
               OpDecorate %12 Alignment 4
               OpDecorate %17 Alignment 8
               OpDecorate %18 Alignment 8
               OpDecorate %19 Alignment 8
               OpDecorate %21 Alignment 8
               OpDecorate %23 Alignment 4
               OpDecorate %49 FuncParamAttr NoAlias
               OpDecorate %49 Alignment 4
               OpDecorate %50 FuncParamAttr NoAlias
               OpDecorate %50 Alignment 4
               OpDecorate %51 FuncParamAttr NoAlias
               OpDecorate %51 Alignment 4
               OpDecorate %52 FuncParamAttr NoAlias
               OpDecorate %52 Alignment 4
               OpDecorate %49 FuncParamAttr NoAlias
               OpDecorate %50 FuncParamAttr NoAlias
               OpDecorate %51 FuncParamAttr NoAlias
               OpDecorate %52 FuncParamAttr NoAlias
       %uint = OpTypeInt 32 0
      %ulong = OpTypeInt 64 0
     %uint_5 = OpConstant %uint 5
    %ulong_0 = OpConstant %ulong 0
       %void = OpTypeVoid
      %float = OpTypeFloat 32
%_ptr_CrossWorkgroup_float = OpTypePointer CrossWorkgroup %float
%_ptr_UniformConstant_uint = OpTypePointer UniformConstant %uint
          %7 = OpTypeFunction %void %_ptr_CrossWorkgroup_float %_ptr_CrossWorkgroup_float %_ptr_CrossWorkgroup_float %_ptr_UniformConstant_uint
%_ptr_Function__ptr_CrossWorkgroup_float = OpTypePointer Function %_ptr_CrossWorkgroup_float
%_ptr_Function__ptr_UniformConstant_uint = OpTypePointer Function %_ptr_UniformConstant_uint
%_ptr_Function_uint = OpTypePointer Function %uint
       %bool = OpTypeBool
     %vecAdd = OpFunction %void DontInline %7
          %9 = OpFunctionParameter %_ptr_CrossWorkgroup_float
         %10 = OpFunctionParameter %_ptr_CrossWorkgroup_float
         %11 = OpFunctionParameter %_ptr_CrossWorkgroup_float
         %12 = OpFunctionParameter %_ptr_UniformConstant_uint
         %13 = OpLabel
         %17 = OpVariable %_ptr_Function__ptr_CrossWorkgroup_float Function
         %18 = OpVariable %_ptr_Function__ptr_CrossWorkgroup_float Function
         %19 = OpVariable %_ptr_Function__ptr_CrossWorkgroup_float Function
         %21 = OpVariable %_ptr_Function__ptr_UniformConstant_uint Function
         %23 = OpVariable %_ptr_Function_uint Function
               OpStore %17 %9 Aligned 8
               OpStore %18 %10 Aligned 8
               OpStore %19 %11 Aligned 8
               OpStore %21 %12 Aligned 8
               OpStore %23 %uint_5 Aligned 4
         %25 = OpLoad %uint %23 Aligned 4
         %26 = OpLoad %_ptr_UniformConstant_uint %21 Aligned 8
         %29 = OpInBoundsPtrAccessChain %_ptr_UniformConstant_uint %26 %ulong_0
         %30 = OpLoad %uint %29 Aligned 4
         %32 = OpULessThan %bool %25 %30
               OpBranchConditional %32 %14 %15
         %14 = OpLabel
         %33 = OpLoad %_ptr_CrossWorkgroup_float %17 Aligned 8
         %34 = OpLoad %uint %23 Aligned 4
         %35 = OpUConvert %ulong %34
         %36 = OpInBoundsPtrAccessChain %_ptr_CrossWorkgroup_float %33 %35
         %37 = OpLoad %float %36 Aligned 4
         %38 = OpLoad %_ptr_CrossWorkgroup_float %18 Aligned 8
         %39 = OpLoad %uint %23 Aligned 4
         %40 = OpUConvert %ulong %39
         %41 = OpInBoundsPtrAccessChain %_ptr_CrossWorkgroup_float %38 %40
         %42 = OpLoad %float %41 Aligned 4
         %43 = OpFAdd %float %37 %42
         %44 = OpLoad %_ptr_CrossWorkgroup_float %19 Aligned 8
         %45 = OpLoad %uint %23 Aligned 4
         %46 = OpUConvert %ulong %45
         %47 = OpInBoundsPtrAccessChain %_ptr_CrossWorkgroup_float %44 %46
               OpStore %47 %43 Aligned 4
               OpBranch %15
         %15 = OpLabel
               OpReturn
               OpFunctionEnd
         %48 = OpFunction %void DontInline %7
         %49 = OpFunctionParameter %_ptr_CrossWorkgroup_float
         %50 = OpFunctionParameter %_ptr_CrossWorkgroup_float
         %51 = OpFunctionParameter %_ptr_CrossWorkgroup_float
         %52 = OpFunctionParameter %_ptr_UniformConstant_uint
         %53 = OpLabel
         %54 = OpFunctionCall %void %vecAdd %49 %50 %51 %52
               OpReturn
               OpFunctionEnd
