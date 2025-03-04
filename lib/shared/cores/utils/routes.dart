import 'package:flutter/material.dart';
import 'package:shop_app/shared/presentation/boarding_screen/boarding_view.dart';
import 'package:shop_app/shared/presentation/sign_in_screen/sign_in_view.dart';
import 'package:shop_app/shared/presentation/sign_up_screen/sign_up_view.dart';
import 'package:shop_app/src/home_screen/home_view.dart';

Map<String, WidgetBuilder> myRoutes = {
  'boarding': (context) => BoardingView(),
  'login': (context) => SignInView(),
  'register': (context) => SignUpView(),
  'home': (context) => HomeView(),
  /*'details': (context) => DetailsView()*/
};

void navigateTo({required BuildContext context, required String pageName}) {
  Navigator.pushNamed(
    context,
    pageName,
  );
}

void navigateWithOutBack({required BuildContext context,
  required String pageName,
  Object? arguments,
  required bool canBack}) {
  Navigator.pushNamedAndRemoveUntil(
    context, arguments: arguments,
    pageName,
        (route) => canBack,
  );
}

void navigateBack({required BuildContext context}) {
  Navigator.pop(context);
}
