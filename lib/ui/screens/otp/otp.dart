import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/otp/components/body.dart';

class Otp extends StatelessWidget {
  static String routeName = '/otp';
  final String? phoneNo;
  const Otp({this.phoneNo, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Confirm your number'),
      ),
      body: Body(phoneNo: phoneNo,),
    );
  }
}
