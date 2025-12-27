import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_shared_preferences.dart';

class FavoritesController extends GetxController {
  var favoriteCompanies = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void toggleFavorite(String company) {
    if (favoriteCompanies.contains(company)) {
      favoriteCompanies.remove(company);
    } else {
      favoriteCompanies.add(company);
    }
    saveFavorites();
  }

  bool isFavorite(String company) {
    return favoriteCompanies.contains(company);
  }
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    favoriteCompanies.assignAll(prefs.getStringList('favorite_companies') ?? []);
  }

  void saveFavorites() {
    AppSharedPreferences.setFavoriteCompanies(favoriteCompanies);
  }
}
