import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqloq/model/todo.dart';
import 'package:taqloq/provider/todoprovider.dart';
import 'package:taqloq/widget/todoFill.dart';
import 'package:google_fonts/google_fonts.dart';

class Addnew extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<Addnew> {
  final _formKey = GlobalKey<FormState>();
  String heading = '';
  String events= '';
  String endday = '';
  DateTime _selectedDate;
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Todo item',
                style: GoogleFonts.getFont('Fira Sans').copyWith(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Formview(
                onChangedHeading: (heading) => setState(() => this.heading = heading),
                onChangedEvents: (events) =>
                    setState(() => this.events = events),
                onChangedEndday: (endday)=> setState(()=> this.endday = endday),
                onSavedTodo: addTodo,
              ),
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
       heading: heading,
        events: events,
        endday: endday,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
