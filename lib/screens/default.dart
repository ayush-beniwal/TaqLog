import 'package:flutter/material.dart';
import 'package:taqloq/main.dart';
import 'package:taqloq/widget/addNewTodo.dart';
import 'package:taqloq/widget/todo.dart';
import 'package:taqloq/widget/todoFill.dart';
import 'package:taqloq/widget/todoList.dart';
import 'completedTodos.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Listview(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar( flexibleSpace: Image(
          image: AssetImage('assets/sample.png'),
          fit: BoxFit.cover,
        ),
      
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedFontSize: 20,
        selectedFontSize: 20,
        backgroundColor: Color.fromARGB(255, 68, 114, 196),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            
            icon: Icon( Icons.fact_check_outlined),
            label: 'Todos',
            backgroundColor: Color.fromARGB(255, 68, 114, 196),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
            backgroundColor: Color.fromARGB(255, 105, 141, 205),
          ),
        ],
      ),
      body: Container( 
  constraints: BoxConstraints.expand(),
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/todoimagebg.jpg"), 
        fit: BoxFit.cover),
  ),
      child: tabs[selectedIndex],),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => Addnew(),
          barrierDismissible: false,
        ),
       icon: Icon(Icons.add,color: Colors.white),
       label: Text( 'Todo' , style: GoogleFonts.getFont('Caveat').copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
 
      ),
    );
  }
}
