import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';
import 'edit_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: EditProfileForm(),
      ),
    );
  }
}