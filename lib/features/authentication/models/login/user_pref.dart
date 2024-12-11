import 'dart:convert';

import 'package:sales_supervisor/features/authentication/models/login/user.dart';
import 'package:sales_supervisor/utils/constants/prefernece_constants.dart';
import 'package:sales_supervisor/utils/local_storage/storage_utility.dart';

class UserPref {
  static UserPref? _instance;

  static UserPref get i {
    return _instance ?? UserPref();
  }

  void saveUserData(User user) {
    CLocalStorage()
        .saveData(PreferenceConstants.userMaster, json.encode(user.toJson()));
  }

  User? getUserData() {
    try {
      return User.fromJson(json
          .decode(CLocalStorage().readData(PreferenceConstants.userMaster)));
    } catch (e) {
      rethrow;
    }
  }
}
