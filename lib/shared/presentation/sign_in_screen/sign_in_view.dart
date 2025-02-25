import 'package:flutter/material.dart';
import 'package:shop_app/shared/presentation/sign_in_screen/sign_in_content.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInContent(),
    );
  }
}
