import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/modules/1.on_boarding/onBoarding_screen.dart';
import '../shared/cubit/shop_cubit.dart';

class AppRoot extends StatelessWidget {

//final Widget startWidget;
//const AppRoot({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => ShopCubit()
                    ..getProfileData()
                    ..getProductData()
                    ..getCategoryData()
                    ..getSettingsData()
                    ..getFavoritesData()
                    ..getCartData()
              ),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    elevation: 100.0,
                    type: BottomNavigationBarType.fixed,
                  ),
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        systemNavigationBarColor: Colors.white,
                        statusBarColor: Colors.white),
                    elevation: 0.0,
                  ),
                ),
                home: OnBoardingScreen()),
          );
        }
        );
  }
}
