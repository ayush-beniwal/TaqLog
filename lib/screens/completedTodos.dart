import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqloq/provider/todoprovider.dart';
import 'package:taqloq/widget/todo.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? Center(
            child:Text( ':( No completed tasks!' ,  style: GoogleFonts.getFont('Fira Sans').copyWith(color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30, fontWeight: FontWeight.bold),),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoBuildWidget(todo: todo);
            },
          );
  }
}