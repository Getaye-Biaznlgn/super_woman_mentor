import 'package:flutter/material.dart';
import 'components/body.dart';

class MentorScreen extends StatelessWidget {
  static const String routeName = '/mentor';
  const MentorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentors'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  Body(),
    );
  }
}
