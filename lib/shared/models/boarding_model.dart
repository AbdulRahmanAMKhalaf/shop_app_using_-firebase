import 'package:shop_app/shared/cores/utils/parallel_tool.dart';

class BoardingModel {
  final String text;
  final String image;

  BoardingModel({required this.text, required this.image});
}
List<BoardingModel>englishBoardingList=[
  BoardingModel(text: 'From A to Z, we’ve got it all\nDiscover endless possibilities with us!', image: AppImages.buying),
  BoardingModel(text: 'Your security is our priority.\nexperience worry-free transactions today!', image: AppImages.secure),
  BoardingModel(text: 'No limits, no boundaries\nWe’ve got you covered around the clock\nand across the globe!', image: AppImages.service),
];
List<BoardingModel>arabicBoardingList=[
  BoardingModel(text: 'من الألف إلى الياء، لدينا كل شيء اكتشف إمكانيات لا نهاية لها معنا!', image: AppImages.buying),
  BoardingModel(text: 'أمنك هو أولويتنا. استمتع بمعاملات خالية من القلق اليوم!', image: AppImages.secure),
  BoardingModel(text: 'لا حدود، لا قيود. نحن نغطيك على مدار الساعة وفي جميع أنحاء العالم!', image: AppImages.service),
];