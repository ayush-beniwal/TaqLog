import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:taqloq/model/todo.dart';
import 'package:taqloq/screens/edit.dart';
import 'package:taqloq/provider/todoprovider.dart';
import 'package:taqloq/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoBuildWidget extends StatelessWidget {
  final Todo todo;
  

  const TodoBuildWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Color.fromARGB(255, 105, 189, 108),
              onTap: () => editTodo(context, todo),
              caption: 'Change info',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Color.fromARGB(255, 215, 114, 107),
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo),
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  value: todo.isDone,
                  onChanged: (_) {
                    final provider =
                        Provider.of<TodosProvider>(context, listen: false);
                    final isDone = provider.toggleTodoStatus(todo);

                    Snackbar.showSnackBar(
                      context,
                      isDone
                          ? 'Good Work! Task complete'
                          : 'Task marked incomplete',
                    );
                  },
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.heading,
                        style: GoogleFonts.getFont('Fira Sans').copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text( 'Created on  '+
                        todo.createdTime.toString().split('.').first,
                        style: GoogleFonts.getFont('Fira Sans').copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                       
                      if (todo.events.isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            todo.events,
                            style: GoogleFonts.getFont('Jura')
                                .copyWith(fontSize: 20),
                          ),
                        ),
                         if (todo.endday.isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text('Deadline      '+
                            todo.endday,
                        style: GoogleFonts.getFont('Fira Sans').copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )
                    
                        
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Snackbar.showSnackBar(context, 'Task Deleted!');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
