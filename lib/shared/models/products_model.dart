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

List<ProductModel> englishGroceriesList = [
  ProductModel(name: 'Apple', image: AppImages.apple, price: 1, weight: 1),
  ProductModel(name: 'Carrot', image: AppImages.carrot, price: 2, weight: 1),
  ProductModel(
      name: 'Strawberry', image: AppImages.strawberry, price: 2.5, weight: 1),
];
List<ProductModel> arabicGroceriesList = [
  ProductModel(name: 'تفاح', image: AppImages.apple, price: 1, weight: 1),
  ProductModel(name: 'جزر', image: AppImages.carrot, price: 2, weight: 1),
  ProductModel(
      name: 'فراولة', image: AppImages.strawberry, price: 2.5, weight: 1),
];

List<ProductModel> englishElectronicsList = [
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
List<ProductModel> arabicElectronicsList = [
  ProductModel(
    name: 'لاب توب',
    image: AppImages.laptop,
    price: 500,
  ),
  ProductModel(
    name: 'هاتف ذكي',
    image: AppImages.phone,
    price: 150,
  ),
];

List<ProductModel> englishClothesList = [
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
List<ProductModel> arabicClothesList = [
  ProductModel(
    name: 'بلوزة',
    image: AppImages.tShirts,
    price: 10,
  ),
  ProductModel(
    name: 'بنطال جينز',
    image: AppImages.jeans,
    price: 8,
  ),
];
