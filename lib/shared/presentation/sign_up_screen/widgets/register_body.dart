import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/constant/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:shop_app/shared/presentation/bloc/localization/localization_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
        height: 85.h,
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
                            text: blocListener.lang == 'ar'
                                ? 'English'
                                : 'Arabic',
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
                labelText: 'Username',
                keyboardType: TextInputType.emailAddress,
                controller: authBloc.nameController,
                hintText: 'AbdulRahman Ayman',
                note: 'Contains:- Letters-Numbers-Characters',
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required Field';
                  }else{
                    return null;
                  }
                },
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.mainColor,
                  size: 25.px,
                ),
              ),
              VerticalSpacing(
                height: 2,
              ),
              CustomTextFormField(
                labelText: 'Phone Number',
                controller: authBloc.phoneNumberController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required Field';
                  }else{
                    return null;
                  }
                },
                hintText: '+962 770130018',
                note: 'Contains:- country key - 9 numbers',
                prefixIcon: Icon(
                  Icons.phone,
                  color: AppColors.mainColor,
                  size: 25.px,
                ),
              ),
              VerticalSpacing(
                height: 2,
              ),
              CustomTextFormField(
                labelText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                hintText: 'abood123@outlook.com',
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required Field';
                  }else{
                    return null;
                  }
                },
                controller: authBloc.emailController,
                note: 'Contains:- @',
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
                labelText: 'Password',
                obscureText: authBlocListener.showPassword,
                keyboardType: TextInputType.text,
                controller: authBloc.passwordController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required Field';
                  }else{
                    return null;
                  }
                },
                note:
                    'Contains:- Cap letters-Small letters-Numbers-8 characters',
                prefixIcon: Icon(
                  Icons.vpn_key_sharp,
                  color: AppColors.mainColor,
                  size: 25.px,
                ),
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
                height: 1,
              ),
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
                    value: authBlocListener.checkTerms,
                    onChanged: (value) {
                      authBloc.add(CheckTermsEvent());
                    },
                    focusColor: Colors.black,
                    activeColor: AppColors.mainColor,
                  )
                ],
              ),
              VerticalSpacing(
                height: 4,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  onPressed: () {
                    if (authBloc.formKey.currentState!.validate() &&
                        authBlocListener.checkTerms == true) {
                      authBloc.add(RegisterEvent());
                    }
                  },
                  shadowColor: authBlocListener.checkTerms == true
                      ? AppColors.mainColor
                      : Colors.transparent,
                  color: authBlocListener.checkTerms == true
                      ? AppColors.mainColor
                      : AppColors.noteColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 1.5.h),
                  textSize: 20,
                  elevation: 3.px,
                  borderRadius: 15.px,
                  text: authBlocListener.checkTerms == true
                      ? 'Sign Up'
                      : 'Check Terms Please',
                ),
              ),
              VerticalSpacing(
                height: 3,
              ),
              Row(
                children: [
                  Flexible(
                      child: Container(
                        width: double.infinity,
                        height: 1.px,
                        color: AppColors.mainColor,
                        margin: EdgeInsets.only(right: 3.w),
                      )),
                  CustomText(
                    text: 'or register with',
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
              ),
              Divider(color: AppColors.mainColor,height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 1.w,
                children: [
                  CustomText(
                    text: 'Have an account?',
                    fontSize: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        navigateWithOutBack(
                            context: context, pageName: 'login', canBack: true);
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
      ),
    );
  }
}
