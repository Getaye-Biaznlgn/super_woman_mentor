import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/mentor_request/components/body.dart';

class MentorRequest extends StatelessWidget {
  const MentorRequest({Key? key}) : super(key: key);
  static const String routeName = '/mentor-request';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Request'),
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
