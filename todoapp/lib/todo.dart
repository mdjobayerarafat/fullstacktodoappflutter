import 'package:flutter/material.dart';

import 'screens/controller/todo_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),

      body: FutureBuilder(
        future: ProductController().getProducts(),
        builder: (context, snapshot) {

          snapshot.data;

          if(snapshot.data == null){
            return const Center(child: CircularProgressIndicator(),);
          }

          final todo = snapshot.data!;

          return ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                  
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(todo[index].title, style: const TextStyle(fontSize: 20),),
                    Text(todo[index].description),
                    Text(todo[index].priority),
                     //Text(todo[index].priority as String ),
                    
                    
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}