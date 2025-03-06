import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/color/colors_asset.dart' show AppColors;
import 'package:shop_app/shared/cores/widgets/custom_text.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {},
          child: CustomText(
            text: 'Forget Password?',
            textDecoration: TextDecoration.underline,
            color: AppColors.mainColor,
            fontSize: 14,
          )),
    );
  }
}
