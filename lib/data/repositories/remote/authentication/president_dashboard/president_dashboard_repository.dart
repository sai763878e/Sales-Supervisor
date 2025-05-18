import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/data/repositories/remote/api_client/api_service.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/location_filter_model.dart';

class PresidentDashboardRepository {
  Dio dioPresident = ApiService.instancePresident;
  Dio dio = ApiService.instance;

  static PresidentDashboardRepository? _instance;

  static get instance {
    _instance ??= PresidentDashboardRepository();
    return _instance;
  }

  Future<void> getDashboardData(
      {required String userId,
      required String userTypeId,
      required String reportId,
      required String reportWindowId,
      required String filterOptionBase,
      required String filterOptionYear,
      required String filterOptionMonth,
      required String locationFilterUID,
      required Rx<DashboardComponentModel> model}) async {
    String url =
        'GetData?UserTypeId=$userTypeId&UserId=$userId&ReportId=$reportId&ReportWindowId=$reportWindowId&FilterOptionsBase=$filterOptionBase&FilterOptionsYear=$filterOptionYear&FilterOptionsMonth=$filterOptionMonth&LocationFilterUID=$locationFilterUID';
    try {
      final response = await dioPresident.get(url);
      model.value.response = response.data;
      if (kDebugMode) {
        print(url);
        print(response);
      }
    } catch (e) {
    } finally {
      // model.value.isLoading = false;
    }
  }


  Future<LocationFilter> getLocationFilters({
    required String userId,
    required String userTypeId,
  }) async {
    String url = 'GetMyLocationFilters?UserTypeId=$userTypeId&UserId=$userId';
    try {
      if (kDebugMode) {
        print(url);
      }

      final response = await dio.get(url);
      if (kDebugMode) {
        print(response);
      }
      return LocationFilter.fromJson(response.data);
    } catch (e) {
      rethrow;
    } finally {}
  }

  Future<String?> postLocationFilters(
      {required Map<String, dynamic> data1}) async {
    String url = 'SaveLocationFilter';
    // String url = 'SaveLocationFilter?jsonData=${data1.toString()}';
    try {

      // var jsonData = {'jsonData': data1.toString()};
      var jsonData = {'jsonData': jsonEncode(data1)};

      if (kDebugMode) {
        print(url);
        print(jsonData);
      }

      final response = await dio.post(
        url,
        data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      if (kDebugMode) {
        print(response);
      }

      String responseData = response.data.toString();

      // Fix the invalid JSON (add quotes around the LocationFilterUID)
      responseData = responseData.replaceAllMapped(
        RegExp(r'"LocationFilterUID":\s*([A-F0-9\-]+)'), // Match UUID format
            (match) => '"LocationFilterUID": "${match.group(1)}"',  // Add quotes around the matched value
      );

      return json.decode(responseData)[0]["LocationFilterUID"];
    } catch (e) {
      rethrow;
    } finally {}
  }

  Future<String?> generateDescription(String inputJson) async {
    const String apiUrl = 'https://api.cohere.ai/generate';
    // const String _apiKey   = 'LiccjtZ5OjwiZPSDHGlxygXTevcrPSKPorhq95BP';
    const String _apiKey   = '';

    final Dio _dio = Dio();
    try {
      final response = await _dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          'model': 'command-xlarge-nightly', // Free-tier model
          'prompt': 'Generate a description for this JSON data: $inputJson',
          'max_tokens': 150,
          'temperature': 0.7, // Adjust for creativity
        }),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return responseData['text'].trim();
      } else {
        throw Exception('Failed to generate description: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error while calling Cohere API: $e');
    }
  }

}
