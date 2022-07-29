import 'package:super_woman_user/services/api_base_helper.dart';

class Field {
  int id;
  String title;
  Field({required this.id, required this.title});
  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(id: json['id'], title: json['title']);
  }
}

class InterestList {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<Field>> fetchAllFields() async {
    List<Field> fields = [];
    List fieldResponse = await apiBaseHelper.get(url: '/api/fields') as List;
    for (int i = 0; i < fieldResponse.length; i++) {
      Map<String, dynamic> map = fieldResponse[i];
      fields.add(Field.fromJson(map));
    }
    // print('😂😂😁');
    // print(fieldResponse);
    return fields;
  }

  Future<List<Field>> fetchUserInterests(token) async {
    List<Field> myFields = [];
    List levelsResponse = await apiBaseHelper.get(
        url: '/user/my_interests', token: token) as List;
    for (int i = 0; i < levelsResponse.length; i++) {
      Map<String, dynamic> map = levelsResponse[i];
      myFields.add(Field.fromJson(map));
    }
    print(myFields);
    return myFields;
  }

    Future updateUserInterest(selectedFields, token) async {
    // List updateInterestResponse = 
    await apiBaseHelper.post(
        url: '/user/set_interests',payload: selectedFields, token: token) as List;
    // for (int i = 0; i < levelsResponse.length; i++) {
    //   Map<String, dynamic> map = levelsResponse[i];
    //   myFields.add(Field.fromJson(map));
    // }
    
  }
}
