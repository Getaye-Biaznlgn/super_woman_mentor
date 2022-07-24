import 'package:flutter/material.dart';
import 'components/body.dart';

class RoleModelDetail extends StatelessWidget {
  const RoleModelDetail({Key? key}) : super(key: key);
  static const String routeName = '/role-model-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Role Model'),
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
