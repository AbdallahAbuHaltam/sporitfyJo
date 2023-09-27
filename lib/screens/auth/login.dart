import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final bool? isOwner;
  const LoginPage({Key? key, required this.isOwner}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}