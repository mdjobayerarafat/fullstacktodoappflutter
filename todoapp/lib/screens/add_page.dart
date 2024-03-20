import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  TextEditingController priorityControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children:  [
          TextField(
            controller: titleControler,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: descriptionControler,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
           const SizedBox(height: 20,),
          TextField(
            controller: priorityControler,
            decoration: const InputDecoration(hintText: 'priority'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){}, 
          child: const Text('Submit'),
          )
        ],
      ),
    );
  }
  void submitData(){
    //get data 
    final title = titleControler;
    final description = descriptionControler;
    final priority = priorityControler;
    final body = {
  "title": title,
  "description": description,
  "priority": priority,
  "complete": false,
};
//submit data to the server
final url = 'http://127.0.0.1:8000/todo';
final uri = Uri.parse(url);
http.post(uri);

  }
}