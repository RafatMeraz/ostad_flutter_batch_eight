import 'package:live_class_project/models/todo.dart';

class TodoManager {
  final List<Todo> _listOfTodo = [];

  List<Todo> get todoList => _listOfTodo;

  void addTodo(Todo todo) {
    _listOfTodo.add(todo);
  }

  void deleteTodo(int index) {
    _listOfTodo.removeAt(index);
  }

  void updateTodo(int index, Todo todo) {
    _listOfTodo[index] = todo;
  }

  void updateTodoStatus(int index, TodoStatus status) {
    _listOfTodo[index].status = status;
  }
}
