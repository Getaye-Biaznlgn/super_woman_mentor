
class RoleModel {
  int id;
  String intro;
  String title;
  String img;
  int like;
  int view;
  int share;
  int comment;
  
  RoleModel(
      {required this.title,
      required this.id,
      required this.intro,
      required this.img,
      required this.like,
      required this.share,
      required this.comment,
      required this.view,
});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      title: json['title'],
      like: json['like'],
      view: json['view'],
      intro: json['intro'],
      img: json['image']['path'],
      share: json['share'],
      comment: json['comment'],
      
    );
  }
}
