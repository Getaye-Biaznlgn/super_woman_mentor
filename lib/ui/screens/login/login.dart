import 'package:flutter/material.dart';
import 'components/body.dart';

class Login extends StatelessWidget {
  static String routeName = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset :false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome to Super Woman',
        ),
      ),
      body: Body(),
    );
  }
}

