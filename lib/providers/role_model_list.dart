import 'package:flutter/foundation.dart';
import '../models/role_model.dart';
import '../services/api_base_helper.dart';

class RoleModelList with ChangeNotifier {
  // final String _apiKey = 'apiKey';
  late List<RoleModel> roleModels;
  final ApiBaseHelper _helper = ApiBaseHelper();
  Future<List<RoleModel>> fetchMovieList() async {
    final response = await _helper.get(url: "movie/popular?api_key=");
     var rest = response["articles"] as List;
        roleModels= rest.map<RoleModel>((json) => RoleModel.fromJson(json)).toList();
    return roleModels;
  }
}
// Future<List<Article>> getData(String newsType) async {
//   List<Article> list;
//     String link =
//           "https://newsapi.org/v2/top-headlines?country=in&apiKey=API_KEY";
//     var res = await http
//         .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
//     print(res.body);
//       if (res.statusCode == 200) {
//         var data = json.decode(res.body);
//         var rest = data["articles"] as List;
//         print(rest);
//         list = rest.map<Article>((json) => Article.fromJson(json)).toList();
//       }
//     print("List Size: ${list.length}");
//     return list;
//   }