import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/interest_setting/components/body.dart';

import 'screen_argument.dart';

class InterestSetting extends StatelessWidget {
  static String routeName = '/interest-setting';
  // bool? isInSetting = false;
  const InterestSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArgument;
    
    return Scaffold(
      appBar: AppBar(
          leading: args.isInSetting? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ):Container(),
          title: args.isInSetting
              ? const Text('My Interest')
              : const Text('Choose Your Interst')),
      body: Body(isInSetting: false),
    );
  }
}
