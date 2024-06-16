import "package:get/get.dart";
import "package:my_grocery_again/controller/category_controller.dart";
import "package:my_grocery_again/controller/dashboard_controller.dart";
import "package:my_grocery_again/controller/home_controller.dart";
import "package:my_grocery_again/controller/product_controller.dart";

class DashboardBinding extends Bindings {
  @override

  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
  }
}