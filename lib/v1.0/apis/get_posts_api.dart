import 'dart:convert';

import 'package:http/http.dart';

import '../model/list_of_post.dart';

class GetListOfPostAPI {
  static const String baseURL = 'https://jsonplaceholder.typicode.com';
  static const String apiURL = '/posts';
  Future<List<Posts>> getPosts() async {
    Response response = await get(Uri.parse(baseURL + apiURL));
    if (response.statusCode == 200) {
      print('above list parsing');
      List<dynamic> listOfPosts = jsonDecode(response.body);
      print('below list parsing');
      return listOfPosts.map((e) => Posts.fromMap(e)).toList();
    }
    return [];
  }
}
