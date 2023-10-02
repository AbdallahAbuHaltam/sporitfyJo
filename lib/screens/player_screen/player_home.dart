import 'package:flutter/material.dart';

class PlayerHome extends StatefulWidget {
  bool isOwner;
   PlayerHome({super.key, required  this.isOwner});

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}