import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/screens/add_page.dart';
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}
class _TodoListPageState extends State<TodoListPage> {
  
  @override
  void initState() {
   
    super.initState();
    fetchTodo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            final item = items[index] ;
          return ListTile(
            title: Text(item.toString()),
          );
        }),
        floatingActionButton: FloatingActionButton.extended
        (onPressed: navigateToAddPage,
         label: const Text('Add Todo'),
         ),
    );
  }
  void navigateToAddPage(){
    final route = MaterialPageRoute(
      builder: (context)=> const AddTodoPage(),
      );
      Navigator.push(context, route);
  }
void fetchTodo(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =
      Uri.https('http://127.0.0.1:8000/',  {'q': '{http}'} as String);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
   
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}