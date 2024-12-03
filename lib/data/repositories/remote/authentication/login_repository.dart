import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sales_supervisor/data/repositories/remote/api_client/api_service.dart';
import 'package:sales_supervisor/features/authentication/models/login/user.dart';
import 'package:sales_supervisor/features/authentication/models/login/user_pref.dart';

class LoginRepository {
  Dio dio = ApiService.instance;

  Future<User?> login(
      String userName, String password, String deviceId, String imeiNo) async {
    String url =
        "SmartLoginWithIMEILock?Str_UserName=$userName&Str_Password=$password&Str_Deviceid=$deviceId&Str_PrivacyPolicyAccept=true&Str_IMEINo=$imeiNo";

    try {
      final response = await dio.get(url);

      // Parse response data
      List<dynamic>? data = response.data; // Response data as a JSON array
      List<User>? users = data?.map((json) => User.fromJson(json)).toList();

      if (users != null && users.isNotEmpty) {
        UserPref.i.saveUserData(users[0]);
      }

      User? user = UserPref.i.getUserData();

      if (kDebugMode) {
        print(user);
      }

      return user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
