
class EducationLevel {
  int? id;
  String? level;
  EducationLevel({this.id, this.level});

  factory EducationLevel.fromJson(Map<String, dynamic> json) {
    return EducationLevel(id: json['id'], level: json['level']);
  }
  

}
