//doesn't make sense creating two model class for same thing,
//but api uses same fields like image and it's difficult to
//working based on condition
import 'package:super_woman_user/models/comment.dart';

import '../services/api_base_helper.dart';

class RoleModelDetail {
  int id;
  String intro;
  String title;
  int like;
  int view;
  int share;
  int comment;
  String content;
  String? audioPath;
  List<String>? images;
  List<Comment>? comments;

  RoleModelDetail(
      {required this.title,
      required this.id,
      required this.intro,
      required this.like,
      required this.share,
      required this.comment,
      required this.view,
      required this.content,
      this.audioPath,
      this.images,
      this.comments});

  factory RoleModelDetail.fromJson(Map<String, dynamic> json) {
    List imagesJson = json['image'] as List;
    List<String> images = imagesJson.map((el) {
      String path = el['path'] as String;
      return path;
    }).toList();

    List commentsJson = json['comments'] as List;
    List<Comment> comments = commentsJson.map((el) {
      return Comment.fromJson(el);
    }).toList();

    return RoleModelDetail(
        id: json['id'],
        title: json['title'],
        like: json['like'],
        view: json['view'],
        intro: json['intro'],
        images: images,
        share: json['share'],
        comment: json['comment'],
        content: json['content'],
        comments: comments,
        audioPath: json['audio_path']);
  }


}
