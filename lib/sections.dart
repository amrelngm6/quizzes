import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Quizzes/QuizModel.dart';
import 'package:Quizzes/terms.dart';
import 'menu.dart';
import 'post_model.dart';
import 'client.dart';
import 'quiz-sections.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Sections extends StatefulWidget {
  /**
    // @var httpService is instance of  HttpService Object
    */
  final HttpService httpService = HttpService();

  Sections(
      {Key? key,
      required this.title,
      required this.sub_title,
      required this.bg})
      : super(key: key);

  String title;
  String sub_title;
  String bg;

  /*
    // initialize instance variables in the subclass
    */

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sections-bg.png'),
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
          flexibleSpace: menu(),
          primary: false,
        ),
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
            future: httpService.getSections('sections'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "${widget.title}",
                      style: TextStyle(
                        fontFamily: 'Berlin',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${widget.sub_title}",
                      style: TextStyle(
                        fontFamily: 'Berlin',
                        fontSize: 38,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      itemCount: 3,
                      itemBuilder: (context, index) => GestureDetector(
                        // When the child is tapped, show a snackbar.
                        onTap: () {
                          Get.to(snapshot.hasData
                              ? Section(
                                  id: snapshot.data![index].id!,
                                  title: snapshot.data![index].title!,
                                  sub_title: snapshot.data![index].sub_title!,
                                  bg: snapshot.data![index].picture!,
                                  section_bg: snapshot.data![index].section_bg!)
                              : Terms());

                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => snapshot.hasData
                          //         ? Section(
                          //             id: snapshot.data![index].id!,
                          //             title: snapshot.data![index].title!,
                          //             sub_title:
                          //                 snapshot.data![index].sub_title!,
                          //             bg: snapshot.data![index].picture!,
                          //             section_bg:
                          //                 snapshot.data![index].section_bg!)
                          //         : Terms(),
                          //   ),
                          // );
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
                    ))
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
