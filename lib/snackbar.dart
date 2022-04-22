import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Snackbar {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
}