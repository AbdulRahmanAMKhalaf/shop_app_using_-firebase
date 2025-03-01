import 'package:flutter/material.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/my_app.dart';
import 'package:shop_app/shared/cores/utils/constant/cache_helper.dart' show CacheHelper;
import 'package:shop_app/shared/cores/utils/constant/parallel_tool.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
