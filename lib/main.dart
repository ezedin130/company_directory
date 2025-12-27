import 'package:company_directory/utils/app_shared_preferences.dart';
import 'package:company_directory/widgets/navigation_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/favorite_controller.dart';
import 'controller/navigation_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final controller = Get.put(FavoritesController());
  await controller.loadFavorites();

  await AppSharedPreferences.init();
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Company Directory',
      home: const NavigationWrapper(),
    );
  }
}
