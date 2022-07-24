class RoleModel {
  String title;
  String img;
  String description;
  int like;
  int view;

  RoleModel(
      {required this.title,
      required this.img,
      required this.description,
      required this.like,
      required this.view});
      
  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
        title: json['title'],
        img: json['img'],
        description: json['description'],
        like: json['like'],
        view: json['view']);
  }
}
