import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery_again/model/ad_banner.dart';
import 'package:my_grocery_again/model/category.dart';
import 'package:my_grocery_again/model/product.dart';
import 'package:my_grocery_again/route/app_page.dart';
import 'package:my_grocery_again/route/app_route.dart';
import 'package:my_grocery_again/theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //register adapter
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,

    );
  }
}
