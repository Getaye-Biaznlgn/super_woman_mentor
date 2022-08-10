import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:ably_flutter/ably_flutter.dart' as ably;
import '../models/message.dart';
import '../services/api_base_helper.dart';

class MessageController with ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  // final clientOptions = ably.ClientOptions(
  //     key: 'mwUvoA.QGPkKw:y7i6p7k948CC0nUVurkXNP8OdrKu3qBgFlRPHpGhzg8');

// Use ClientOptions to create Realtime or REST instance

  bindAbly() {
    // ably.Realtime realtime = ably.Realtime(options: clientOptions);
    // realtime.connection
    //     .on()
    //     .listen((ably.ConnectionStateChange stateChange) async {
    //   // Handle connection state change
    //   print(stateChange.event.toString());

    //   ably.RealtimeChannel channel = realtime.channels.get('channel-name');

    // });
  }

  String? _message;
  List<Message> messages = [];

  Future<List<Message>> fetchMessages(token) async {
    List<Message> messageList = [];
    final response =
        await apiBaseHelper.get(url: '/user/messages', token: token);
    List messageResponse = response['data'] as List;
    for (int i = 0; i < messageResponse.length; i++) {
      Map<String, dynamic> map = messageResponse[i];
      messageList.add(Message.fromJson(map));
    }
    messages = messageList;
    notifyListeners();
    return messageList;
  }

  Future sendMessage(message, token) async {
    print('😁 before chat message is sent');
    await apiBaseHelper.post(
        url: '/user/messages', payload: message, token: token);
    print('😎 after message is sent');
  }

  void bindEvent(String channelName) async {
    // pusher.connect();
    // _channel =
    // await pusher.subscribe(channelName: channelName);
    await initPusher();
    // _channel!.bind(eventName, (last) {
    //   final String data = last.data;

    //   var json = jsonDecode(data);

    //   messages.insert(0,
    //   Message.fromJson(json)
    //     // Message(sender: json['sender'],time: json['time'], text: json['text'])
    //   );
    //   notifyListeners();
    // });
  }

  Future<void> initPusher() async {
    try {
      // await pusher.init(apiKey: '51df02a0da376c37ab66', cluster: 'ap1');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
