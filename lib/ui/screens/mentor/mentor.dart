import 'package:flutter/material.dart';
import 'components/body.dart';

class Mentor extends StatelessWidget {
  static const String routeName = '/mentor';
  const Mentor({Key? key}) : super(key: key);

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
      body: const Body(),
    );
  }
}
