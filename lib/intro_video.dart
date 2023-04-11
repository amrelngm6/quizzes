import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Quizzes/QuizModel.dart';
import 'package:Quizzes/backBtn.dart';
import 'package:video_player/video_player.dart';
import 'client.dart';
import 'Helpers.dart';
import 'video.dart';
// import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption3.dart';

// void main() => runApp (const VideoApp());

/// Stateful widget to fetch and then display video content.
class IntroVideoApp extends StatefulWidget {
  IntroVideoApp({Key? key, required this.quizModel}) : super(key: key);

  final QuizModel quizModel;

  @override
  IntroVideoAppState createState() => IntroVideoAppState();
}

class IntroVideoAppState extends State<IntroVideoApp> {
  late VideoPlayerController _controller;
  final Helper helper = Helper();

  late bool _played = false;

  final HttpService httpService = HttpService();

  late VideoApp videoApp = VideoApp(quizModel: widget.quizModel);

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(widget.quizModel.video_url!);
    _controller = VideoPlayerController.asset(
        "assets/videos/" + widget.quizModel.intro_url!);

    _controller.addListener(checkVideo);

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {
        _controller.value.isInitialized && !_controller.value.isPlaying
            ? _controller.play()
            : "";
      });
    });
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
                AspectRatio(
                  aspectRatio: 1,
                  child: VideoPlayer(_controller),
                ),
                Column(
                  children: [],
                ),
                Positioned(
                    bottom: 20,
                    // The custom button
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Get.to(checkRoute());
                        });
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 50,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/vazhdo.png"),
                          ),
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  checkRoute() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    return VideoApp(quizModel: widget.quizModel);
  }

  void checkVideo() {
    // Implement your calls inside these conditions' bodies :

    setState(() {
      if (_played &&
          !_controller.value.isPlaying &&
          _controller.value.position == _controller.value.duration) {
        Get.to(checkRoute());
      }

      if (_controller.value.isPlaying) {
        _played = true;
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
