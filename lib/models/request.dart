import '../services/api_base_helper.dart';

class Request {
  String mentor;
  String state;
  String message;

  Request({required this.mentor, required this.state, required this.message});
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
        mentor: json['mentor'],
        state: json['state'],
        message: json['request_message']);
  }
}

class RequestList {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<Request>> fetchAllRequests(String token) async {
    List<Request> requests = [];

    final response = await apiBaseHelper.get(url: '/user/my_requests', token: token);
    List requestResponse = response as List;

    for (int i = 0; i < requestResponse.length; i++) {
      print('😂😂😁 requeste');
      print(requestResponse);
      Map<String, dynamic> map = requestResponse[i];
      requests.add(Request.fromJson(map));
    }
    return requests;
  }
}
