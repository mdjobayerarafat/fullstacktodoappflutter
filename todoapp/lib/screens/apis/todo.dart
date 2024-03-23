import 'dart:developer';

import 'package:http/http.dart' as http;

class TodoRepo {
  Future<http.Response> getProducts() async {
    final url = Uri.parse('http://127.0.0.1:8000/todo');
    final response = await http.get(url);
    log(response.body);
    return response;
  }
}