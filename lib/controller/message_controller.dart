import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import '../models/message.dart';
import '../services/api_base_helper.dart';

class MessageController with ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  final clientOptions = ably.ClientOptions(
      key: 'mwUvoA.QGPkKw:y7i6p7k948CC0nUVurkXNP8OdrKu3qBgFlRPHpGhzg8');

// Use ClientOptions to create Realtime or REST instance

  String? _message;
  List<Message> messages = [];

  bindAbly(id) {
    ably.Realtime realtime = ably.Realtime(options: clientOptions);
    realtime.connection
        .on()
        .listen((ably.ConnectionStateChange stateChange) async {
      ably.RealtimeChannel channel =
          realtime.channels.get('private:get_mentor_message.$id');
     
      channel.subscribe(name: 'newMessage').listen((ably.Message message) {
       
        final data = jsonEncode(message.data);
        final response = jsonDecode(data)['message'] as Map<String, dynamic>;
        messages.insert(
            0,
            Message(
                id: response['id'].toInt(),
                userId: response['user_id'].toInt(),
                mentorId: response['mentor_id'].toInt(),
                message: response['message'],
                sender: response['sender'],
                seen: response['seen'].toInt(),
                createdAt: DateTime.parse(response['created_at'])));

        notifyListeners();
      });
    });
  }

  Future fetchMessages(token) async {
    List<Message> messageList = [];
    final response = await apiBaseHelper.get(
        url: '/user/messages?per_page=10', token: token);

    List messageResponse = response['data'] as List;
    for (int i = 0; i < messageResponse.length; i++) {
      Map<String, dynamic> map = messageResponse[i];
      messageList.add(Message.fromJson(map));
    }
    messages = messageList;
    notifyListeners();
  }

  Future sendMessage(message, token) async {
    var res = await apiBaseHelper.post(
        url: '/user/send_message', payload: {'message': message}, token: token);

    messages.insert(0, Message.fromJson(res));
    notifyListeners();
  }
}
