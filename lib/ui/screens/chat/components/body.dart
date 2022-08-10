import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/controller/message_controller.dart';
import 'package:super_woman_user/models/message.dart';
import 'package:super_woman_user/providers/auth.dart';
import 'package:super_woman_user/providers/themes.dart';
import 'package:super_woman_user/ui/screens/chat/components/chat_message.dart';
import 'package:super_woman_user/ui/screens/chat/components/message_field.dart';
import 'package:super_woman_user/utils/constants.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  fetchMessages() async {
    try {
      _isLoading = true;
      final auth = Provider.of<Auth>(context);
      final messageController = Provider.of<MessageController>(context);
      messageController.bindEvent('get_mentor_message.78');
      await messageController.fetchMessages(auth.token);
    } catch (e) {
    } finally {
      _isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeNotifier>(context).isDark;
    final auth = Provider.of<Auth>(context);
    List<Message> messageList =
        Provider.of<MessageController>(context).messages;
    return Column(children: [
      Expanded(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) => ChatMessage(
                        message: messageList[index].message,
                        isMe: messageList[index].sender == 'user',
                        time:
                            '${messageList[index].createdAt.hour}:${messageList[index].createdAt.minute}'),
                  )
            // FutureBuilder(
            //     future: messageController.fetchMessages(auth.token),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         if (snapshot.hasError) {
            //           const Center(
            //             child: Text('Faild to load data'),
            //           );
            //         } else if (snapshot.hasData) {
            //           List<Message> messageList = snapshot.data as List<Message>;
            //           return ListView.builder(
            //             reverse: true,
            //             itemCount: messageList.length,
            //             itemBuilder: (context, index) => ChatMessage(
            //                 message: messageList[index].message,
            //                 isMe: messageList[index].sender == 'user',
            //                 time:
            //                     '${messageList[index].createdAt.hour}:${messageList[index].createdAt.minute}'),
            //           );
            //         }
            //       }
            //       return const Center(child: CircularProgressIndicator());
            //     }),
            ),
      ),
      MessageField(isDark: isDark)
    ]);
  }
}
