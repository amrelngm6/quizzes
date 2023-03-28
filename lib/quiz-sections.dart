import 'dart:convert';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Quizzes/CategoryVideo.dart';
import 'package:Quizzes/QuizModel.dart';
import 'package:Quizzes/quiz.dart';
import 'package:Quizzes/quiz_options/QuizOption1.dart';
import 'package:Quizzes/quiz_options/QuizOption2.dart';
import 'package:Quizzes/quiz_options/QuizOption3.dart';
import 'package:Quizzes/quiz_options/QuizOption4.dart';
import 'package:Quizzes/quiz_options/QuizOption5.dart';
import 'package:Quizzes/quiz_options/QuizOption6.dart';
import 'package:Quizzes/quiz_options/QuizOption7.dart';
import 'package:Quizzes/video.dart';
import 'backBtn.dart';
import 'post_model.dart';
import 'client.dart';
import 'CustomCategoryPage.dart';
import 'CustomCategoryPage2.dart';
import 'Helpers.dart';

class Section extends StatefulWidget {
  final HttpService httpService = HttpService();

  Section(
      {Key? key,
      required this.id,
      required this.title,
      required this.sub_title,
      required this.bg,
      this.video_url,
      required this.section_bg})
      : super(key: key);

  int? id;
  String title;
  String sub_title;
  String bg;
  String section_bg;
  String? video_url;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  final HttpService httpService = HttpService();

  final Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            httpService.imaegURL + widget.section_bg,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xff4B1F4D).withOpacity(0.1),
            BlendMode.color,
          ),
        ),
      ),
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
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
            future: httpService.getQuery('section/${widget.id}'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "${widget.title}",
                          style: TextStyle(
                            fontFamily: "Berlin",
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.sub_title}",
                          style: TextStyle(
                            fontFamily: "Berlin",
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => GestureDetector(
                        // When the child is tapped, show a snackbar.
                        onTap: () {
                          setState(() {
                            if (snapshot.data![index].id == 16) {
                              Get.to(CustomCategoryPage());
                            } else if (snapshot.data![index].id == 19) {
                              Get.to(CustomCategoryPage2());
                            } else {
                              (snapshot.data![index].video_type!)
                                  ? Get.to(CategoryVideo(
                                      section: snapshot.data![index]))
                                  : helper.funcThatMakesAsyncCall(
                                      snapshot.data![index].quiz_id);
                            }
                          });
                        },
                        // The custom button
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          alignment: Alignment.center,
                          height: 170,
                          width: 261,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  httpService.imaegURL +
                                      snapshot.data![index].picture!),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
