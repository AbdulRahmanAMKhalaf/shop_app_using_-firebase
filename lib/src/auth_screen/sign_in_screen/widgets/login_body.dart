import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/auth_screen/sign_in_screen/widgets/forget_password_button.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationBloc bloc = context.read();
    LocalizationBloc blocListener = context.watch();
    AuthBloc authBloc = context.read();
    AuthBloc authBlocListener = context.watch();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 100.w,
        height: 60.h,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.px),
            color: Colors.white.withValues(alpha: 0.96)),
        child: Form(
          key: authBloc.formKey,
          child: ListView(
            padding: EdgeInsets.all(3.w),
            children: [
              Row(
                textBaseline: TextBaseline.alphabetic,
                children: [
                  CustomText(
                    text: AppLocalizations.of(context)!.signIn,
                    color: AppColors.mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      bloc.add(ChangeLanguageEvent());
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.px),
                          border: Border.all(
                              width: 2.px, color: AppColors.mainColor)),
                      child: Row(
                        spacing: 3.w,
                        children: [
                          CustomText(
                            text: blocListener.lang == 'ar'
                                ? 'English'
                                : 'عربي',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          Icon(
                            Icons.language,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpacing(
                height: 4,
              ),
              CustomTextFormField(
                textInputAction: TextInputAction.next,
                labelText: AppLocalizations.of(context)!.email,
                controller: authBloc.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required Field';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                note: 'abood123@outlook.com',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.mainColor,
                  size: 25.px,
                ),
              ),
              VerticalSpacing(
                height: 2,
              ),
              CustomTextFormField(
                labelText: AppLocalizations.of(context)!.password,
                controller: authBloc.passwordController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required Field';
                  } else {
                    return null;
                  }
                },
                note: 'Contains:- Cap letters Small - letters - Numbers',
                prefixIcon: Icon(
                  Icons.vpn_key_sharp,
                  color: AppColors.mainColor,
                  size: 25.px,
                ),
                obscureText: authBlocListener.showPassword,
                suffixIcon: IconButton(
                    onPressed: () {
                      authBloc.add(ShowPasswordEvent());
                    },
                    icon: authBlocListener.showPassword
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                            size: 25.px,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.grey,
                            size: 25.px,
                          )),
              ),
              VerticalSpacing(
                height: 0.3,
              ),
              ForgetPasswordButton(),
              VerticalSpacing(
                height: 3,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  onPressed: () {
                    if (authBloc.formKey.currentState!.validate()) {
                      authBloc.add(LoginEvent());
                    }
                  },
                  shadowColor: AppColors.mainColor,
                  color: AppColors.mainColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 1.5.h),
                  textSize: 20,
                  elevation: 3.px,
                  borderRadius: 15.px,
                  isText: true,
                  text: AppLocalizations.of(context)!.signIn,
                ),
              ),
              VerticalSpacing(
                height: 3,
              ),
             /* Row(
                children: [
                  Flexible(
                      child: Container(
                    width: double.infinity,
                    height: 1.px,
                    color: AppColors.mainColor,
                    margin: EdgeInsets.only(right: 3.w),
                  )),
                  CustomText(
                    text: 'or login with',
                    fontSize: 15,
                    color: AppColors.noteColor,
                  ),
                  Flexible(
                      child: Container(
                    width: double.infinity,
                    height: 1.px,
                    color: AppColors.mainColor,
                    margin: EdgeInsets.only(left: 3.w),
                  )),
                ],
              ),
              VerticalSpacing(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.mainColor,
                        content: CustomText(
                          text: 'Coming Soon !',
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.px),
                        border:
                            Border.all(color: AppColors.mainColor, width: 2.px),
                      ),
                      child: CustomImage(
                        height: 20.px,
                        width: 20.px,
                        assetPath: AppImages.google,
                        isNetworkImage: false,
                      ),
                    ),
                  ),
                  HorizontalSpacing(width: 15),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.mainColor,
                        content: CustomText(
                          text: 'Coming Soon !',
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.px),
                        border:
                            Border.all(color: AppColors.mainColor, width: 2.px),
                      ),
                      child: CustomImage(
                        height: 22.px,
                        width: 22.px,
                        assetPath: AppImages.faceBook,
                        isNetworkImage: false,
                      ),
                    ),
                  ),
                ],
              ),*/
              Divider(color: AppColors.mainColor,height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 1.w,
                children: [
                  CustomText(
                    text: AppLocalizations.of(context)!.dontHave,
                    fontSize: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        navigateTo(context: context, pageName: 'register');
                      },
                      child: CustomText(
                        text: AppLocalizations.of(context)!.signUpNow,
                        fontSize: 16,
                        color: AppColors.mainColor,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
