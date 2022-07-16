import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/my_mentor/components/body.dart';

class MyMentor extends StatelessWidget {
  const MyMentor({Key? key}) : super(key: key);
  static const String routeName = '/my-mentor';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('My Mentor'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
            body:  Body(),
            );
  }
}
