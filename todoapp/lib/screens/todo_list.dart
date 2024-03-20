import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/add_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Todo {
  final int id;
  final String title;
  bool isCompleted;

  Todo({required this.id, required this.title, this.isCompleted = false});
}

class TodoListPage extends StatefulWidget {
 const TodoListPage({super.key});


 @override
 State<TodoListPage> createState() => _TodoListPageState();
}






class _TodoListPageState extends State<TodoListPage> {
 List items =[];
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
 //API GET
Future <void> fetchTodo() async {
 const url = 'http://127.0.0.1:8000/api/tasks/';
 final uri = Uri.parse(url);
 final response =  await http.get(uri);
if (response.statusCode == 200) {
 final json = jsonDecode(response.body)  ;
 final result = json['items'] as List ;
 setState(() {
   items= result;
 });
} else {


}
}
}