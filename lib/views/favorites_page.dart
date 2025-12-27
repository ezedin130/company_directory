import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favorite_controller.dart';
import '../widgets/company_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        if (favoritesController.favoriteCompanies.isEmpty) {
          return const Center(child: Text('No favorite companies yet.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: favoritesController.favoriteCompanies.length,
          itemBuilder: (context, index) {
            final company = favoritesController.favoriteCompanies[index];
            return CompanyCard(
              companyName: company,
              isFavorite: true,
              onTap: () {},
              onFavoriteTap: () {
                favoritesController.toggleFavorite(company);
              },
            );
          },
        );
      }),
    );
  }
}
