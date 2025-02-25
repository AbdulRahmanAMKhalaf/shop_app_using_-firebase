import 'package:flutter/material.dart';
import 'package:shop_app/shared/presentation/sign_up_screen/sign_up_content.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpContent(),
    );
  }
}
