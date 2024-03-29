import 'dart:ffi';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'quiz-sections.dart';
import 'CyberPage.dart';
import 'terms.dart';

class PlaceholderDialog extends StatelessWidget {
  const PlaceholderDialog({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // icon: icon,
          title: title == null ? null : icon,
          titleTextStyle: TextStyle(fontSize: 22),
          content: message == null
              ? null
              : Container(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => Get.to(Section(
                          id: 1,
                          title: "Grupmosha",
                          sub_title: "8-10 vjeç",
                          bg: "uploads/images/section1-bg.png",
                          section_bg: "uploads/images/section1-bg.png")),
                      child: Text(
                        "Grupmosha 8-10 vjeç",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontFamily: "Berlin"),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () => Get.to(
                        Section(
                            id: 2,
                            title: "Grupmosha",
                            sub_title: "11-14 vjeç",
                            bg: "uploads/images/section2-bg.png",
                            section_bg: "uploads/images/section2-bg.png"),
                      ),
                      child: Text(
                        "Grupmosha 11-14 vjeç",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () => Get.to(
                        Section(
                            id: 3,
                            title: "Grupmosha",
                            sub_title: "15-18 vjeç",
                            bg: "uploads/images/section2-bg.png",
                            section_bg: "uploads/images/section2-bg.png"),
                      ),
                      child: Text(
                        "Grupmosha 15-18 vjeç",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () => Get.to(Terms()),
                      child: Text(
                        "Termat dhe Kushtet",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () => Get.to(CyberPage()),
                      child: Text(
                        "Roli i AMK-së",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )),
          contentTextStyle: TextStyle(fontSize: 22),
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowButtonSpacing: 8.0,
          actions: actions,
        )
      ],
    );
  }
}
