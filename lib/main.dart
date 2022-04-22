import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqloq/screens/default.dart';
import 'package:taqloq/provider/todoprovider.dart';

void main() => runApp(TaqLoq());

class TaqLoq extends StatelessWidget {
  static final String title = 'TaqLoq';

  const TaqLoq({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          home: HomePage(),
        ),
      );
}
