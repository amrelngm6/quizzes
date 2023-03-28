import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Quizzes/client.dart';
import 'package:Quizzes/sections.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dialog.dart';
import 'menu.dart';
import 'backBtn.dart';

class CustomCategoryPage2 extends StatefulWidget {
  const CustomCategoryPage2({Key? key}) : super(key: key);

  @override
  State<CustomCategoryPage2> createState() => _CustomCategoryPage2State();
}

class _CustomCategoryPage2State extends State<CustomCategoryPage2> {
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
                              "Rëndësia e Sigurisë Online",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "ÇFARË ËSHTË INTERNETI? ",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Interneti  revolucionalizoi  kompjuterat  dhe  botën e komunikimit si anjëherë tjetër më parë. Interneti ka filluar të zhvillohet në fund të viteve 1960 në Shtetet e Bashkuara të Amerikës nga një grup i studiuesish amerikanë fillimisht për nevoja ushtarake . Interneti është sistem global i rrjetave të ndërlidhura kompjuterike të cilat bëjnë shkëmbimin elektronik të të dhënave (tekst, muzikë video, fotografi, etj) nëpërmjet përdorimit kabllimit, fibrave optike, wireless dhe teknologjive të tjera. Këto informacione mund të lexohen, shikohen apo shkarkohen nga përdoruesit e tjerë. Pra interneti mundëson praktikisht komunikimin nga një pajisje kompjuterike në tjetrën. Disa nga shërbimet që interneti ofron aktualisht janë: ",
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
                              "Kërkimi në internet (WebBrowsing) – Ofron mundësi shfletimi në faqe të ndryshme nëpërmjet aplikacioneve kompjuterike të tilla si Google Chrome, Safari, Internet Explorer; ",
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
                              "Posta Elektronike (E-mail) - mundëson dërgimin e mesazheve të tipit tekst, foto, muzikë, video nga një person te një tjetër;",
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
                              "Bisedat Online (Chat Online) – përdoren për të komunikuar në mënyrë të menjëhershme me personat që janë në linjë online",
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
                              "Rrjetet sociale (prsh . Facebook, Twitter, Instagram )",
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
                              "Lojërat Online",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                                alignment: Alignment.topCenter,
                                width: 400,
                                image: AssetImage("assets/keshilla-2-1.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "RREZIQET NDAJ TË CILAVE JANË TË EKSPOZUAR FËMIJËT ",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Përpos lehtësirave dhe avantazheve që Interneti ofron, duhet thënë që duke pasur parasysh që janë miliona njerëz që përdorin internetin, atëherë edhe numri i keqpërdoruesve është i madh. Përdorimi i internetit nga fëmijët është rritur dhe në këtë aspekt, kërkime të ndryshme kanë gjetur se fëmijët që e përdorin internetin më shumë, kanë mundësi që të mësojnë më shumë dhe të ekspozohen ndaj rreziqeve më shumë. Edhe pse ka rreziqe në internet, fëmijët nuk mund të kufizohen nga përdorimi i internetit, sepse në ditët e sotme përdorimi i internetit është një pjesë natyrore e zhvillimit të fëmijëve. Edhe në Shqipëri me ritmet e shpejta të përhapjes së përdorimit të internetit edhe përdorimi i tij nga fëmijët është rritur por, në të njëjtën kohe edhe ekpsozimi ndaj rreziqeve është i madh. Sipas një studimi të bërë nga organizata World Vision në vitin 2014 rreziqet më kryesore të perceptuara nga fëmijët jane ato të lidhura me përmbajtjen, pasuar nga ato të lidhura me sjelljen dhe më pas ato të lidhura me kontaktet. Fëmijët duhet të kuptojnë se ata duhet t’u përmbahen disa rregullave në mënyrë që të jenë më të sigurt kur janë online. Prandaj, siguria në internet është shumë e rëndësishme dhe ne duhet të mësohemi që të mbrohemi nga keqbërësit kur përdorim internetin. Më poshtë janë listuar disa nga rreziqet më të hasura online: ",
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
                                image: AssetImage("assets/keshilla-2-2.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Përmbajtja e paligjshme dhe e papërshtatshme.",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Interneti ofron burime të ndryshme informacioni dhe argëtimi. Burimet janë nga ato më të besueshmet , të licensuarat deri te faqe pirate të paliçensuara. Jo të gjitha përmbajtjet që janë në internet janë të përshtatshme për të gjitha moshat. Disa nuk rekomandohen të shikohen nga fëmijët e moshave nën 18 vjeç. Kjo për arsye se fëmijët e kësaj moshe ende nuk janë të gatshëm për të parë këto informacione pasi në të kundërt mund të ndikojë negativisht në zhvillimin e tyre. Lehtësia për të lexuar këto përmbajtje tregon se fëmijët janë të ekspozuar ndaj risqeve.",
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
                              "Nëse shikoni pamje me përmbajtje të papërshtatshme, jeni të ekspozuar ndaj disa rreziqeve:",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ndikon negativisht te zhvillimi psikologjik dhe mendor i fëmijës; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Nxit dhe provokon dëshira seksuale; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Provokon sjellje të papërshtatshme seksuale; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Keqedukim për çështjet e seksualitetit;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mund të shkaktojë ose nxisë përdhunimin",
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
                                image: AssetImage("assets/keshilla-2-3.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Çfarë mund të bëni ju ? ",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Përpiquni të respektoni kufizimet e moshës; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Kuptoni që jo çdo informacion që mund të gjendet në internet është i besueshëm; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Kuptoni që materialet që nuk janë të dedikuara për ju nuk duhet të shikohen nga mosha juaj;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mos jepni të dhëna personale; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Bisedoni me prindërit tuaj për të identifikuar bashkarisht faqet dhe burimet serioze të informacionit; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mos shkarkoni dhe dërgoni foto dhe video me përmbajtje të papërshtatshme; ",
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
                                image: AssetImage("assets/keshilla-2-4.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "2. Cyberbullying (Ngacmimi online)",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '“Cyberbullying" është kur një fëmijë apo adoleshent është kërcënuar, keqtrajtuar, poshtëruar, tallur, ofenduar ose është vënë në shënjestër në mënyrë të qëllimshme nga një fëmijë ose adoleshent tjetër duke shfrytëzuar përdorimin e internetit, teknologjitë interaktive dhe digjitale ose telefonat celularë. Cyberbullying zakonisht nuk është një komunikim një herë, mund te ndodhë në vazhdimësi. Ka shumë forma të shfaqjes së cyberbullying, mirëpo këto janë më të shpeshtat: ',
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              " - E-maile, mesazhe kërcënuese , fyese,tallëse, paragjykuese etj;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              " - Postimet tallëse ose fyese në rrjetet sociale;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              " - Etiketime (pseudonime) fyese nëpërmjet postimeve në rrjete sociale ;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              " - Postim i fotografive, videove të personave të tjerë pa miratimin e tyre, me qëllim tallës dhe fyes; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(height: 5),
                            Text(
                              " - Krijimi i profileve fallse në rrjetet sociale në emër të një individi tjetër me qëllim talljeje apo fyerjeje;",
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
                                image: AssetImage("assets/keshilla-2-5.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Çfarë mund të bëni?",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mos iu përgjigj mesazheve cyberbullying; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ruani mesazhet në orën dhe datën që i keni marrë si dëshmi në rast raportimi. Ruaj Print Screen-et, e-mailet, tekstet e mesazheve; ",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Bllokoni aksesin e atyre personave me të cilët nuk dëshironi të komunikoni; § Nëse keni pranuar mesazhe me përmbajtje fyese apo kërcënuese, nuk është faji juaj. Tregojuni menjëherë prindërve apo një të rrituri të besuar.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Bisedoni me një të rritur,familjar, të afërm për ngacmimet që ke pasur. Ndihmojini prindërit tuaj të kuptojnë situatën dhe shqetësimet që ju po kaloni",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mundohuni ta identifikoni personin i cili ju ngacmon",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mos u hakmerrni ndaj atyre që ju ngacmojnë;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Kërkoni ndihmë. Bisedoje me mësuesin tënd, psikologun e shkollës etj;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Heshtja, kur të tjerët janë duke u lënduar, nuk është e pranueshme. Që të vazhdojnë t’ju mundojnë apo t’ju vënë në siklet, “cyberbullying” nuk do të ndalet;",
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
                                image: AssetImage("assets/keshilla-2-6.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Lojërat Online",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Interneti sot mundëson faqe të ndryshme të cilat ofrojnë argëtim nëpërmjet lojërave të tyre kompjuterike. Ju mund të luani me kompjuter, telefona celulare në rrjete sociale etj. Nëse luani lojëra në internet, jeni të ekspozuar ndaj disa rreziqeve:",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ka persona të rritur, që përfshihen në lojë bashkë me ju. Ata shpesh here shtiren sikur janë fëmijë për të krijuar shoqëri. Por qëllimi i tyre mund të mos jetë i mirë. Ata mund të duan të fitojnë besimin tuaj me qëllim që mund t’iu bëjnë keq më vonë.",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Gjatë lojës shpeshherë shfaqen (faqe interneti të cilat hapen vetë) në ekranin tuaj. Përgjithësisht janë reklama, por mund të këtë edhe faqe me përmbajtje të papërshtatshme. Hapja e tyre automatikisht rezikon kompjuterin që po përdorni duke qënë se ato mund të jenë burim virusesh të cilat dëmtojnë gjendjen e tij",
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
                                image: AssetImage("assets/keshilla-2-7.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Çfarë duhet të bëni?",
                              style: TextStyle(
                                  fontFamily: "SFUIText",
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 156, 44, 176),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Përdorni pseudonime gjatë lojës, në mënyrë që të mos zbulohet identiteti juaj. Mos i ndani informacionet tuaja personale (identitetin, adresen, numrin e telefonit, foto personale etj) me njerëz të panjohur;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Rekomandohet të pyesni prindërit para se të filloni të luani ndonjë lojë të re. Merrni miratimin e tyre paraprakisht. Ata ju ndihmojnë të zgjedhni lojërat më të sigurta;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Informohuni për varësine psikoligike që mund të krijojë përdorimi i tepërt i saj;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mos e lejoni veten të bëhesh i varur pas lojërave në internet, sepse kjo mund të kushtojë shumë në shëndet, mësime dhe financiarisht;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mbroni llogaritnë tënde kur e hapni duke i vendosur një fjalëkalim të fortë. Fjalëkalimet (password) e forta kanë së paku tetë karaktere dhe përfshijnë një kombinim të shkronjave të mëdha, numrave, shkronjave të vogla, dhe simboleve;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ftoni prindërit të bashkohën në lojë. Në këtë mënyrë ata mund të vlersojnë nga afër lojën;",
                              style: TextStyle(
                                fontFamily: "SFUIText",
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Mos përdorni lojëra të pa licencuara (lojëra pirate)",
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
