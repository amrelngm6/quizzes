import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const AlbumsApp());
}

Future<List> getHome(String title, String type ) async {
  final response = await http.post(
    Uri.parse('http://localhost/Medians/devoo_app/API/'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: {'_identifier':'API', '_type_params': jsonEncode(<String, dynamic>{
      'type': type,
    })},
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    // return Album.fromJson(jsonDecode(response.body).output.result);

    return jsonDecode(response.body)['output']['result']['center_section'];

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

Future<Album> createAlbum(String title, String type ) async {
  final response = await http.post(
    Uri.parse('http://localhost/Medians/devoo_app/API/'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: {'_identifier':'API', '_type_params': jsonEncode(<String, dynamic>{
      'type': type,
    })},
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    // return Album.fromJson(jsonDecode(response.body).output.result);

    return Album.fromObject(jsonDecode(response.body)['output']['result']['center_section']);

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
    String id;
    String title = '';
    String type = '';
    List<dynamic> center_section;


    Album({required this.id, required this.title, required this.type,required this.center_section});

    factory Album.fromObject(Map<String, dynamic> object)
    {
        return Album(
            id: object['id'],
            type: object['id'],
            title: object['id'],
            center_section: object['output']['result']['center_section'],
        );
    }

    factory Album.fromJson(Map<String, dynamic> json) 
    {
        return Album(
            id: json['id'],
            title: json['title'],
            type: json['type'],
            center_section: json['type'],
        );
    }
}

class AlbumsApp extends StatefulWidget {
  const AlbumsApp({Key? key}) : super(key: key);

  @override
  _AlbumsState createState() {
    return _AlbumsState();
  }
}

class _AlbumsState extends State<AlbumsApp> {
    final TextEditingController _controller = TextEditingController();
    List<dynamic> center_section = <String>['Hi'];
    Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text, 'home');
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          
            return ListView.builder(
                itemCount: (center_section.length > 5) ? 2 : center_section.length,
                itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        // onTap: _resetList(index),
                        child: new Container(
                        height: 50,
                        child: Center(child: Text('Entry ${center_section[index]}')),
                        )          
                    );
                }
            );


        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
