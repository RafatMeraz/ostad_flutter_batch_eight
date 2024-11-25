class Todo {
  String title;
  String description;
  TodoStatus status;

  Todo(
      {required this.title,
      required this.description,
      this.status = TodoStatus.idle});
}

enum TodoStatus { idle, inProgress, done }
