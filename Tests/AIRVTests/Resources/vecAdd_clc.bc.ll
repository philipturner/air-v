; ModuleID = 'vecAdd_clc.bc'
source_filename = "vecAdd_clc.cl"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir64"

; Function Attrs: convergent noinline norecurse nounwind optnone
define dso_local spir_kernel void @vecAdd(<2 x float> addrspace(1)* noalias noundef align 8 %0, <2 x float> addrspace(1)* noalias noundef align 8 %1, <2 x float> addrspace(1)* noalias noundef align 8 %2, i32 addrspace(2)* noalias noundef align 4 %3) #0 !kernel_arg_addr_space !4 !kernel_arg_access_qual !5 !kernel_arg_type !6 !kernel_arg_base_type !7 !kernel_arg_type_qual !8 {
  %5 = alloca <2 x float> addrspace(1)*, align 8
  %6 = alloca <2 x float> addrspace(1)*, align 8
  %7 = alloca <2 x float> addrspace(1)*, align 8
  %8 = alloca i32 addrspace(2)*, align 8
  %9 = alloca i32, align 4
  store <2 x float> addrspace(1)* %0, <2 x float> addrspace(1)** %5, align 8
  store <2 x float> addrspace(1)* %1, <2 x float> addrspace(1)** %6, align 8
  store <2 x float> addrspace(1)* %2, <2 x float> addrspace(1)** %7, align 8
  store i32 addrspace(2)* %3, i32 addrspace(2)** %8, align 8
  store i32 5, i32* %9, align 4
  %10 = load i32, i32* %9, align 4
  %11 = load i32 addrspace(2)*, i32 addrspace(2)** %8, align 8
  %12 = getelementptr inbounds i32, i32 addrspace(2)* %11, i64 0
  %13 = load i32, i32 addrspace(2)* %12, align 4
  %14 = icmp ult i32 %10, %13
  br i1 %14, label %15, label %31

15:                                               ; preds = %4
  %16 = load <2 x float> addrspace(1)*, <2 x float> addrspace(1)** %5, align 8
  %17 = load i32, i32* %9, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %16, i64 %18
  %20 = load <2 x float>, <2 x float> addrspace(1)* %19, align 8
  %21 = load <2 x float> addrspace(1)*, <2 x float> addrspace(1)** %6, align 8
  %22 = load i32, i32* %9, align 4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %21, i64 %23
  %25 = load <2 x float>, <2 x float> addrspace(1)* %24, align 8
  %26 = fadd <2 x float> %20, %25
  %27 = load <2 x float> addrspace(1)*, <2 x float> addrspace(1)** %7, align 8
  %28 = load i32, i32* %9, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %27, i64 %29
  store <2 x float> %26, <2 x float> addrspace(1)* %30, align 8
  br label %31

31:                                               ; preds = %15, %4
  ret void
}

attributes #0 = { convergent noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!opencl.spir.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{i32 1, i32 2}
!3 = !{!"Homebrew clang version 15.0.4"}
!4 = !{i32 1, i32 1, i32 1, i32 2}
!5 = !{!"none", !"none", !"none", !"none"}
!6 = !{!"float2*", !"float2*", !"float2*", !"uint*"}
!7 = !{!"float __attribute__((ext_vector_type(2)))*", !"float __attribute__((ext_vector_type(2)))*", !"float __attribute__((ext_vector_type(2)))*", !"uint*"}
!8 = !{!"restrict", !"restrict", !"restrict", !"restrict const"}
