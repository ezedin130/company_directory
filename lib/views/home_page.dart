import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/company_controller.dart';
import '../controller/favorite_controller.dart';
import '../widgets/company_card.dart';
import 'company_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyController companyController = Get.put(CompanyController());
    final FavoritesController favoritesController = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(title: const Text('Company Directory')),
      body: Obx(() {
        if (companyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (companyController.errorMessage.isNotEmpty) {
          return Center(child: Text(companyController.errorMessage.value));
        }

        final companies = companyController.companies;
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: companies.length,
          itemBuilder: (context, index) {
            final company = companies[index];

            return Obx(() => CompanyCard(
              companyName: company.name,
              isFavorite: favoritesController.isFavorite(company.name),
              onTap: () {
                Get.to(() => CompanyDetailPage(company: company));
              },
              onFavoriteTap: () {
                favoritesController.toggleFavorite(company.name);
              },
            ));
          },
        );
      }),
    );
  }
}
