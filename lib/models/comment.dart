class Comment {
  String content;
  String profileImage;
  Comment({required this.content, required this.profileImage});
  factory Comment.fromJson(Map<String, dynamic> json) {
   return Comment(content: json['content'], profileImage: json['profile_image']);
  }
}
