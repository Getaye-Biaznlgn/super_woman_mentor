import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/login/components/sign_in_form.dart';
import 'package:super_woman_user/ui/screens/sign_up/sign_up.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final  height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const SizedBox(
              height: kDefaultPadding,
            ),
            const SignInForm(),
            Row(
              children: [
                const Text('Don\'t have an account?'),
                const SizedBox(
                  width: kDefaultPadding * 0.5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SignUp.routeName);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
