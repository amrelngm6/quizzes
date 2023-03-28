// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'video.dart';
// import 'post_model.dart';
// import 'client.dart';

// class Section1 extends StatefulWidget {

//     /**
//     // @var httpService is instance of  HttpService Object
//     */
//     final HttpService httpService = HttpService();


//     Section1({ Key ? key, required this.title, required this.sub_title, required this.bg, required this.section_bg }): super(key: key);

//     String title;
//     String sub_title;
//     String bg;
//     String section_bg;

//     @override
//     State < Section1 > createState() => _Section1State();
// }

// class _Section1State extends State < Section1 > {

//     final HttpService httpService = HttpService();

//     final VideoApp videoApp = VideoApp();

//     @override
//     Widget build(BuildContext context) {
//         return Container(
//             padding: EdgeInsets.symmetric(vertical: 80),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(httpService.imaegURL + '${widget.section_bg}'),
//                         fit: BoxFit.cover,
//                         colorFilter: ColorFilter.mode(
//                             const Color(0xff4B1F4D).withOpacity(0.1),
//                                 BlendMode.color,
//                         ),
//                 ),
//             ),

//             child:
//             Scaffold(
//                 backgroundColor: Colors.transparent,
//                 resizeToAvoidBottomInset: false,
//                 body:

//                 FutureBuilder(
//                     future: httpService.getQuery('home/get'),
//                     builder: (BuildContext context, AsyncSnapshot < List < Post >> snapshot) {
//                         if (snapshot.hasData) {

//                             return  Stack(
//                               alignment: Alignment.topCenter,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text(
//                                   "${widget.title}",
//                                   style: TextStyle(
//                                     fontFamily: "SFUIText",
//                                     fontSize: 40,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   "${widget.sub_title}",
//                                   style: TextStyle(
//                                     fontFamily: "SFUIText",
//                                     fontSize: 40,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                   ],
//                                 ),
//                                 ListView.builder(
//                                   padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
//                                   itemCount: 3,
//                                   itemBuilder: (context, index) =>

//                                     GestureDetector(
//                                       // When the child is tapped, show a snackbar.
//                                       onTap: () {
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) => videoApp,
//                                               ),
//                                           );
//                                       },
//                                       // The custom button
//                                       child: Container(
//                                           margin: EdgeInsets.symmetric(vertical: 5),
//                                           alignment: Alignment.center,
//                                           height: 190,
//                                           width: 281,
//                                           decoration: BoxDecoration(
//                                               image: DecorationImage(
//                                                   image: NetworkImage(httpService.imaegURL + snapshot.data![index].picture!),
//                                               ),
//                                           ),
//                                       ),
//                                   ),
//                               )
//                               ],
//                             );

//                         } else {
//                             return Center(child: CircularProgressIndicator());
//                         }
//                     }
//                 ),
//             ),
//         );
//     }
// }