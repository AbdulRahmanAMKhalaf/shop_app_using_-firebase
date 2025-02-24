import 'package:shop_app/shared/cores/utils/parallel_tool.dart';

class BoardingModel {
  final String text;
  final String image;

  BoardingModel({required this.text, required this.image});
}
List<BoardingModel>boardingList=[
  BoardingModel(text: 'From A to Z, we’ve got it all\nDiscover endless possibilities with us!', image: ImagesAsset.buying),
  BoardingModel(text: 'Your security is our priority.\nexperience worry-free transactions today!', image: ImagesAsset.secure),
  BoardingModel(text: 'No limits, no boundaries\nWe’ve got you covered around the clock\nand across the globe!', image: ImagesAsset.service),
];
