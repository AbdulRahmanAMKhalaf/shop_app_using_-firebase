import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:shop_app/shared/presentation/sign_up_screen/sign_up_content.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccessfully) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: CustomText(
                  text: 'Register Successfully',
                  fontSize: 13,
                  color: AppColors.whiteColor,

                ),backgroundColor: Colors.green,));
            }
          },
          child: SignUpContent(),
        ),
      ),
    );
  }
}
