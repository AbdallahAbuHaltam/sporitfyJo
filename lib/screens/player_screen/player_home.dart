import 'package:flutter/material.dart';

import '../../data/login_register/login_register_repo/auth/firebase_auth.dart';
import '../type_of_user/type_of_user_screen.dart';

class PlayerHome extends StatefulWidget {
  bool isOwner;
   PlayerHome({super.key, required  this.isOwner});

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      body: ElevatedButton(onPressed: ()=>{
        AuthServices.logout(),
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>TypeOfUser()))
      }, child: Text('data')),
    );
  }
}