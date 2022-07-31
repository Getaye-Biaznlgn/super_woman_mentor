class Availablity {
  int id;
  String day;
  DateTime to, from;

  Availablity(
      {required this.id,
      required this.day,
      required this.to,
      required this.from});
  factory Availablity.fromJson(Map<String, dynamic> json) {
    return Availablity(
        id: json['id'], day: json['day'], to: DateTime.parse(json['to']) , from:DateTime.parse(json['from']) );
  }
}
