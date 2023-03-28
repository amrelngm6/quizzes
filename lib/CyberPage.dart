import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:Quizzes/sections.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dialog.dart';
import 'backBtn.dart';

class CyberPage extends StatefulWidget {
  const CyberPage({Key? key}) : super(key: key);

  @override
  State<CyberPage> createState() => _CyberPageState();
}

class _CyberPageState extends State<CyberPage> {
  final ScrollController _scrollController = ScrollController();

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
          onNotification: (scrollNotification) {
            setState(() {
              _read = true;
            });
            return true;
          },
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Roli i AMK në sigurinë kibernetike",
                              style: TextStyle(
                                fontFamily: "Berlin",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Agjencia e Mbrojtjes së Konsumatorit ka si mision parësor që konsumatorët të jenë individë më të mirëinformuar dhe vetëpërcaktues, në mënyrë që të zotërojnë njohuritë përkatëse mbi të drejtat e tyre në raport me tregun, ofrimin e shërbimeve publike, etj, përfshirë këtu dhe konsumatorët e moshave të reja. ",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Zhvillimet në teknologjinë e informacionit dhe komunikimit në dekadën e fundit kanë ndryshuar ndjeshëm jetën dhe kanë ofruar mundësi të reja për konsumatorët dhe bizneset",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Agjencia e Mbrojtjes së Konsumatorit konsideron se tregtia elektronike është bërë gjithnjë e më e rëndësishme për konsumatorët dhe se mundësitë që ofrohen duhet të shfrytëzohen për të ndihmuar në lehtësimin për zhvillimin dhe rritjen ekonomike e bazuar në teknologjitë e reja të rrjetit, me kompjutera, telefona celularë dhe pajisje të lidhura që promovojnë mirëqenien e konsumatorëve.",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Një numër në rritje i konsumatorëve kanë akses në internet dhe angazhohen në tregtinë elektronike, e cila siguron akses më të lehtë dhe më të shpejtë në produkte dhe shërbime. Aksesi në internet gjithashtu paraqet disa sfida për konsumatorët që ndryshojnë nga ato që hasen gjatë transaksioneve tregtare në njësitë fizike. Sfida të tilla kanë shkaktuar nevojën për të udhëzuar shpesh konsumatorët me kërkesat e veçanta të tregtisë elektronike. ",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Fëmijët sot janë konsumatorë të rregullt të internetit. Fëmijët e çdo moshe në ditët e sotme lidhen në çdo moment me familjarët apo miqtë e tyre online. Ata shkarkojnë aplikacione dhe kanë akses në përmbajtje. Gjithashtu fëmijët ndajnë në internet informacion se ku ndodhen, dhe çfarë janë duke bërë në atë moment. Ndajnë foto me njëri-tjetrin dhe familjarët e tyre, ndajnë video me përmbajtje nga më të ndryshmet, si dhe krijojnë dhe ndërtojnë profile të tyre në platforma të ndryshme në rrjete sociale. ",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Tashmë, komunikimi në internet është një mënyrë jetese, dhe jo një karakteristikë e jetesës luksoze. Megjithatë ajo vjen me disa rreziqe.",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sjellje e papërshtatshme",
                                      style: TextStyle(
                                        fontFamily: "Freig",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Bota në internet mund të ndihet anonime. Fëmijët ndonjëherë harrojnë se janë ende përgjegjës për veprimet e tyre.",
                                      style: TextStyle(
                                        fontFamily: "Freig",
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Kontakt i papërshtatshëm",
                                      style: TextStyle(
                                        fontFamily: "Freig",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Disa njerëz në internet kanë qëllime të këqija. Ata mund të jenë ngacmues, grabitqarë, hakerë ose mashtrues.",
                                      style: TextStyle(
                                        fontFamily: "Freig",
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Përmbajtje e papërshtatshme",
                                      style: TextStyle(
                                        fontFamily: "Freig",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Ju mund të shqetësoheni se fëmijët tuaj mund të gjejnë pornografi, dhunë ose gjuhë urrejtjeje në internet.",
                                      style: TextStyle(
                                        fontFamily: "Freig",
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Me qëllim edukimin dhe informimin e të drejtave të konsumatorit si dhe parandalimin dhe luftën kundër informacionit të paligjshëm, Agjensia e Mbrojtjes së Konsumatorit ka në fokus jo vetëm monitorimin, por edhe mbrojtjen e së drejtës së konsumatorit të komunitetit të Tiranës. ",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ndaj me anë të këtij aplikacioni Agjencia ka si synim të transmetojë drejtpërsëdrejti rolin e saj në sigurinë e jetës së qytetarëve të kryeqytetit.",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Teknologjia po zhvillohet vazhdimisht. Po kështu janë edhe rreziqet që lidhen me të. Ju mund t'i zvogëloni këto rreziqe duke folur me fëmijët tuaj për mënyrën se si ata komunikojnë - në internet dhe jashtë - dhe duke i inkurajuar ata të mendojnë në mënyrë kritike dhe të veprojnë në një mënyrë për të cilën mund të jenë krenarë.",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Qëllimi i AMK-së është të edukojë konsumatorët e të gjitha moshave për sigurinë e konsumit informatik për të nxitur vendimmarrje të informuar. Agjencia punon në drejtim të rritjes së ndërgjegjësimit të biznesit dhe konsumatorit për kuadrin e mbrojtjes së konsumatorit që zbatohet për aktivitetet e tyre në internet, duke përfshirë të drejtat dhe detyrimet e tyre përkatëse, në nivel vendor. Gjithashtu, AMK, kërkon të edukojë për të adresuar rrethanat e veçanta të konsumit online, duke përfshirë fëmijët dhe konsumatorët e pambrojtur ose të pafavorizuar.",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Aplikacioni pasqyron adresimin e çështjeve të reja të mbrojtjes dhe fuqizimit të konsumatorëve në konsumin online dhe ofron shembuj të situatave në të cilat mund të lindin probleme kur fëmijët aksesojnë pajisje celulare dhe blejnë produkte pa dijeninë ose pëlqimin e kujdestarëve të tyre.",
                              style: TextStyle(
                                fontFamily: "Freig",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
