import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:Quizzes/quiz.dart';
import 'QuizModel.dart';
import 'client.dart';
import 'menu.dart';

class QuizOptions extends StatefulWidget {
  QuizOptions({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOptions> createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions> {
  final HttpService httpService = HttpService();

  late List<QuizOption> _query = widget.quiz.options;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[200],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 50, // Set this height
          title: menu(),
          shadowColor: Colors.transparent,
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
                    fontFamily: "SFUIText",
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
                    for (var item in _query) {
                      item.selected = false;
                    }
                    _query[index].selected = true;

                    if (_query[index].is_correct!) {
                      funcThatMakesAsyncCall(widget.quiz.next_id);
                    }
                  });
                },
                // The custom button
                child: Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    width: 400,
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
                    margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 2,
                            color: checkColor(index)),
                      ],
                    ),
                    child: Text(_query[index].text!,
                        style: TextStyle(fontSize: 20, color: Colors.black54)),
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      width: 55,
                      height: 55,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: checkColor(index),
                        boxShadow: [
                          BoxShadow(color: checkColor(index)),
                        ],
                      ),
                      child: Text(
                        _query[index].letter!,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkColor(index) {
    if (_query[index].selected! && _query[index].is_correct!) {
      return Colors.green[300];
    }

    if (_query[index].selected! && !_query[index].is_correct!) {
      return Color.fromARGB(255, 255, 10, 10);
    }

    return Colors.black45;
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
}
