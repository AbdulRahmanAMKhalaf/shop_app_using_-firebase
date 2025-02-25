import 'package:flutter/material.dart';
import 'package:shop_app/shared/presentation/boarding_screen/boarding_view.dart';
import 'package:shop_app/shared/presentation/sign_in_screen/sign_in_view.dart';
import 'package:shop_app/shared/presentation/sign_up_screen/sign_up_view.dart';

Map<String, WidgetBuilder> myRoutes = {
  'boarding': (context) => BoardingView(),
  'login': (context) => SignInView(),
  'register': (context) => SignUpView(),
};

void navigateTo({required BuildContext context, required String pageName}) {
  Navigator.pushNamed(
    context,
    pageName,
  );
}

void navigateWithOutBack(
    {required BuildContext context,
    required String pageName,
    required bool canBack}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    pageName,
    (route) => canBack,
  );
}

void navigateBack({required BuildContext context}) {
  Navigator.pop(context);
}
