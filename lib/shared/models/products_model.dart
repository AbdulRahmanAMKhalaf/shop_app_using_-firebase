import 'package:shop_app/shared/cores/utils/images_asset.dart';

class ProductModel {
  final String name;
  final String image;
  final double price;
  final double weight;

  ProductModel(
      {required this.name,
      required this.weight,
      required this.image,
      required this.price});
}

List<ProductModel> productsList = [
  ProductModel(name: 'Apple', image: AppImages.apple, price: 1, weight: 1.3),
  ProductModel(
      name: 'Strawberry', image: AppImages.strawberry, price: 2, weight: 1),
  ProductModel(name: 'Carrot', image: AppImages.carrot, price: 2, weight: 1.3),
  ProductModel(name: 'Apple', image: AppImages.apple, price: 1, weight: 1.3),
  ProductModel(
      name: 'Strawberry', image: AppImages.strawberry, price: 2, weight: 1),
  ProductModel(name: 'Carrot', image: AppImages.carrot, price: 2, weight: 1.3),
];
