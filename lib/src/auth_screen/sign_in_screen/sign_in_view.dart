import 'package:flutter_animate/flutter_animate.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/auth_screen/sign_in_screen/sign_in_content.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';

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
                duration: 3.seconds,
                content: CustomText(
                  text: 'Login Successfully',
                  fontSize: 13,
                  color: AppColors.whiteColor,
                ),
                backgroundColor: Colors.green,
              ));
              navigateWithOutBack(
                  context: context, pageName: 'home', canBack: false,arguments: context.read<AuthBloc>().userCredential.user!.uid);
            }
          },
          child: SignInContent(),
        ),
      ),
    );
  }
}
