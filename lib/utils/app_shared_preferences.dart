import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static SharedPreferences? _sharedPreferences;
  static const String favoriteCompaniesKey = 'favorite_companies';

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setFavoriteCompanies(List<String> companies) async {
    await _sharedPreferences!.setStringList(favoriteCompaniesKey, companies);
  }

  static List<String> getFavoriteCompanies() {
    return _sharedPreferences!.getStringList(favoriteCompaniesKey) ?? [];
  }
}
