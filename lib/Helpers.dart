import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'video.dart';
import 'QuizModel.dart';
import 'client.dart';
import 'quiz.dart';
import 'sections.dart';
import 'quiz_options/QuizOption1.dart';
import 'quiz_options/QuizOption2.dart';
import 'quiz_options/QuizOption3.dart';
import 'quiz_options/QuizOption4.dart';
import 'quiz_options/QuizOption5.dart';
import 'quiz_options/QuizOption6.dart';
import 'quiz_options/QuizOption7.dart';
import 'package:get/get.dart';

class Helper {
  final List<QuizOption> quizOptions = [QuizOption(id: 0, text: '')];

  late Quiz quiz = Quiz(
      quiz: QuizModel(id: 0, title: '', picture: '', options: quizOptions));

  final HttpService httpService = HttpService();

  final _HelperWidgets __HelperWidgets = _HelperWidgets();

  Future checkRoute(quiz) async {
    return __HelperWidgets.checkRoute(quiz);
  }

  Future playWin() async {
    return __HelperWidgets.playWinAudio();
  }

  Future playLose() async {
    return __HelperWidgets.playLoseAudio();
  }

  /// Get the Quiz by (id)
  ///
  /// Redirect to Quiz page
  ///
  /// If null redirect to Home
  Future funcThatMakesAsyncCall(id) async {
    if (id < 1) {
      Get.to(Sections(
          title: "Zgjidhni",
          sub_title: "grupmoshën tuaj",
          bg: "uploads/images/sections-bg.png"));
      return null;
    }
    return __HelperWidgets.funcThatMakesAsyncCall(id);
  }

  gradientColor(_optionChecked, item) {
    if (_optionChecked && item.is_correct!)
      return [Colors.green[100], Colors.green[600]];

    if (_optionChecked && !item.is_correct!)
      return [
        Color.fromARGB(255, 255, 170, 170),
        Color.fromARGB(255, 255, 0, 0)
      ];
    else
      return [Colors.blue[100], Colors.blue[600]];
  }

  checkColor(_optionChecked, item) {
    return gradientColor(_optionChecked, item)[1];
  }
}

class HelperWidgets extends StatefulWidget {
  @override
  State<Quiz> createState() => _HelperWidgets();
}

class _HelperWidgets extends State<Quiz> {
  final HttpService httpService = HttpService();

  Future playWinAudio() async {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audio/win.mp3"),
      autoStart: true,
      playInBackground: PlayInBackground.enabled,
      showNotification: true,
    );
  }

  Future playLoseAudio() async {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audio/lose.mp3"),
      autoStart: true,
      playInBackground: PlayInBackground.enabled,
      showNotification: true,
    );
  }

  checkRoute(quiz) {
    switch (quiz.options_style) {
      case 3:
        return QuizOption3(quiz: quiz);
        break;
      case 4:
        return QuizOption4(quiz: quiz);
        break;
      case 5:
        return QuizOption5(quiz: quiz);
        break;
      case 6:
        return QuizOption6(quiz: quiz);
        break;
      case 7:
        return QuizOption7(quiz: quiz);
        break;
    }

    return Quiz(quiz: quiz);
  }

  getQuiz(id) {
    Future<QuizModel> _futureQuiz = httpService.getQuiz("quiz/${id}");
    return _futureQuiz;
  }

  Future funcThatMakesAsyncCall(id) async {
    () => Get.testMode = true;
    var result = await getQuiz(id);
    if (id > 0 && result.id > 0) {
      Get.back();
      return Get.to(checkRoute(result));
    } else {
      return Get.to(Sections(
          title: "Zgjidhni",
          sub_title: "grupmoshën tuaj",
          bg: "uploads/images/sections-bg.png"));
    }
  }

  Widget build(BuildContext context) {
    return Center();
  }
}
