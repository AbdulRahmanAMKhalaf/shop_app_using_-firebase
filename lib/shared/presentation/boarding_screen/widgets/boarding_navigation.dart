import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/boarding_model.dart';

class BoardingNavigation extends StatelessWidget {
  const BoardingNavigation({super.key,required this.controller});

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 5.w,
      children: [
        CustomButton(
          onPressed: () {
            controller.previousPage(
                duration: 1200.ms, curve: Curves.easeInOut);
          },
          borderRadius: 10.w,
          color: Colors.black,
          textSize: 14,
          elevation: 3.px,
          text: 'Back',
        ),
        SmoothPageIndicator(
          controller: controller,
          count: boardingList.length,
          axisDirection: Axis.horizontal,
          effect: ScrollingDotsEffect(
            spacing: 12.px,
            radius: 10.px,
            dotWidth: 10.px,
            dotHeight: 10.px,
            dotColor: Colors.grey.shade300,
            activeDotColor: Colors.deepOrange,
          ),
        ),
        CustomButton(
          onPressed: () {
            controller.nextPage(
                duration: 1200.ms, curve: Curves.easeInOut);
          },
          borderRadius: 10.w,
          color: Colors.black,
          textSize: 14,
          elevation: 3.px,
          text: 'Next',
        )
      ],
    );
  }
}
