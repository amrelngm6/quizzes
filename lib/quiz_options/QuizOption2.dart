import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:Quizzes/QuoteVideo.dart';
import 'package:Quizzes/quiz.dart';
import 'package:Quizzes/quiz_options/Quote.dart';
import '../QuizModel.dart';
import '../Helpers.dart';
import '../client.dart';
import '../menu.dart';
import '../backBtn.dart';

class QuizOption2 extends StatefulWidget {
  QuizOption2({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOption2> createState() => _QuizOption2State();
}

class _QuizOption2State extends State<QuizOption2> {
  final HttpService httpService = HttpService();
  final Helper helper = Helper();

  late List<QuizOption> _query = widget.quiz.options;

  late bool _hasSelected = false;
  late bool showCelebrategif = false;
  late bool _optionChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.topCenter,
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 100,
          toolbarHeight: 60, // Set this height
          automaticallyImplyLeading: false,
          flexibleSpace: backBtn(context),
          primary: false,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Image(
                        alignment: Alignment.topCenter,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(httpService.imaegURL +
                            '${widget.quiz.options_img}'))),
                Text(
                  "${widget.quiz.title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Berlin",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[400],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    itemCount: _query.length,
                    itemBuilder: (context, index) => GestureDetector(
                      // When the child is tapped, show a snackbar.
                      onTap: () {
                        setState(() {
                          handleClick(index);
                        });
                      },
                      // The custom button
                      child: Container(
                        // width: double.maxFinite,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 2,
                                color: helper.checkColor(
                                    _optionChecked, _query[index])),
                          ],
                        ),
                        child: Row(children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: 20,
                            height: 20,
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                  colors: [
                                    helper.gradientColor(
                                        _optionChecked, _query[index])[0],
                                    helper.gradientColor(
                                        _optionChecked, _query[index])[1]
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              border: Border.all(
                                  color: helper.checkColor(
                                      _optionChecked, _query[index])),
                              // color: checkColor(index),
                              boxShadow: [
                                BoxShadow(
                                    color: helper.checkColor(_optionChecked,
                                        _query[index])), // checkColor(index)),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 50),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(_query[index].text!.trim(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              // The custom button
              child: _optionChecked
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!widget.quiz.quote_text!.isEmpty) {
                            Get.to(Quote(quiz: widget.quiz));
                          } else if (!widget.quiz.quote_video_url!.isEmpty) {
                            Get.to(QuoteVideo(quizModel: widget.quiz));
                          } else {
                            helper.funcThatMakesAsyncCall(widget.quiz.next_id);
                          }
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
                    )
                  : Center(),
            ),
            showCelebrategif
                ? Image(image: AssetImage("assets/celebrate.gif"))
                : Center(),
          ],
        ),
      ),
    );
  }

  /// Check if the options is selected
  ///
  /// if (is_correct) Play win track with Celebrate GIF
  ///
  /// if (!is_correct) Play lose track only
  handleClick(index) {
    if (!_optionChecked) {
      for (var item in _query) {
        item.selected = false;
      }
      _query[index].selected = true;
      _hasSelected = !_query[index].is_correct! ? false : true;
      if (_hasSelected) {
        showCelebrategif = true;
        helper.playWin();
      } else {
        helper.playLose();
      }
    }
    _optionChecked = true;
  }
}
