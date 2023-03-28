import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:Quizzes/terms.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sections.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    acceptTerms();
    super.initState();
  }

  final Sections sections = Sections(
      title: "Zgjidhni",
      sub_title: "grupmoshën tuaj",
      bg: "uploads/images/sections-bg.png");

  late SharedPreferences prefs1;

  late bool? accepted = true;

  acceptTerms() async {
    prefs1 = await SharedPreferences.getInstance();
    accepted = prefs1.getBool('terms_accepted');
  }

  @override
  Widget build(BuildContext context) {
    // return accepted! ? sections : Terms();
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Get.to(accepted == true ? sections : Terms());
      },
      // The custom button
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/bg1.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xff4B1F4D).withOpacity(0.1),
              BlendMode.color,
            ),
          ),
        ),
        child: AnimatedTextKit(
          onFinished: () => {
            setState(() => {Get.to(accepted == true ? sections : Terms())})
          },
          onTap: () => {Get.to(accepted == true ? sections : Terms())},
          animatedTexts: [
            TypewriterAnimatedText(
              "   ",
              textAlign: TextAlign.left,
              textStyle: TextStyle(
                fontFamily: "Berlin",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(milliseconds: 10),
          displayFullTextOnTap: false,
          stopPauseOnTap: true,
        ),
      ),
    );
  }
}
