import 'package:dio/dio.dart';

class Conexion {
  static final Conexion _instance = Conexion._internal();

  late Dio dio;
  setDio(String host) {
    dio = Dio(
      BaseOptions(
        baseUrl: host,
        connectTimeout: 5000,
        receiveTimeout: 5000,
      ),
    );
  }

  factory Conexion() {
    return _instance;
  }
  Conexion._internal();
}
