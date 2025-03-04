import 'package:shop_app/shared/cores/utils/images_asset.dart';

class CategoriesModel {
  final String name;
  final String image;

  CategoriesModel({required this.name, required this.image});
}

List<CategoriesModel> categoriesList = [
  CategoriesModel(name: 'Groceries', image: AppImages.groceryImage),
  CategoriesModel(name: 'Electronics', image: AppImages.electronicsImage),
  CategoriesModel(name: 'Clothes', image: AppImages.clothesImage),
  CategoriesModel(name: 'CleaningTools', image: AppImages.cleaningImage),
];
