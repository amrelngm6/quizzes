// import 'package:flutter/material.dart';
// import 'video.dart';

// class Section2 extends StatefulWidget {
//   const Section2({Key? key}) : super(key: key);

//   @override
//   State<Section2> createState() => _Section2State();
// } 

// class _Section2State extends State<Section2> {


//     final VideoApp videoApp = VideoApp();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: const AssetImage("assets/section2-bg.png"),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(
//             const Color(0xff4B1F4D).withOpacity(0.1),
//             BlendMode.color,
//           ),
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         resizeToAvoidBottomInset:false,
//         body: Stack(
//           children: [
//             Positioned(
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     children: [
                        
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Container(
//                         height: 34,
//                         width: 40,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage("assets/menu-icon.png"),
//                               fit: BoxFit.fill,
//                             ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
              
//             ),
//             Positioned(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
                    
//                     const SizedBox(
//                       height: 150,
//                     ),
//                     Flexible(
//                       child: 
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Grupmosha",
//                               style: TextStyle(
//                                 fontFamily: "SFUIText",
//                                 fontSize: 40,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               "11-14 vjeç",
//                               style: TextStyle(
//                                 fontFamily: "SFUIText",
//                                 fontSize: 40,
//                                 color: Colors.white,
//                               ),
//                             )
//                           ],
//                         )
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           // When the child is tapped, show a snackbar.
//                           onTap: () {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute (
//                                       builder: (context) => videoApp,
//                                   ),
//                               );
//                           },
//                           // The custom button
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 190,
//                             width: 281,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/quiz-1.png"),
//                               ),
//                             ),
//                           ),
//                         )
//                       ]
//                     ),
                    
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           // When the child is tapped, show a snackbar.
//                           onTap: () {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute (
//                                       builder: (context) => videoApp,
//                                   ),
//                               );
//                           },
//                           // The custom button
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 190,
//                             width: 281,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/quiz-2.png"),
//                               ),
//                             ),
//                           ),
//                         )
//                       ]
//                     ),
                    
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
                      
//                       children: [
//                         GestureDetector(
//                           // When the child is tapped, show a snackbar.
//                           onTap: () {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute (
//                                       builder: (context) => videoApp,
//                                   ),
//                               );
//                           },
//                           // The custom button
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 190,
//                             width: 281,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/quiz-3.png"),
//                               ),
//                             ),
//                           ),
//                         )
//                       ]
//                     ),
                    
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
