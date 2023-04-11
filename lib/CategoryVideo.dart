import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Quizzes/backBtn.dart';
import 'package:Quizzes/sections.dart';
import 'package:video_player/video_player.dart';
import 'client.dart';
import 'post_model.dart';
import 'Helpers.dart';

/// Stateful widget to fetch and then display video content.
class CategoryVideo extends StatefulWidget {
  CategoryVideo({Key? key, required this.section}) : super(key: key);

  final Post section;

  @override
  CategoryVideoState createState() => CategoryVideoState();
}

class CategoryVideoState extends State<CategoryVideo> {
  late VideoPlayerController _controller;
  final Helper helper = Helper();

  late bool _played = false;

  final Sections sections = Sections(
      title: "Zgjidhni",
      sub_title: "grupmoshën tuaj",
      bg: "uploads/images/sections-bg.png");

  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(widget.quizModel.video_url!);
    _controller = VideoPlayerController.asset(
        "assets/videos/" + widget.section.video_url!);

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
              ],
            )),
      ),
    );
  }

  checkRoute() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    return sections;
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
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
