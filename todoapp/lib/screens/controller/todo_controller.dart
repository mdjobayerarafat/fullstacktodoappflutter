import 'dart:convert';

import '../apis/todo.dart';



import '../models/todo.dart';

class ProductController {
  final productRepo = TodoRepo();

  Future<List<Todo>> getProducts() async {
    final response = await productRepo.getProducts();
    final data = jsonDecode(response.body);
    List<Todo> todo = [];
    final productsJson = data;

    for(dynamic productJson in productsJson){
      todo.add(Todo.fromJson(productJson));
    }
    return todo;
  }
}