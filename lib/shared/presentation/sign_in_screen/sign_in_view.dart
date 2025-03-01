import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/constant/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:shop_app/shared/presentation/sign_in_screen/sign_in_content.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessfully) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: CustomText(
                text: 'Login Successfully',
                fontSize: 13,
                color: AppColors.whiteColor,

              ),backgroundColor: Colors.green,));
            }
          },
          child: SignInContent(),
        ),
      ),
    );
  }
}
