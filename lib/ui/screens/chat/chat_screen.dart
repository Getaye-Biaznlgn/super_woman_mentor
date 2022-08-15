import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/auth.dart';

import '../../../utils/constants.dart';
import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat-screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<MessageController>(context).bindAbly();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return AppBar(
      titleSpacing: 0,
      title: ListTile(
        leading: CircleAvatar(
          child:  Text(
            auth.firstName.toString().substring(0,1),
            style: const TextStyle(
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
