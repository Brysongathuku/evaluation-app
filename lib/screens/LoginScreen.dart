import 'package:evaluation_app/screens/StudentDashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  void _handleLogin() {
    final registrationNumber = _registrationNumberController.text;
    final password = _passwordController.text;

    if (registrationNumber.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter both registration number and password'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _loading = true;
    });

    // Simulate a login process
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });

      // Navigate to the student dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StudentDashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E88E5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset(
              'images/meru-logo.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              'STUDENT LOGIN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Registration Number',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextField(
              controller: _registrationNumberController,
              decoration: InputDecoration(
                hintText: 'Registration number',
                fillColor: Color(0xFFF5F5F5),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                fillColor: Color(0xFFF5F5F5),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4CAF50),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                _loading ? 'Logging in...' : 'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
