import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqloq/model/todo.dart';
import 'package:taqloq/provider/todoprovider.dart';
import 'package:taqloq/widget/todoFill.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String heading;
  String events;
  String endday;

  @override
  void initState() {
    super.initState();

    heading = widget.todo.heading;
    events = widget.todo.events;
    endday = widget.todo.endday;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/navibar.png'),
            fit: BoxFit.cover,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 40,
              ),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Formview(
              heading: heading,
              events: events,
              onChangedHeading: (heading) =>
                  setState(() => this.heading = heading),
              onChangedEvents: (events) => setState(() => this.events = events),
              onChangedEndday: (endday) => setState(() => this.endday = endday),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, heading, events, endday);

      Navigator.of(context).pop();
    }
  }
}
