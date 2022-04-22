import 'package:flutter/cupertino.dart';
import 'package:taqloq/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      heading: 'Welcome to TaqLog',
      events: '''TaqLog is a flutter based task app, which allows you to create todos.''',
      endday: '',
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      heading: 'How to use',
      events: '''Tap on +todo to make a new item, then you can fill the prompted fields, once done click on the checkbox to move it to finished todos.''',
      endday: '23/04/2022',
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      heading: 'Example todo',
      events: ' You can also edit or delete todos by swiping left or right on a particular todo',
      endday: '23/04/2022',
      id: '',
    ),
   
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String heading, String events, String endday) {
    todo.heading = heading;
    todo.events = events;
    todo.endday = endday;

    notifyListeners();
  }
}
