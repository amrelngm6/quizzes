import 'package:Quizzes/QuizModel.dart';

class Post {
  int? id;
  String? title;
  String? picture;
  String? sub_title;
  String? section_bg;
  int? quiz_id;
  bool? video_type;
  String? video_url;

  Post({
    required this.id,
    required this.title,
    this.sub_title,
    required this.picture,
    required this.section_bg,
    this.quiz_id,
    this.video_type,
    this.video_url,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      title: json['title'] as String?,
      picture: json['picture'] as String?,
      sub_title: json['sub_title'] as String?,
      section_bg: json['section_bg'] as String?,
      quiz_id: json['quiz_id'] as int?,
      video_type: json['video_type'] as bool?,
      video_url: json['video_url'] as String?,
    );
  }
}

class Category {
  int? id;
  String? title;
  String? picture;
  String? sub_title;
  String? section_bg;

  Category({
    required this.id,
    required this.title,
    this.sub_title,
    required this.picture,
    required this.section_bg,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      title: json['title'] as String?,
      picture: json['picture'] as String?,
      sub_title: json['sub_title'] as String?,
      section_bg: json['section_bg'] as String?,
    );
  }
}
