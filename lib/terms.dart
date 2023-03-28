import 'package:flutter/material.dart';
import 'package:Quizzes/sections.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';
import 'backBtn.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final ScrollController _scrollController = ScrollController();

  late bool _read = false;

  final Sections sections = Sections(
      title: "Zgjidhni",
      sub_title: "grupmoshën tuaj",
      bg: "uploads/images/sections-bg.png");

  late bool? accepted;
  late Future<bool> accept;

  late SharedPreferences prefs1;

  acceptTerms() async {
    prefs1 = await SharedPreferences.getInstance();
    accept = prefs1.setBool('terms_accepted', true);
    accepted = prefs1.getBool('terms_accepted');
    if (accepted == true) {
      Get.to(sections);
    }
  }

  @override
  void initState() {
    accepted = false;
    super.initState();
  }

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
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            setState(() {
              _read = true;
            });
            return true;
          },
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // AnimatedTextKit(
                      //   animatedTexts: [
                      //     TypewriterAnimatedText(
                      //       'Termat dhe Kushtet',
                      //       textStyle: const TextStyle(
                      //         fontSize: 32.0,
                      //         color: Colors.black87,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //       speed: const Duration(milliseconds: 100),
                      //     ),
                      //   ],

                      //   totalRepeatCount: 1,
                      //   pause: const Duration(milliseconds: 10),
                      //   displayFullTextOnTap: true,
                      //   stopPauseOnTap: true,
                      // ),

                      Flexible(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image(
                              image: AssetImage("assets/logo.png"),
                              width: 200,
                            )),
                            Text(
                              "Termat dhe Kushtet",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ju lutemi, lexoni me kujdes këto terma dhe kushte përpara se të përdorni aplikacionin “Të Jesh i Sigurt online” i operuar nga Agjencia e Mbrojtjes së Konsumatorit [“AMK”].",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kushtet e përdorimit",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Duke përdorur këtë aplikacion, ju vërtetoni se e keni lexuar dhe rishikuar këtë rregullore të quajtur [“Marrëveshje”] dhe se jeni dakord të pajtoheni me kushtet e saj. Nëse nuk dëshironi të jeni të detyruar nga kushtet e kësaj Marrëveshjeje, ju këshillojmë të ndaloni përdorimin e aplikacionit në përputhje me rrethanat. AMK u lejon përdorimin dhe aksesin e këtij aplikacioni, produkteve dhe shërbimeve të tij vetëm atyre që kanë pranuar kushtet e tij.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kufizimi i moshës",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Duhet të jeni 1) të paktën 18* vjeç ose 2) të paktën 7 vjeç dhe të keni pëlqimin dhe mbikëqyrjen e prindit ose kujdestarit ligjor për të përdorur këtë aplikacion dhe/ose për të marrë pjesë në Programin Edukativ “ Të jesh i sigurt online ”. Duke përdorur këtë aplikacion dhe/ose duke marrë pjesë në Programet “ Të jesh i sigurt online ”, ju jeni dakord me termat dhe kushtet e Marrëveshjes dhe garantoni dhe tregoni se jeni të paktën 18* vjeç ose të paktën 7 dhe keni pëlqimin nga dhe të jeni nën mbikëqyrjen në përdorim të një prindi ose kujdestari ligjor.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Ju nuk mund të përdorni aplikacionin ose të merrni pjesë në Programet “Të jesh i sigurt online” 1) nëse nuk jeni dakord me termat dhe kushtet e Marrëveshjes; ose 2) nëse nuk jeni të paktën 18* ose të paktën 7 vjeç dhe keni pëlqimin dhe mbikëqyrjen e prindit ose kujdestarit ligjor. Përmbajtja e aplikacionit është e përshtatshme për lexim për këdo nën 18 vjeç.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Përdorimi i synuar i aplikacionit është për këdo që prodhon ose mëson rreth materialeve të sigurisë në internet. Duke përdorur aplikacionin, ju gjithashtu përfaqësoni dhe garantoni se keni të drejtën, autoritetin dhe kapacitetin për të hyrë në këtë Marrëveshje. ",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kini parasysh që personat nën moshën 18 vjeç nuk mund të lidhin marrëveshje ligjore. Aplikacioni është i disponueshëm për fëmijët dhe të rriturit në Tiranë dhe qytete të tjera të Shqipërisë.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Të gjitha informacionet dhe udhëzimet në këtë aplikacion shërbejnë për qëllime informuese dhe edukuese.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Ligji në fuqi",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Duke përdorur këtë faqe interneti, ju pranoni që ligjet e Shqipërisë dhe çdo VKB pa marrë parasysh parimet e ligjeve të konfliktit, do të rregullojnë këto terma dhe kushte, ose çdo mosmarrëveshje të çdo lloji që mund të lindë midis AMK dhe jush, ose partnerët dhe bashkëpunëtorët e saj",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Mosmarrëveshjet",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Çdo mosmarrëveshje që lidhet në çfarëdo mënyre me përdorimin tuaj të këtij aplikacioni do të arbitrohet nga Gjykatat e Shqipërisë dhe ju pranoni juridiksionin e sistemit gjyqësor të vendit.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kufizimi i përgjegjësisë së përdorimit",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "FreigBold",
                                fontSize: 22,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "AMK nuk është përgjegjëse për asnjë dëmtim që mund t'ju ndodhë si rezultat i keqpërdorimit të aplikacionit tonë.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "AMK rezervon të drejtën për të modifikuar dhe ndryshuar këtë Marrëveshje në çdo kohë. Ne do t'i njoftojmë përdoruesit tanë për këto ndryshime përmes përditësimeve në faqen e Termave dhe Kushteve. Kjo Marrëveshje është një mirëkuptim i menjëhershëm ndërmjet AMK-së dhe përdoruesit, dhe kjo mbizotëron dhe zëvendëson të gjitha marrëveshjet e mëparshme në lidhje me përdorimin e këtij aplikacioni.",
                              style: TextStyle(
                                fontFamily: "FreigBold",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            accepted == true
                                ? Center()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: !_read
                                        ? []
                                        : [
                                            GestureDetector(
                                              // When the child is tapped, show a snackbar.
                                              onTap: () {},
                                              // The custom button
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/no.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              // When the child is tapped, show a snackbar.
                                              onTap: acceptTerms,
                                              // The custom button
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/confirm.png"),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]),
                          ],
                        ),
                      )),

                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 30,
                      ),
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
