import 'package:ben_folio/services/system.dart';

class Service {
  final System system;

  Service({required this.system});

  Future<void> download(String url) {
    return Future.delayed(Duration(seconds: 3));
  }
}

class ServiceRequest {
}

class ServiceResponse<T> {
  T? get object => objects == null || objects!.isEmpty ? null : objects![0];
  final List<T>? objects;

  const ServiceResponse({this.objects});
}