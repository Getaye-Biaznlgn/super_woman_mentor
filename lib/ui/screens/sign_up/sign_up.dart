import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/sign_up/components/body.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/sign-up';
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset : false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fill your info'),
        ),
        body: const Body());
  }
}
