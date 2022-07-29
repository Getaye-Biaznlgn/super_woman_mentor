import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat-screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: const ListTile(
        leading: CircleAvatar(
          child: Text(
            // name.substring(0, 1).toUpperCase(),
            'E',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
          backgroundColor: kPrimaryColor,
        ),
        title: Text('Eden Getachew'),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
