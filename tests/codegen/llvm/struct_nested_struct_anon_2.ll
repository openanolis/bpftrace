; ModuleID = 'bpftrace'
source_filename = "bpftrace"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf-pc-linux"

; Function Attrs: nounwind
declare i64 @llvm.bpf.pseudo(i64, i64) #0

define i64 @"kprobe:f"(i8*) section "s_kprobe:f_1" {
entry:
  %"@x_val" = alloca i64
  %"@x_key" = alloca i64
  %"struct Foo::(anonymous at definitions.h:2:14).x" = alloca i32
  %"$foo" = alloca i64
  %1 = bitcast i64* %"$foo" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %1)
  store i64 0, i64* %"$foo"
  %2 = bitcast i8* %0 to i64*
  %3 = getelementptr i64, i64* %2, i64 14
  %arg0 = load volatile i64, i64* %3
  store i64 %arg0, i64* %"$foo"
  %4 = load i64, i64* %"$foo"
  %5 = add i64 %4, 0
  %6 = add i64 %5, 0
  %7 = bitcast i32* %"struct Foo::(anonymous at definitions.h:2:14).x" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %7)
  %probe_read_kernel = call i64 inttoptr (i64 113 to i64 (i32*, i32, i64)*)(i32* %"struct Foo::(anonymous at definitions.h:2:14).x", i32 4, i64 %6)
  %8 = load i32, i32* %"struct Foo::(anonymous at definitions.h:2:14).x"
  %9 = sext i32 %8 to i64
  %10 = bitcast i32* %"struct Foo::(anonymous at definitions.h:2:14).x" to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %10)
  %11 = bitcast i64* %"@x_key" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %11)
  store i64 0, i64* %"@x_key"
  %12 = bitcast i64* %"@x_val" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %12)
  store i64 %9, i64* %"@x_val"
  %pseudo = call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %update_elem = call i64 inttoptr (i64 2 to i64 (i64, i64*, i64*, i64)*)(i64 %pseudo, i64* %"@x_key", i64* %"@x_val", i64 0)
  %13 = bitcast i64* %"@x_val" to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %13)
  %14 = bitcast i64* %"@x_key" to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %14)
  ret i64 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

attributes #0 = { nounwind }
attributes #1 = { argmemonly nounwind }
