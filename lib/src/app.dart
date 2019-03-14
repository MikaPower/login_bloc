import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Login me in',
      home: new Scaffold(
        body: new LoginScreen(),
      ),
    );
  }

}