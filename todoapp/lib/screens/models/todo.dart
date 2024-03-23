import 'dart:convert';

List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
    String title;
    int id;
    String description;
    bool complete;
    int priority;

    Todo({
        required this.title,
        required this.id,
        required this.description,
        required this.complete,
        required this.priority,
    });

    factory Todo.fromJson(Map<dynamic, dynamic> json) => Todo(
        title: json["title"],
        id: json["id"],
        description: json["description"],
        complete: json["complete"],
        priority: json["priority"],
    );

    Map<dynamic, dynamic> toJson() => {
        "title": title,
        "id": id,
        "description": description,
        "complete": complete,
        "priority": priority,
    };
}
