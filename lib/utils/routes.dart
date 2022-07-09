import 'package:flutter/widgets.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/ui/screens/login/login.dart';
import 'package:super_woman_user/ui/screens/sign_up/sign_up.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  Login.routeName :(context) => const Login(),
  SignUp.routeName: (context) => const SignUp()
};