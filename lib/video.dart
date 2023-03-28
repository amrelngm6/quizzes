import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Quizzes/QuizModel.dart';
import 'package:Quizzes/QuizOptions.dart';
import 'package:Quizzes/backBtn.dart';
import 'package:Quizzes/quiz_options/QuizOption1.dart';
import 'package:video_player/video_player.dart';
import 'client.dart';
import 'menu.dart';
import 'Helpers.dart';
import '../quiz_options/QuizOption1.dart';
import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption3.dart';

// void main() => runApp (const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  VideoApp({Key? key, required this.quizModel}) : super(key: key);

  QuizModel quizModel;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final Helper helper = Helper();

  late IconData _pause_icon = Icons.pause;
  late IconData _play_icon = Icons.play_arrow;
  late IconData _test_icon = Icons.home;

  late IconData buttonIcon = _play_icon;

  late bool _played = false;

  late bool _showCover = true;

  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(widget.quizModel.video_url!);
    _controller = VideoPlayerController.asset(
        "assets/videos/" + widget.quizModel.video_url!);

    _controller.addListener(checkVideo);

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {
        _controller.value.isInitialized && !_controller.value.isPlaying
            ? _controller.play()
            : "";
      });
    });
    // _controller.addListener(() {
    //     setState(() {
    //       print('wORK');
    //       buttonIcon = _play_icon;
    //     });
    //  });
  }

  getTemporaryDirectory() async {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // Quiz _quiz = Quiz(quiz: widget.quizModel);

    return MaterialApp(
      title: 'Video',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 100,
          toolbarHeight: 85, // Set this height
          automaticallyImplyLeading: false,
          flexibleSpace: backBtn(context),
          primary: false,
        ),
        body: Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                !_showCover &&
                        _controller.value.isInitialized &&
                        _controller.value.isPlaying
                    ? AspectRatio(
                        aspectRatio: 1,
                        child: VideoPlayer(_controller),
                      )
                    : GestureDetector(
                        // When the child is tapped, show a snackbar.
                        onTap: () {
                          setState(() {
                            if (_controller.value.isInitialized &&
                                !_controller.value.isPlaying) {
                              _controller.play();
                              _played = true;
                              _showCover = false;
                            }
                          });
                        },
                        // The custom button
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/videos/' +
                                  '${widget.quizModel.video_bg}'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                const Color(0xff4B1F4D).withOpacity(0.1),
                                BlendMode.color,
                              ),
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  bottom: 20,
                  child: GestureDetector(
                    // When the child is tapped, show a snackbar.
                    onTap: () {
                      setState(() {
                        Get.to(checkRoute());
                      });
                    },
                    // The custom button
                    child: Image(
                      width: 160,
                      image: AssetImage("assets/vazhdo.png"),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  checkRoute() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    if (widget.quizModel.options_style == 1) {
      return QuizOption1(quiz: widget.quizModel);
    }

    if (widget.quizModel.options_style == 2) {
      return QuizOption2(quiz: widget.quizModel);
    }

    return QuizOption1(quiz: widget.quizModel);
  }

  void checkVideo() {
    // Implement your calls inside these conditions' bodies :

    setState(() {
      if (_played &&
          !_controller.value.isPlaying &&
          _controller.value.position == _controller.value.duration) {
        _showCover = true;
        Get.to(checkRoute());
      }

      if (_controller.value.isPlaying) {
        _played = true;
        _showCover = false;
      }
    });
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => checkRoute(),
    //   ),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
