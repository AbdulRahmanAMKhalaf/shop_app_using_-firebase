import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/localization/localization_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationBloc bloc = context.read();
    LocalizationBloc blocListener = context.watch();
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 100.w,
        height: 87.h,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.px),
            color: Colors.white.withValues(alpha: 0.96)),
        child: ListView(
          padding: EdgeInsets.all(3.w),
          children: [
            Row(
              textBaseline: TextBaseline.alphabetic,
              children: [
                CustomText(
                  text: 'Sign Up',
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
                          text: blocListener.lang == 'ar' ? 'English' : 'Arabic',
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
            VerticalSpacing(height: 4,),
            CustomTextFormField(
              labelText: 'Username',
              keyboardType: TextInputType.emailAddress,
              note: 'AbdulRahman Ayman',
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.mainColor,
                size: 25.px,
              ),
            ),
            VerticalSpacing(height: 3,),
            CustomTextFormField(
              labelText: 'Phone Number',
              keyboardType: TextInputType.emailAddress,
              note: '+962770130018',
              prefixIcon: Icon(
                Icons.phone,
                color: AppColors.mainColor,
                size: 25.px,
              ),
            ),
            VerticalSpacing(height: 3,),
            CustomTextFormField(
              labelText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              note: 'abood123@outlook.com',
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.mainColor,
                size: 25.px,
              ),
            ),
            VerticalSpacing(height: 3,),
            CustomTextFormField(
              labelText: 'Password',
              keyboardType: TextInputType.text,
              note: 'Contains:- Cap letters Small - letters - Numbers',
              prefixIcon: Icon(
                Icons.vpn_key_sharp,
                color: AppColors.mainColor,
                size: 25.px,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                    size: 25.px,
                  )),
            ),
            VerticalSpacing(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: 'I accept all terms and conditions',
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  focusColor: Colors.black,
                  activeColor: AppColors.mainColor,
                )
              ],
            ),
            VerticalSpacing(height: 4,),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                onPressed: () {},
                shadowColor: AppColors.mainColor,
                color: Colors.deepOrange,
                padding:
                EdgeInsets.symmetric(horizontal: 22.w, vertical: 1.5.h),
                textSize: 20,
                elevation: 3.px,
                borderRadius: 15.px,
                text: 'Sign Up',
              ),
            ),
            Divider(
              thickness: 1,
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    border:
                    Border.all(color: AppColors.mainColor, width: 2.px),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      CustomImage(
                        height: 20.px,
                        width: 20.px,
                        assetPath: AppImages.google,
                        isNetworkImage: false,
                      ),
                      CustomText(
                        text: 'Google',
                        color: AppColors.mainColor,
                        fontSize: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    border:
                    Border.all(color: AppColors.mainColor, width: 2.px),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      CustomImage(
                        height: 20.px,
                        width: 20.px,
                        assetPath: AppImages.faceBook,
                        isNetworkImage: false,
                      ),
                      CustomText(
                        text: 'FaceBook',
                        color: AppColors.mainColor,
                        fontSize: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              height: 5.h,
            ),
            VerticalSpacing(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2.w,
              children: [
                CustomText(
                  text: 'Have an account?',
                  fontSize: 15,
                ),
                TextButton(
                    onPressed: () {
                      navigateWithOutBack(
                          context: context,
                          pageName: 'login',
                          canBack: true);
                    },
                    child: Hero(
                      tag: 'register1',
                      child: CustomText(
                        text: 'SignIn Now !',
                        fontSize: 16,
                        color: AppColors.mainColor,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
