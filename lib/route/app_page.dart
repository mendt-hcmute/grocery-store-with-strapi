import 'package:my_grocery_again/view/dashboard/dashboard_binding.dart';
import 'package:my_grocery_again/view/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';
import 'app_route.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    )
  ];
}