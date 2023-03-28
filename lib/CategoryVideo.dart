import 'package:flutter/material.dart';
import 'package:Quizzes/QuizModel.dart';
import 'package:Quizzes/QuizOptions.dart';
import 'package:Quizzes/backBtn.dart';
import 'package:Quizzes/quiz_options/QuizOption1.dart';
import 'package:Quizzes/sections.dart';
import 'package:video_player/video_player.dart';
import 'client.dart';
import 'menu.dart';
import 'post_model.dart';
import '../quiz_options/QuizOption1.dart';
import '../quiz.dart';
import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption2.dart';
// import '../quiz_options/QuizOption3.dart';

// void main() => runApp (const VideoApp());

/// Stateful widget to fetch and then display video content.
class CategoryVideo extends StatefulWidget {
  CategoryVideo({Key? key, required this.section}) : super(key: key);

  Post section;

  @override
  _CategoryVideoState createState() => _CategoryVideoState();
}

class _CategoryVideoState extends State<CategoryVideo> {
  late VideoPlayerController _controller;

  late IconData _pause_icon = Icons.pause;
  late IconData _play_icon = Icons.play_arrow;
  late IconData _test_icon = Icons.home;

  late IconData buttonIcon = _play_icon;

  late bool _played = false;

  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/" + widget.section.video_url!);

    _controller.addListener(checkVideo);

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {
        _controller.value.isInitialized ? _controller.play() : "";
      });
    });
    // _controller.addListener(() {
    //     setState(() {
    //       print('wORK');
    //       buttonIcon = _play_icon;
    //     });
    //  });
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
          toolbarHeight: 50, // Set this height
          automaticallyImplyLeading: false,
          flexibleSpace: backBtn(context),
          primary: false,
        ),
        body: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: 1 / 1.9,
                    child: VideoPlayer(_controller),
                  )
                : Container()),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color.fromRGBO(100, 100, 50, 1),
        //   onPressed: () {
        //     setState(() {
        //       !_controller.value.isPlaying
        //           ? _controller.play()
        //           : funcThatMakesAsyncCall(widget.quizModel.next_id);
        //     });
        //   },
        //   child: Icon(
        //     _controller.value.isPlaying ? _pause_icon : buttonIcon,
        //   ),
        // ),
      ),
    );
  }

  getQuiz(id) {
    Future<QuizModel> _futureQuiz = httpService.getQuiz("quiz/${id}");

    return _futureQuiz;
  }

  Future funcThatMakesAsyncCall(id) async {
    var result = await getQuiz(id);
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Quiz(quiz: result),
        ),
      );
    });
  }

  void checkVideo() {
    // Implement your calls inside these conditions' bodies :
    if (_controller.value.position ==
        Duration(seconds: 0, minutes: 0, hours: 0)) {}

    if (!_controller.value.isPlaying &&
        _controller.value.position == _controller.value.duration) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
