import 'package:get/get.dart';
import 'package:my_grocery_again/model/category.dart';
import 'package:my_grocery_again/service/local_service/local_category_service.dart';
import 'package:my_grocery_again/service/remove_service/remote_category_service.dart';

class CategoryController extends GetxController{
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    await _localCategoryService.init();
    getCategories();
    super.onInit();
  }
  void getCategories() async {
    try {
      isCategoryLoading(true);
      if(_localCategoryService.getCategories().isNotEmpty){
        categoryList.assignAll(_localCategoryService.getCategories());
      }
      var result = await RemoteCategoryService().get();
      if(result != null){
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategoryService.assignAllPopularCategories(
            popularCategories: categoryListFromJson(result.body));
      }
    }
    finally{
      isCategoryLoading(false);
    }
  }
}