import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketly/ui/auth/login_screen/login_screen.dart';
import 'package:marketly/ui/auth/register_screen/register_screen.dart';
import 'package:marketly/ui/home/cart/cart_screen.dart';
import 'package:marketly/ui/home/home_screen/home_screen_view.dart';
import 'package:marketly/ui/home/product_details/product_details_view.dart';
import 'package:marketly/ui/splash/splash_screen.dart';
import 'package:marketly/ui/utils/my_theme.dart';
import 'package:marketly/ui/utils/shared_pre.dart';

import 'firebase_options.dart';
import 'my_bloc_abserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPre.init();
  String route;
  var user = SharedPre.getDate(key: "Token");
  if (user == null) {
    route = SplashScreen.routeName;
  } else {
    route = HomeScreenView.routeName;
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(route: route));
}

class MyApp extends StatelessWidget {
  final String route;

  MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreenView.routeName: (context) => HomeScreenView(),
          ProductDetailsView.routeName: (context) => ProductDetailsView(),
          CartScreen.routeName: (context) => CartScreen()
        },
        theme: MyTheme.mainTheme,
      ),
    );
  }
}
