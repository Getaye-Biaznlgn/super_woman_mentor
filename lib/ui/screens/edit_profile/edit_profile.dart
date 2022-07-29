import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/edit_profile/components/body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  static const String routeName = '/edit-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Edit Profile'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
            ),
            body: const  Body(),
            );
  }
}
