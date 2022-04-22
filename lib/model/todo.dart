import 'package:flutter/cupertino.dart';


class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;

  String heading;
  String endday;

  String id;
  String events;
  bool isDone;

  Todo({
    @required this.createdTime,
     this.endday= '',
    @required this.heading,
    this.events = '',
    @required this.id,
    this.isDone = false,
  });
}
