import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vistas_del_rio_1/core/models/resp_login.model.dart';

class PreferencesService {
  static const _userKey = 'user_data';

  Future<void> saveUserData(RespLoginModel user) async {
    final prefs = await SharedPreferences.getInstance();
    // Convertimos el modelo a JSON
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<RespLoginModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);

    if (userJson == null) return null;

    final Map<String, dynamic> data = jsonDecode(userJson);
    return RespLoginModel.fromJson(data);
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
