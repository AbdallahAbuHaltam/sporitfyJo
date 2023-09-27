import 'package:firebase_auth/firebase_auth.dart';

class Auth{
   static final FirebaseAuth _auth =FirebaseAuth.instance;


   static Future<void> signInwithEmailAndPassword( {required String email, required String password})async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print('Login Failed ${e.toString()}');
    }
   }


   static Future<void> createUserWithEmailAndPassword({required String email, required String password})async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print('SignUp Failed ${e.toString()}');
    }
   }

   static Future logout()async{
    return await _auth.signOut();
   }

   static Future<String> userUidFromFirebase()async{
    String userUID  = _auth.currentUser!.uid;
    return userUID;
   }

   






   }