
import 'package:flutter/widgets.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/ui/screens/home/role_model_content/role_model_content.dart';
import 'package:super_woman_user/ui/screens/interest_setting/interest_setting.dart';
import 'package:super_woman_user/ui/screens/login/login.dart';
import 'package:super_woman_user/ui/screens/otp/otp.dart';
import 'package:super_woman_user/ui/screens/sign_up/sign_up.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  Login.routeName :(context) => const Login(),
  SignUp.routeName: (context) => const SignUp(),
  Otp.routeName:(context) => const Otp(),
  RoleModelContent.routeName :(context)=> const RoleModelContent(),
  InterestSetting.routeName: (context) => const InterestSetting()
};