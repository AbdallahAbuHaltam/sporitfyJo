import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signInwithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Login Failed ${e.toString()}');
    }
  }

  static Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('SignUp Failed ${e.toString()}');
    }
  }

  static Future logout() async {
    return await _auth.signOut();
  }



  static Future<String> fetchUserUIDFromFirebase(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String userUID = userCredential.user!.uid;

    return userUID;
  }
}
