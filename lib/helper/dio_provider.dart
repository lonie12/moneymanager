import 'package:dio/dio.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 2. add a part file
part 'dio_provider.g.dart';

// 3. use the @riverpod annotation
@riverpod
// 4. update the declaration
Dio dio(DioRef ref) {
  return Dio();
}