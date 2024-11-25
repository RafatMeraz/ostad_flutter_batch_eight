import 'package:flutter/material.dart';
import 'package:live_class_project/screens/add_new_todo_screen.dart';
import 'package:live_class_project/models/todo.dart';
import 'package:live_class_project/screens/update_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> listOfTodo = [];

  void _addTodo(Todo todo) {
    listOfTodo.add(todo);
    setState(() {});
  }

  void _deleteTodo(int index) {
    listOfTodo.removeAt(index);
    setState(() {});
  }

  void _updateTodo(int index, Todo todo) {
    listOfTodo[index] = todo;
    setState(() {});
  }

  void _updateTodoStatus(int index, TodoStatus status) {
    listOfTodo[index].status = status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Visibility(
        visible: listOfTodo.isNotEmpty,
        replacement: const Center(
          child: Text('Empty list'),
        ),
        child: ListView.builder(
          itemCount: listOfTodo.length,
          itemBuilder: (context, index) {
            Todo todo = listOfTodo[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              leading: Text(todo.status.name),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      _deleteTodo(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () => _showChangeStatusDialog(index),
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTodoScreen(
                      todoToBeUpdate: todo,
                      onUpdateTodo: (Todo updatedTodo) {
                        _updateTodo(index, updatedTodo);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTodoScreen(),
            ),
          );
          if (todo != null) {
            _addTodo(todo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showChangeStatusDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Idle'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.idle);
                },
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text('In Progress'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.inProgress);
                },
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text('Done'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.done);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTapUpdateStatusButton(int index, TodoStatus status) {
    _updateTodoStatus(index, status);
    Navigator.pop(context);
  }
}
