import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/providers/themes.dart';
import 'package:super_woman_user/ui/screens/chat/components/chat_message.dart';
import 'package:super_woman_user/ui/screens/chat/components/message_field.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeNotifier>(context).isDark;
    return Column(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: ListView(
            reverse: true,
            children: const [
              ChatMessage(
                  message: 'Hey Eden, Thank you for'
                      'acceping my mentor request'
                      ' for helping me on my design'
                      ' career',
                  isMe: true,
                  time: '4:44'),
              ChatMessage(
                  message: 'Hey Eden, Thank you for'
                      'acceping my mentor request'
                      ' for helping me on my design'
                      ' career',
                  isMe: false,
                  time: '4:44'),
              ChatMessage(
                  message: 'Hey Eden, Thank you for'
                      'acceping my mentor request',
                  isMe: true,
                  time: '4:44'),
              ChatMessage(
                  message: 'Hey Eden, Thank you for', isMe: true, time: '4:44')
            ],
          ),
        ),
      ),
      MessageField(isDark: isDark)
    ]);
  }
}


