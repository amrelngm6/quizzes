import 'dart:convert';
import 'package:flutter/material.dart';
import 'video.dart';
import 'intro_video.dart';
import 'QuizModel.dart';
import 'client.dart';
import 'quiz_options/QuizOption1.dart';
import 'quiz_options/QuizOption2.dart';
import 'quiz_options/QuizOption3.dart';
import 'quiz_options/QuizOption4.dart';
import 'quiz_options/QuizOption5.dart';
import 'quiz_options/QuizOption6.dart';
import 'quiz_options/QuizOption7.dart';
import 'Helpers.dart';

class Quiz extends StatefulWidget {
  final HttpService httpService = HttpService();

  Quiz({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final HttpService httpService = HttpService();

  final Helper helper = Helper();

  late VideoApp videoApp = VideoApp(quizModel: widget.quiz);
  late IntroVideoApp introVideoApp = IntroVideoApp(quizModel: widget.quiz);

  late List<QuizOption> _query = widget.quiz.options;

  // late List<QuizOption> _options
  @override
  Widget build(BuildContext context) {
    return (widget.quiz.id == 10) ? introVideoApp : videoApp;
  }
}
