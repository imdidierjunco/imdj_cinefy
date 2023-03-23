import 'package:flutter/material.dart';

import '../display/home/screens/home.dart';
import '../display/sign_in/screens/sign_in.dart';
import '../display/splash/screens/splash.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoute {
  return {
    Routes.splash: (context) => const SplashScreen(),
    Routes.signIn: (context) => const SignInScreen(),
    Routes.home: (context) => const HomeScreen(),
  };
}
