import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/sign_in_screen/widgets/login_body.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({super.key});

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
        LoginBody()
      ],
    );
  }
}
