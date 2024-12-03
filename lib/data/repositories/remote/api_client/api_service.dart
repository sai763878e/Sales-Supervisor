import 'package:dio/dio.dart';

class ApiService {
  static String baseUrl =
      "https://inet.haierindia.com/HMISEmpower/WebMethods/AppWebService.asmx/";
  static String baseUrlPresident =
      "https://inet.haierindia.com/HMIS_WebAPI/api/dashboard/";

  // static String baseUrl = "http://182.66.198.209/HMIS/WebMethods/AppWebService.asmx/";

  static Dio? dio;

  static BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  );

  static Dio? dioPresident;

  static BaseOptions optionsPresident = BaseOptions(
    baseUrl: baseUrlPresident,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  );

  static Dio get instance {
    return dio ?? Dio(options);
  }

  static Dio get instancePresident {
    return dioPresident ?? Dio(optionsPresident);
  }
}
