import 'dart:convert';
import 'dart:ffi';

class QuizModel {
  int? id;
  String? title;
  String? picture;
  String? video_bg;
  String? video_url;
  String? intro_url;
  String? options_img;
  int? next_id;
  bool? played;
  int? options_style;
  String? quote_title;
  String? quote_text;
  String? quote_video_url;
  String? sub_title;
  List<QuizOption> options;

  QuizModel(
      {required this.id,
      required this.title,
      required this.picture,
      this.video_bg,
      this.video_url,
      this.intro_url,
      required this.options,
      this.next_id,
      this.played,
      this.options_style,
      this.quote_title,
      this.quote_text,
      this.quote_video_url,
      this.sub_title,
      this.options_img});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> __options = json["options"];

    late List<QuizOption> _options =
        __options.map((dynamic val) => QuizOption.fromJson(val)).toList();

    return QuizModel(
      id: json['id'] as int?,
      picture: json['picture'] as String?,
      title: json['title'] as String?,
      video_bg: json['video_bg'] as String?,
      video_url: json['video_url'] as String?,
      intro_url: json['intro_url'] as String?,
      next_id: json['next_id'] as int?,
      options_style: json['options_style'] as int?,
      quote_text: json['quote_text'] as String?,
      quote_title: json['quote_title'] as String?,
      quote_video_url: json['quote_video_url'] as String?,
      options_img: json['options_img'] as String?,
      sub_title: json['sub_title'] as String?,
      options: _options,
    );
  }
}

class QuizOption {
  int? id;
  String? letter;
  String? text;
  bool? selected;
  bool? is_correct;
  String? picture;

  QuizOption({
    required this.id,
    this.letter,
    required this.text,
    this.selected,
    this.is_correct,
    this.picture,
  });

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      id: json['id'] as int?,
      letter: json['letter'] as String?,
      text: json['text'] as String?,
      selected: json['selected'] as bool?,
      is_correct: json['is_correct'] as bool?,
      picture: json['picture'] as String?,
    );
  }
}
