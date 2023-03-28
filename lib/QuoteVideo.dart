import 'package:Quizzes/Helpers.dart';
import 'package:flutter/material.dart';
import 'package:Quizzes/QuizModel.dart';
import 'package:Quizzes/QuizOptions.dart';
import 'package:get/get.dart';
import 'package:Quizzes/backBtn.dart';
import 'package:Quizzes/quiz_options/QuizOption1.dart';
import 'package:Quizzes/sections.dart';
import 'package:video_player/video_player.dart';
import 'client.dart';
import 'menu.dart';
import '../quiz_options/QuizOption1.dart';
import '../quiz.dart';
import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption3.dart';

// void main() => runApp (const VideoApp());

/// Stateful widget to fetch and then display video content.
class QuoteVideo extends StatefulWidget {
  QuoteVideo({Key? key, required this.quizModel}) : super(key: key);

  QuizModel quizModel;

  @override
  _QuoteVideoState createState() => _QuoteVideoState();
}

class _QuoteVideoState extends State<QuoteVideo> {
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
        "assets/videos/" + widget.quizModel.quote_video_url!);

    _controller.addListener(checkVideo);

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {
        _controller.value.isInitialized && !_controller.value.isPlaying
            // ? ""
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
                AspectRatio(
                  aspectRatio: 1,
                  child: VideoPlayer(_controller),
                ),
                Positioned(
                    bottom: 20,
                    // The custom button
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          checkRoute();
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
    if (widget.quizModel.next_id! < 1) {
      Get.to(Sections(
          title: "Zgjidhni",
          sub_title: "grupmoshën tuaj",
          bg: "uploads/images/sections-bg.png"));
    }

    if (widget.quizModel.next_id! > 0) {
      return helper.funcThatMakesAsyncCall(widget.quizModel.next_id);
    }
  }

  void checkVideo() {
    // Implement your calls inside these conditions' bodies :

    setState(() {
      if (_played &&
          !_controller.value.isPlaying &&
          _controller.value.position == _controller.value.duration) {
        _showCover = true;
        checkRoute();
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
