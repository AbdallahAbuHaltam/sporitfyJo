import 'package:flutter/material.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: const TypeOfUser(),
    );
  }
}
