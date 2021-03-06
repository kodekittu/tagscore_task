import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'load_page.dart';
import 'signinPage.dart';
import 'signupPage.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.teal,
          brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/' : (context) => Load(),
        '/signin' : (context) => SigninPage(),
    //    '/home' : (context) => HomePage(),
        '/signup' : (context) => SignupPage(),
    //    '/temp' : (context) => TempScreen()
      },
    );
  }
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
      textColor: Colors.tealAccent
  );
}
