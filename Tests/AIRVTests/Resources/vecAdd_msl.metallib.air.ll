; ModuleID = 'vecAdd_msl.metallib.air'
source_filename = "vecAdd"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64-apple-macosx13.0.0"

; Function Attrs: norecurse nounwind
define void @vecAdd(<2 x float> addrspace(1)* noalias nocapture readonly %0, <2 x float> addrspace(1)* noalias nocapture readonly %1, <2 x float> addrspace(1)* noalias nocapture %2, i32 addrspace(2)* noalias nocapture readonly %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %3, align 4, !tbaa !21
  %6 = icmp ugt i32 %5, 5
  br i1 %6, label %7, label %14

7:                                                ; preds = %4
  %8 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %2, i64 5
  %9 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %1, i64 5
  %10 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %0, i64 5
  %11 = load <2 x float>, <2 x float> addrspace(1)* %10, align 8, !tbaa !25
  %12 = load <2 x float>, <2 x float> addrspace(1)* %9, align 8, !tbaa !25
  %13 = fadd fast <2 x float> %12, %11
  store <2 x float> %13, <2 x float> addrspace(1)* %8, align 8, !tbaa !25
  br label %14

14:                                               ; preds = %7, %4
  ret void
}

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}
!air.version = !{!9}
!air.language_version = !{!10}
!air.compile_options = !{!11, !12, !13}
!air.kernel = !{!14}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"air.max_device_buffers", i32 31}
!3 = !{i32 7, !"air.max_constant_buffers", i32 31}
!4 = !{i32 7, !"air.max_threadgroup_buffers", i32 31}
!5 = !{i32 7, !"air.max_textures", i32 128}
!6 = !{i32 7, !"air.max_read_write_textures", i32 8}
!7 = !{i32 7, !"air.max_samplers", i32 16}
!8 = !{!"Apple metal version 31001.660 (metalfe-31001.660.6)"}
!9 = !{i32 2, i32 5, i32 0}
!10 = !{!"Metal", i32 3, i32 0, i32 0}
!11 = !{!"air.compile.denorms_disable"}
!12 = !{!"air.compile.fast_math_enable"}
!13 = !{!"air.compile.framebuffer_fetch_enable"}
!14 = !{void (<2 x float> addrspace(1)*, <2 x float> addrspace(1)*, <2 x float> addrspace(1)*, i32 addrspace(2)*)* @vecAdd, !15, !16}
!15 = !{}
!16 = !{!17, !18, !19, !20}
!17 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"float2", !"air.arg_name", !"a"}
!18 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"float2", !"air.arg_name", !"b"}
!19 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"float2", !"air.arg_name", !"c"}
!20 = !{i32 3, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"n"}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = !{!23, !23, i64 0}
