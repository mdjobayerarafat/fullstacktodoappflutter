class Todo {
  final int id;
  final String title;
  final String description;
  final int priority;
  bool complete;

  Todo({required this.id, required this.title, required this.description, required this.priority, this.complete = false});
}