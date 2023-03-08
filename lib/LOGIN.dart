import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
          color: Colors.pinkAccent.shade400,
          child: Text('Login',style: TextStyle(fontSize: 35),))),
    );
  }
}
