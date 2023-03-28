import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Quizzes/quiz.dart';
import 'post_model.dart';
import 'QuizModel.dart';
// import 'OutputObject.dart';

class HttpService {
  final String imaegURL = "https://quiz.medianssolutions.com/";

  String _url = "https://quiz.medianssolutions.com/";

  final String postsURL = "https://quiz.medianssolutions.com/api/";

  Future<List<Post>> getQuery(String type) async {
    http.Response res = await http.get(Uri.parse(postsURL + type));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve data.";
    }
  }

  Future<List<Category>> getSections(String type) async {
    http.Response res = await http.get(Uri.parse(postsURL + type));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(type);

      List<Category> categories = body
          .map(
            (dynamic item) => Category.fromJson(item),
          )
          .toList();

      return categories;
    } else {
      throw "Unable to retrieve data.";
    }
  }

  Future<List<Post>> postQuery(String type) async {
    http.Response res = await http.post(
      Uri.parse(postsURL),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: {
        '_identifier': 'new_api',
        'token': 'visitor',
        '_type_params': jsonEncode(<String, dynamic>{
          'type': type,
        })
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body.substring(1));

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve data.";
    }
  }

  Future<QuizModel> getQuiz(String type) async {
    http.Response res = await http.get(Uri.parse(postsURL + type));

    if (res.statusCode == 200 &&
        res.body != "[]" &&
        res.body != '' &&
        res.body != null) {
      dynamic body = jsonDecode(res.body);
      QuizModel quiz = QuizModel.fromJson(body);

      return quiz;
    } else {
      print(postsURL + type);
      throw "Unable to retrieve data.";
    }
  }
}
