import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/add_page.dart';
import 'package:http/http.dart' as http;

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        ),
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
  //API GET
Future <void> fetchTodo(){
  final url = 'http://127.0.0.1:8000/';
  final uri = Uri.parse(url);
  final response = http.get(uri);
}

}