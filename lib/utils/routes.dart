
import 'package:flutter/widgets.dart';
import 'package:super_woman_user/ui/screens/edit_phone_no/edit_phone_no.dart';
import 'package:super_woman_user/ui/screens/edit_profile/edit_profile.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/ui/screens/home/role_model_content/role_model_content.dart';
import 'package:super_woman_user/ui/screens/interest_setting/interest_setting.dart';
import 'package:super_woman_user/ui/screens/login/login.dart';
import 'package:super_woman_user/ui/screens/otp/otp.dart';
import 'package:super_woman_user/ui/screens/sign_up/sign_up.dart';
import 'package:super_woman_user/ui/screens/my_mentor/my_mentor.dart';

import '../ui/screens/mentor_request/mentor_request.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  Login.routeName :(context) => const Login(),
  SignUp.routeName: (context) => const SignUp(),
  Otp.routeName:(context) => const Otp(),
  RoleModelContent.routeName :(context)=> const RoleModelContent(),
  InterestSetting.routeName: (context) =>  InterestSetting(),
  EditProfile.routeName : (context)=> const EditProfile(),
  EditPhoneNo.routeName :(context) => const EditPhoneNo(),
  MyMentor.routeName : (context) => const MyMentor(),
   MentorRequest.routeName : (context) => const MentorRequest()
};