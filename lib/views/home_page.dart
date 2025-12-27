import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favorite_controller.dart';
import '../widgets/company_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<String> companies = const [
    'Google', 'Apple', 'Microsoft', 'Amazon', 'Meta',
    'Netflix', 'Tesla', 'IBM', 'Intel', 'Adobe',
  ];

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Company Directory')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return Obx(() => CompanyCard(
            companyName: company,
            isFavorite: favoritesController.isFavorite(company),
            onFavoriteTap: () {
              favoritesController.toggleFavorite(company);
            },
            onTap: () {

              },
          ));
        },
      ),
    );
  }
}
