import 'dart:convert';
import 'dart:math';
import 'package:Quizzes/Helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Quizzes/quiz.dart';
import 'package:Quizzes/quiz_options/Quote.dart';
import '../QuizModel.dart';
import '../client.dart';
import '../menu.dart';
import '../backBtn.dart';

class QuizOption1 extends StatefulWidget {
  QuizOption1({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOption1> createState() => _QuizOption1State();
}

class _QuizOption1State extends State<QuizOption1> {
  final HttpService httpService = HttpService();
  final Helper helper = Helper();

  late List<QuizOption> _query = widget.quiz.options;

  late bool _hasSelected = false;
  late bool showCelebrategif = false;
  late bool _optionChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[200],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 100,
          toolbarHeight: 50, // Set this height
          automaticallyImplyLeading: false,
          flexibleSpace: backBtn(context),
          primary: false,
        ),
        backgroundColor: Colors.cyan[200],
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(height: 25),
                Text(
                  "${widget.quiz.title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Berlin",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
              itemCount: _query.length,
              itemBuilder: (context, index) => GestureDetector(
                // When the child is tapped, show a snackbar.
                onTap: () {
                  setState(() {
                    handleClick(index);
                  });
                },
                // The custom button
                child: Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    width: 380,
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
                    margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
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
                    child: Text(_query[index].text!.trim(),
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(colors: [
                        helper.gradientColor(_optionChecked, _query[index])[0],
                        helper.gradientColor(_optionChecked, _query[index])[1]
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      border: Border.all(
                          color:
                              helper.checkColor(_optionChecked, _query[index])),
                      // color: checkColor(index),
                      boxShadow: [
                        BoxShadow(
                            color: helper.checkColor(_optionChecked,
                                _query[index])), // checkColor(index)),
                      ],
                    ),
                    // child: Text(
                    //   _query[index].letter!,
                    //   style: TextStyle(
                    //       fontSize: 40,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold),
                    // )
                  )
                ]),
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                setState(() {
                  Get.to(Quote(quiz: widget.quiz));
                });
              },
              // The custom button
              child: _optionChecked
                  ? Center(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.fromLTRB(0, 550, 0, 0),
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

  gradientColor(index) {
    if (_optionChecked && _query[index].is_correct!)
      return [Colors.green[100], Colors.green[600]];

    if (_optionChecked && !_query[index].is_correct!)
      return [
        Color.fromARGB(255, 255, 170, 170),
        Color.fromARGB(255, 255, 0, 0)
      ];
    else
      return [Colors.blue[100], Colors.blue[600]];
  }

  checkColor(index) {
    return gradientColor(index)[1];
  }

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
