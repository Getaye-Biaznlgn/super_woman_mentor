import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/screens/edit_phone_no/components/body.dart';

class EditPhoneNo extends StatelessWidget {
  const EditPhoneNo({Key? key}) : super(key: key);
  static const String routeName = '/edit-phone-no';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Phone Number'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
            body:  const Body(),
            );
  }
}
