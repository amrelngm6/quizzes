import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Quizzes/client.dart';
import 'package:Quizzes/sections.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dialog.dart';
import 'menu.dart';
import 'backBtn.dart';

class CustomCategoryPage extends StatefulWidget {
  const CustomCategoryPage({Key? key}) : super(key: key);

  @override
  State<CustomCategoryPage> createState() => _CustomCategoryPageState();
}

class _CustomCategoryPageState extends State<CustomCategoryPage> {
  final ScrollController _scrollController = ScrollController();
  late HttpService httpService = HttpService();
  late bool _read = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 100,
          toolbarHeight: 50, // Set this height
          automaticallyImplyLeading: false,
          flexibleSpace: backBtn(context),
          primary: false,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: NotificationListener<ScrollNotification>(
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Flexible(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Këshilla sesi t’i mbani fëmijët të sigurt gjatë komunikimit me video",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "1. Rregulli i të rriturve.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Prindërit, ose një i rritur tjetër i besuar, duhet të fillojnë dhe të përfundojnë gjithmonë të gjitha bisedat dhe konferencat me video.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "2.Mos bisedoni me njerëz të huaj",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Sigurohuni që fëmija juaj të bisedojë me video vetëm me dikë që e njihni dhe i besoni. Mos klikoni në asnjë link që sugjeron komunikim me video nga një burim i panjohur.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                                alignment: Alignment.topCenter,
                                width: 400,
                                image: AssetImage("assets/keshilla-1-1.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "3.Mbroni privatësinë tuaj.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Asnjëherë mos përfshini asnjë informacion personal identifikues (emri i plotë, numër identifikimi, data e lindjes, etj.) në profilin e fëmijës suaj.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                                alignment: Alignment.topCenter,
                                width: 400,
                                image: AssetImage("assets/keshilla-1-2.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "4. Tregoni kujdes me fotot.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ne rekomandojmë që të mos postoni kurrë foton e fëmijës tuaj në një profil të aplikacionit video. Në vend të kësaj, ju mund të bëni një avatar që ende i jep fëmijës tuaj një fytyrë, por mbron imazhin e tij nga grabitjet e mundshme në internet. ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "SHËNIM:",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mbikëqyrni gjithmonë përdorimin e aplikacioneve të avatarit nga fëmija juaj si Bitmoji ose Zmoji.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                                alignment: Alignment.topCenter,
                                width: 400,
                                image: AssetImage("assets/keshilla-1-3.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "5. Tregoni modelin më të mire të sjelljes.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              " Mësojini fëmijët të sillen siç do të silleshin në një klasë të vërtetë (ose edhe më mirë!). Çdo gjë që ata bëjnë mund të regjistrohet dhe ruhet, që do të thotë se mund të “jetojë” përgjithmonë në internet",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "6. Ruani menutë.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Kontrolloni dhe monitoroni të gjitha bisedat me video të fëmijës tuaj. ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "7. Mbajeni komunikimin në ambjent të hapur.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Kryeni biseda me video në një zonë qendrore publike të shtëpisë tuaj - jo në dhomat e gjumit.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "8. Përdorni kontrollet prindërore.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Përdorni gjithmonë cilësimet e privatësisë dhe kontrollit prindëror në pajisjet tuaja dhe në aplikacionet e videokonferencave për mbrojtje shtesë.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
