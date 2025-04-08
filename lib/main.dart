import 'package:evaluation_app/screens/LoginScreen.dart';
import 'package:evaluation_app/screens/StudentDashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Start with the Login screen
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => StudentDashboard(),
      },
    );
  }
}
