import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Quizzes/quiz.dart';
import '../QuizModel.dart';
import '../client.dart';
import '../menu.dart';
import '../backBtn.dart';
import '../sections.dart';
import '../Helpers.dart';
import './QuizOption4.dart';
import './QuizOption6.dart';

class QuizOption5 extends StatefulWidget {
  QuizOption5({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOption5> createState() => _QuizOption5State();
}

class _QuizOption5State extends State<QuizOption5> {
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
                      fontSize: widget.quiz.title!.length > 100 ? 18 : 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[400],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
                  child: Text(
                    "${widget.quiz.sub_title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Berlin",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
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
                            child: Text(_query[index].text!.trim(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
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
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    child: Image(
                      alignment: Alignment.center,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/quote_bg.png"),
                    ),
                  ),
            !_optionChecked
                ? Center()
                : Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: helper.checkQuoteColor(_hasSelected),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${widget.quiz.quote_text}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Freig",
                              fontSize: widget.quiz.quote_text!.length > 100
                                  ? (widget.quiz.quote_text!.length > 300
                                      ? 15
                                      : 16)
                                  : 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ]),
                  ),
            !_optionChecked
                ? Center()
                : Positioned(
                    bottom: 20,
                    right: 20,
                    child: GestureDetector(
                      // When the child is tapped, show a snackbar.
                      onTap: () {
                        helper.funcThatMakesAsyncCall(widget.quiz.next_id);
                      },
                      // The custom button
                      child: Image(
                        width: 160,
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

  gradientColor(index) {
    if (_query[index].selected! && _query[index].is_correct!)
      return [Colors.green[100], Colors.green[600]];

    if (_query[index].selected! && !_query[index].is_correct!)
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
