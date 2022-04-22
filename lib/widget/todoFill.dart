// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Formview extends StatelessWidget {
  final String heading;
  final String events;
  final ValueChanged<String> onChangedHeading;
  final ValueChanged<String> onChangedEvents;
  final VoidCallback onSavedTodo;
  final String endday;
  final ValueChanged<String> onChangedEndday;

  const Formview({
    Key key,
    this.heading = '',
    this.events = '',
    this.endday ='',
    @required this.onChangedHeading,
    @required this.onChangedEvents,
    @required this.onSavedTodo,
    @required this.onChangedEndday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeading(),
            SizedBox(height: 8),
            buildEvents(),
            SizedBox(height: 16),
            buildEndday(),
            SizedBox(height: 16),
            buildButton(),
          ],
        ),
      );

  Widget buildHeading() => TextFormField(
        maxLines: 1,
        initialValue: heading,
        onChanged: onChangedHeading,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildEvents() => TextFormField(
        maxLines: 3,
        initialValue: events,
        onChanged: onChangedEvents,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );
       Widget buildEndday() => TextFormField(
        maxLines: 1,
        initialValue: endday,
        onChanged: onChangedEndday,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter Estimated Deadline',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 68, 114, 196)),
          ),
          onPressed: onSavedTodo,
          child: Text(
            'Save',
            style: GoogleFonts.getFont('Fira Sans').copyWith(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
