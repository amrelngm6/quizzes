import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Quizzes/quiz.dart';
import '../QuizModel.dart';
import '../client.dart';
import '../menu.dart';
import '../backBtn.dart';
import '../sections.dart';
import '../Helpers.dart';

class QuizOption3 extends StatefulWidget {
  QuizOption3({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<QuizOption3> createState() => _QuizOption3State();
}

class _QuizOption3State extends State<QuizOption3> {
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
          toolbarHeight: 70, // Set this height
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
                    width: 380,
                    image: CachedNetworkImageProvider(
                        httpService.imaegURL + '${widget.quiz.options_img}')),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Text(
                    "${widget.quiz.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Berlin",
                      fontSize: (widget.quiz.title!.length > 100) ? 17 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[400],
                    ),
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
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                              // color: helper.checkColor(index),
                              boxShadow: [
                                BoxShadow(
                                    color: helper.checkColor(
                                        _optionChecked,
                                        _query[
                                            index])), // helper.checkColor(index)),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 50),
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(_query[index].text!.trim(),
                                style: TextStyle(
                                    fontSize: _query.length > 3 ? 14 : 16,
                                    color: Colors.black54)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.quiz.next_id! > 0) {
                        helper.funcThatMakesAsyncCall(widget.quiz.next_id);
                      } else {
                        Get.to(sections);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/vazhdo.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Positioned(
            //     bottom: 20,
            //     // The custom button
            //     child: GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           if (widget.quiz.next_id! > 0) {
            //             helper.funcThatMakesAsyncCall(widget.quiz.next_id);
            //           } else {
            //             Get.to(sections);
            //           }
            //         });
            //       },
            //       child: Container(
            //         alignment: Alignment.bottomCenter,
            //         margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            //         height: 50,
            //         width: 150,
            //         decoration: const BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("assets/vazhdo.png"),
            //           ),
            //         ),
            //       ),
            //     )),
            showCelebrategif
                ? Image(image: AssetImage("assets/celebrate.gif"))
                : Center(),
          ],
        ),
      ),
    );
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
