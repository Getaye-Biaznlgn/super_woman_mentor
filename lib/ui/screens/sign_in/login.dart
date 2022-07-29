import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth.dart';
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

