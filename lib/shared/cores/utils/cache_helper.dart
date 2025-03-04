import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences preferences;

  static void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, required value}) async {
    if (value is int) {
      return await preferences.setInt(key, value);
    } else if (value is String) {
      return await preferences.setString(key, value);
    } else if (value is bool) {
      return await preferences.setBool(key, value);
    } else if (value is double) {
      return await preferences.setDouble(key, value);
    } else {
      return await preferences.setStringList(key, value);
    }
  }

  static Object? getData({required String key}) async {
    return preferences.get(key);
  }
}
