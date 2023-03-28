import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Quizzes/quiz.dart';
import 'package:get/get.dart';
import '../QuizModel.dart';
import '../client.dart';
import '../menu.dart';
import '../backBtn.dart';
import '../sections.dart';
import '../Helpers.dart';
import './QuizOption4.dart';
import './QuizOption5.dart';
import './QuizOption6.dart';

class QuizOption7 extends StatefulWidget {
  QuizOption7({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOption7> createState() => _QuizOption7State();
}

class _QuizOption7State extends State<QuizOption7> {
  final HttpService httpService = HttpService();
  final Helper helper = Helper();

  late List<QuizOption> _query = widget.quiz.options;

  late bool _hasSelected = false;
  late bool showCelebrategif = false;
  late bool _optionChecked = false;

  final Sections sections = Sections(
      title: "Zgjidhni",
      sub_title: "grupmoshën tuaj",
      bg: "uploads/images/sections-bg.png");

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
          toolbarHeight: 80, // Set this height
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
                Image(
                    alignment: Alignment.topCenter,
                    width: 400,
                    image: CachedNetworkImageProvider(
                        httpService.imaegURL + '${widget.quiz.options_img}')),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Text(
                    "${widget.quiz.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Berlin",
                      fontSize: _query.length > 4 ? 18 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[400],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Text(
                    "${widget.quiz.sub_title != null ? widget.quiz.sub_title : ""}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Berlin",
                      fontSize: _query.length > 4 ? 16 : 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (_query[0].id! > 0)
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                            child: GestureDetector(
                                // When the child is tapped, show a snackbar.
                                onTap: () {
                                  setState(() {
                                    handleClick(0);
                                  });
                                },
                                child: Center(
                                  child: OutlinedButton(
                                    onPressed: null,
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.all(18),
                                        side: BorderSide(
                                            color: helper.checkColor(
                                                _optionChecked, _query[0])),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    child: Text(
                                      _query[0].text!,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: helper.checkColor(
                                              _optionChecked, _query[0])),
                                    ),
                                  ),
                                )),
                          )
                        : Center(),
                    (_query[1].id! > 0)
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                            child: GestureDetector(
                                // When the child is tapped, show a snackbar.
                                onTap: () {
                                  setState(() {
                                    handleClick(1);
                                  });
                                },
                                child: Center(
                                  child: OutlinedButton(
                                    onPressed: null,
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.all(18),
                                        side: BorderSide(
                                            color: helper.checkColor(
                                                _optionChecked, _query[1])),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    child: Text(
                                      _query[1].text!,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: helper.checkColor(
                                              _optionChecked, _query[1])),
                                    ),
                                  ),
                                )),
                          )
                        : Center(),
                  ],
                ),
                SizedBox(height: 30),
                !_optionChecked
                    ? Center()
                    : Positioned(
                        bottom: 20,
                        child: GestureDetector(
                          // When the child is tapped, show a snackbar.
                          onTap: () {
                            (widget.quiz.next_id! > 0)
                                ? helper
                                    .funcThatMakesAsyncCall(widget.quiz.next_id)
                                : Get.to(sections);
                          },
                          // The custom button
                          child: Image(
                            width: 160,
                            height: 50,
                            image: AssetImage("assets/vazhdo.png"),
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ),
              ],
            ),
            showCelebrategif
                ? Image(image: AssetImage("assets/celebrate.gif"))
                : Center()
          ],
        ),
      ),
    );
  }

  handleClick(index) {
    setState(() {
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
    });
  }
}
