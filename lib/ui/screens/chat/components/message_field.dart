import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/controller/message_controller.dart';

import '../../../../providers/auth.dart';

class MessageField extends StatelessWidget {
  MessageField({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;
  TextEditingController fieldController = TextEditingController();
  _submitForm(token) async {
    if (fieldController.text == "") return;
    MessageController messageController = MessageController();
    try {
      await messageController.sendMessage(fieldController.text, token);
      fieldController.text = "";
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Card(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.transparent : const Color(0xFFF7F7F7),
        ),
        child: TextField(
          controller: fieldController,
          maxLines: null,
          decoration: InputDecoration(
              hintText: 'Write a message...',
              suffixIcon: IconButton(
                  onPressed: () {
                    _submitForm(auth.token);
                  },
                  icon: const Icon(
                    Icons.send,
                    // color: kPrimaryColor,
                    size: 32,
                  ))),
        ),
      ),
    );
  }
}
