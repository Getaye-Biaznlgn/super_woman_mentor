import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/sign_up/components/sign_up_form.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SignUpForm(),
      ),
    );
  }
}
