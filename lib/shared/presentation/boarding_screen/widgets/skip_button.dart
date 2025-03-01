import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/constant/parallel_tool.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: CustomButton(
          onPressed: () {
            navigateTo(context: context, pageName: 'login');
          },
          color: Colors.black,
          textSize: 14,
          textColor: AppColors.mainColor,
          borderRadius: 10.w,
          text: 'SKIP',
          padding: EdgeInsets.symmetric(horizontal: 7.w,),
          elevation: 3.px,
        ));
  }
}
