import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Quizzes/quiz.dart';
import 'package:Quizzes/sections.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../QuizModel.dart';
import '../client.dart';
import '../menu.dart';
import '../Helpers.dart';
import '../backBtn.dart';

class Quote extends StatefulWidget {
  Quote({Key? key, required this.quiz}) : super(key: key);

  QuizModel quiz;

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  final HttpService httpService = HttpService();

  final Helper helper = Helper();

  late bool? _finished = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      // color: Colors.white,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/quote-bg.png"), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 100,
          toolbarHeight: 50, // Set this height
          automaticallyImplyLeading: false,
          flexibleSpace: backBtn(context),
        ),
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
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
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                      color: Colors.orange[400],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.quiz.quote_text}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Freig",
                      fontSize: widget.quiz.quote_text!.length > 250
                          ? 13
                          : (widget.quiz.quote_text!.length > 200 ? 14 : 15),
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 225,
                  ),
                ],
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                setState(() => checkRoute());
              },
              // The custom button
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                child: Image(
                  width: 160,
                  image: AssetImage("assets/vazhdo.png"),
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkRoute() {
    (widget.quiz.next_id! > 0)
        ? helper.funcThatMakesAsyncCall(widget.quiz.next_id)
        : Get.to(
            Sections(
                title: "Zgjidhni",
                sub_title: "grupmoshën tuaj",
                bg: "uploads/images/sections-bg.png"),
          );
  }
}
