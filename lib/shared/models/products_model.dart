import 'package:shop_app/shared/cores/utils/images_asset.dart';

class ProductModel {
  final String name;
  final String image;
  final double price;
  final double? weight;

  ProductModel(
      {required this.name,
      this.weight,
      required this.image,
      required this.price});
}

List<ProductModel> groceriesList = [
  ProductModel(name: 'Apple', image: AppImages.apple, price: 1, weight: 1),
  ProductModel(name: 'Carrot', image: AppImages.carrot, price: 2, weight: 1),
  ProductModel(
      name: 'Strawberry', image: AppImages.strawberry, price: 2.5, weight: 1),
];

List<ProductModel> electronicsList = [
  ProductModel(
    name: 'Laptop',
    image: AppImages.laptop,
    price: 500,
  ),
  ProductModel(
    name: 'Smart phone',
    image: AppImages.phone,
    price: 150,
  ),
];

List<ProductModel> clothesList = [
  ProductModel(
    name: 'T-shirts',
    image: AppImages.tShirts,
    price: 10,
  ),
  ProductModel(
    name: 'Jeans Pants',
    image: AppImages.jeans,
    price: 8,
  ),
];
