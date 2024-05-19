import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/bloc_observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/src/src.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token = CacheHelper.getData(key: 'token');
  print(onBoarding);
  print(token);
  // Widget widget;
  // if (onBoarding != Null) {
  //   if (token != Null) {
  //     widget = ShopHomeLayout();
  //   } else {
  //     widget = ShopLoginScreen();
  //   }
  // } else {
  //   widget = OnBoardingScreen();
  // }
  runApp(AppRoot(
      //startWidget: widget,
      ));
}
