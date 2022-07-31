class Experience {
  int id, isCurrent;
  String position, organization, to, from;
  Experience(
      {required this.id,
      required this.position,
      required this.organization,
      required this.to,
      required this.from,
      required this.isCurrent});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
        id: json['id'],
        position: json['position'],
        organization: json['organization'],
        to: json['to'],
        from: json['from'],
        isCurrent: json["is_current"]);
  }
}
