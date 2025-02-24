import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: CustomButton(
          onPressed: () {},
          color: Colors.black,
          textSize: 14,
          textColor: Colors.orange,
          borderRadius: 10.w,
          text: 'SKIP',
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          elevation: 3.px,
        ));
  }
}
