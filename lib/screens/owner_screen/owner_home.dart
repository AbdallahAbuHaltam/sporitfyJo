import 'package:flutter/material.dart';
import 'package:sportify/data/login_register/login_register_repo/auth/firebase_auth.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';

class OwnerHome extends StatefulWidget {
  bool isOwner;
   OwnerHome({super.key, required  this.isOwner});

  @override
  State<OwnerHome> createState() => _OwnerHomeState();
}

class _OwnerHomeState extends State<OwnerHome> {
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