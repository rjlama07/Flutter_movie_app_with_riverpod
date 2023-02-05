import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/resources/constrains.dart';

final dioClient = Provider(
  (ref) => Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: 10000)),
);
