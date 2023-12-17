import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const String _keyToken = "token";
  static const String _keyPhone = "phone";

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async => await _preferences!.setString(_keyToken, token);

  static String? getToken() => _preferences!.getString(_keyToken);

  static Future reset() async {
    await _preferences!.remove(_keyToken);
    await _preferences!.remove(_keyPhone);
  }

  static Future setPhone(String phone) async => await _preferences!.setString(_keyPhone, phone);

  static String? getPhone() => _preferences!.getString(_keyPhone);
}
