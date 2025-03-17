import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/auth_screen/sign_up_screen/sign_up_content.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';

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
              navigateTo(context: context, pageName: 'login');
            }else if(state is RegisterFail){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: CustomText(
                  text: state.message,
                  fontSize: 13,
                  color: AppColors.whiteColor,

                ),backgroundColor: Colors.red,));
            }
          },
          child: SignUpContent(),
        ),
      ),
    );
  }
}
