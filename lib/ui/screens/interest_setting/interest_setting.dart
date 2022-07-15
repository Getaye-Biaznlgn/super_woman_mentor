import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/interest_setting/components/body.dart';

class InterestSetting extends StatelessWidget {
  static String routeName = '/interest-setting';
  const InterestSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Interst')),
      body: Body(),
    );
  }
}
