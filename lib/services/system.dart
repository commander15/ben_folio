import 'package:dio/dio.dart';

class System {
  final Dio cdn;

  System({required String cdn}) : cdn = Dio(BaseOptions(baseUrl: cdn));
}
