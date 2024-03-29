import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/rendering.dart';
import 'package:Quizzes/quiz.dart';
import '../QuizModel.dart';
import '../client.dart';
import '../menu.dart';
import '../backBtn.dart';
import '../sections.dart';
import '../Helpers.dart';
import './QuizOption4.dart';
import './QuizOption5.dart';
import './QuizOption7.dart';

class QuizOption6 extends StatefulWidget {
  QuizOption6({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOption6> createState() => _QuizOption6State();
}

class _QuizOption6State extends State<QuizOption6> {
  final HttpService httpService = HttpService();

  final Helper helper = Helper();

  late List<QuizOption> _query = widget.quiz.options;

  late int _totalCorrect = totalCorrect();
  late int _totalChecked = 1;
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
                    width: _query.length > 3 ? 300 : 400,
                    image: CachedNetworkImageProvider(
                        httpService.imaegURL + '${widget.quiz.options_img}')),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Text(
                    "${widget.quiz.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Berlin",
                      fontSize: _query.length > 4 ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[400],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                widget.quiz.sub_title != null
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                        child: Text(
                          "${widget.quiz.sub_title != null ? widget.quiz.sub_title : ""}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Berlin",
                            fontSize: _query.length > 3 ? 15 : 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    : Center(),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.fromLTRB(
                        _query.length > 3 ? 5 : 10, 10, 0, 0),
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
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(
                            _query.length > 3 ? 5 : 10, 10, 10, 10),
                        margin: EdgeInsets.fromLTRB(
                            _query.length > 3 ? 5 : 10, 10, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 2,
                                color: helper.checkColor(
                                    _query[index].selected!
                                        ? true
                                        : _optionChecked,
                                    _query[index])),
                          ],
                        ),
                        child: Row(children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [
                                    helper.gradientColor(
                                        _query[index].selected!
                                            ? true
                                            : _optionChecked,
                                        _query[index])[0],
                                    helper.gradientColor(
                                        _query[index].selected!
                                            ? true
                                            : _optionChecked,
                                        _query[index])[1]
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              border: Border.all(
                                  color: helper.checkColor(
                                      _query[index].selected!
                                          ? true
                                          : _optionChecked,
                                      _query[index])),
                              // color: checkColor(index),
                              boxShadow: [
                                BoxShadow(
                                    color: helper.checkColor(
                                        _query[index].selected!
                                            ? true
                                            : _optionChecked,
                                        _query[index])), // checkColor(index)),
                              ],
                            ),
                            child: Container(
                                margin: EdgeInsets.fromLTRB(0, 3.5, 0, 0),
                                alignment: Alignment.bottomCenter,
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white)),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 80),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(_query[index].text!,
                                style: TextStyle(
                                    fontSize: _query[index].text!.length > 40
                                        ? 14
                                        : 16,
                                    color: Colors.black54)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
            !_optionChecked
                ? Center()
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromARGB(100, 0, 0, 0),
                  ),
            !_optionChecked
                ? Center()
                : Container(
                    margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      color: Colors.red[300],
                    ),
                  ),
            !_optionChecked
                ? Center()
                : Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(0, 340, 0, 0),
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.quiz.quote_title}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Berlin",
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[400],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.quiz.quote_text}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Berlin",
                              fontSize: widget.quiz.quote_text!.length > 200
                                  ? 14
                                  : 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ])),
            !_optionChecked
                ? Center()
                : Positioned(
                    bottom: 20,
                    child: GestureDetector(
                      // When the child is tapped, show a snackbar.
                      onTap: () {
                        (widget.quiz.next_id! > 0)
                            ? helper.funcThatMakesAsyncCall(widget.quiz.next_id)
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
      if (_totalCorrect > 1 && _totalCorrect > _totalChecked) {
        _query[index].selected = true;
        _query[index].is_correct! ? helper.playWin() : helper.playLose();
      } else if (!_optionChecked) {
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
      ++_totalChecked;
      // Increase Total checked options
      if (_totalChecked > _totalCorrect) {
        _optionChecked = true;
      }
    });
  }

  // Check the count of the total right answers
  // to validate with the selected ones
  totalCorrect() {
    _totalCorrect = 0;
    for (var item in _query) {
      if (item.is_correct!) {
        ++_totalCorrect;
      }
    }
    return _totalCorrect;
  }
}
