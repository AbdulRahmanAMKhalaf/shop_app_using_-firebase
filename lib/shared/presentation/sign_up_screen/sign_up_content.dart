import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/sign_up_screen/widgets/register_body.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(
          width: 100.w,
          height: 100.h,
          fit: BoxFit.cover,
          isNetworkImage: false,
          assetPath: AppImages.loginBackground,
        ),
        RegisterBody(),
      ],
    );
  }
}
