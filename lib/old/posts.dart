// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'client.dart';
// import 'post_model.dart';


// class PostsPage extends StatefulWidget {
//     /*
//     // @var httpService is instance of  HttpService Object
//     */
//     final HttpService httpService = HttpService();

//     /*
//     // initialize instance variables in the subclass
//     */
//     PostsPage({Key? key }) : super(key: key);

//     /*
//     // Subclasses should override this method 
//     // to return a newly created instance of 
//     // their associated State subclass
//     */
//     @override
//     _PostsPageState createState() => _PostsPageState();
// }

// class _PostsPageState extends State<PostsPage> {
 
//     /*
//     // @var httpService is instance of  HttpService Object
//     */
//     final HttpService httpService = HttpService();
    
//     List<Post> posts = [Post.fromJson(jsonDecode('{}'))];

//     Post post = Post.fromJson(jsonDecode('{"id": 1, "picture": "","title": "", "body": ""}'));
    
//     List<int> top = <int>[];
    
//     List<int> bottom = <int>[0];

//     String email = "";


  
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     int pos = 0;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Posts"),
//       ),
//       // body: FutureBuilder(
//       //   future: httpService.getQuery('home'),
//       //   builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//       //     if (snapshot.hasData) {
            
//       //       return ListView.builder(
//       //         itemCount: snapshot.data!.length,
//       //         itemBuilder: (context, index) => ListTile(
//       //           title: Text(snapshot.data![index].title!),
//       //           leading: CircleAvatar(backgroundImage: NetworkImage(httpService.imaegURL + "" + snapshot.data![index].picture!)),
//       //           subtitle: Text(
//       //             snapshot.data![index].title!,
//       //             softWrap: false,
//       //             overflow: TextOverflow.ellipsis,
//       //           ),
//       //         ),
//       //       );
//       //     } else {
//       //       return Center(child: CircularProgressIndicator());
//       //     }
//       //   },
//       ),
//     );


//     // return Scaffold(
//     //   body: Padding(
//     //     padding: const EdgeInsets.symmetric(horizontal: 16),
//     //     child: InkWell(
//     //       onTap: () => () {},
//     //       child: Container(
//     //           width: 100,
//     //           height: 55,
//     //           alignment: Alignment.center,
//     //           child: AnimatedSwitcher(
//     //             transitionBuilder:
//     //                 (Widget child, Animation<double> animation) {
//     //               return ScaleTransition(
//     //                 scale: animation,
//     //                 child: child,
//     //               );
//     //             },
//     //             duration: Duration(milliseconds: 250),
//     //             child: pos == 3
//     //                 ? Text('Profile',
//     //                     style: TextStyle(
//     //                         color: Colors.blue,
//     //                         fontWeight: FontWeight.bold,
//     //                         fontSize: 18))
//     //                 : Icon(Icons.account_circle),
//     //           )),
//     //     ),
//     //   ),
//     // );

//     // return Scaffold(
//     //   body: Padding(
//     //     padding: const EdgeInsets.symmetric(horizontal: 16),
//     //     child: ListView(
//     //       children: [
//     //         SizedBox(height: screenHeight * .12),
//     //         Text(
//     //           "Welcome,",
//     //           style: TextStyle(
//     //             fontSize: 28,
//     //             fontWeight: FontWeight.bold,
//     //           ),
//     //         ),
//     //         SizedBox(height: screenHeight * .01),
//     //         Text(
//     //           "Sign in to continue!",
//     //           style: TextStyle(
//     //             fontSize: 18,
//     //             color: Colors.black.withOpacity(.6),
//     //           ),
//     //         ),
//     //         SizedBox(height: screenHeight * .01),
//     //         Text(
//     //           "Current user:  "+email ,
//     //           style: TextStyle(
//     //             fontSize: 18,
//     //             color: Colors.black.withOpacity(.6),
//     //           ),
//     //         ),
//     //         SizedBox(height: screenHeight * .12),
//     //         TextFormField(
//     //             decoration: const InputDecoration(
//     //                 hintText: 'Enter your email',
//     //             ),
//     //             onChanged: (value) {
//     //                 setState(() {email = value;});
//     //             },
//     //             validator: (String? value) 
//     //             {
//     //                 if (value == null || value.isEmpty)
//     //                 {
//     //                     return 'Please enter some text';
//     //                 }
//     //                 return null;
//     //             },
//     //         ),
//     //         Align(
//     //           alignment: Alignment.centerRight,
//     //           child: TextButton(
//     //             onPressed: () {},
//     //             child: Text(
//     //               "Forgot Password?",
//     //               style: TextStyle(
//     //                 color: Colors.black,
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         SizedBox(
//     //           height: screenHeight * .075,
//     //         ),
//     //         SizedBox(
//     //           height: screenHeight * .15,
//     //         ),
//     //         TextButton(
//     //           onPressed: () =>  () {},
//     //           child: RichText(
//     //             text: TextSpan(
//     //               text: "I'm a new user, ",
//     //               style: TextStyle(color: Colors.black),
//     //               children: [
//     //                 TextSpan(
//     //                   text: "Sign Up",
//     //                   style: TextStyle(
//     //                     color: Colors.blue,
//     //                     fontWeight: FontWeight.bold,
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }

