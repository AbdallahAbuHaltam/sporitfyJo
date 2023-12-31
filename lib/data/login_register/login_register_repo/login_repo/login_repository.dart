

import 'package:sportify/data/login_register/login_register_repo/auth/firebase_auth.dart';

import '../../../../shared_preference/shared_preference.dart';

class LoginRepository{
  static Future<bool> isLoginSuccessful({required String email, required String password})async{
    try{
      String userUID =
          await AuthServices.fetchUserUIDFromFirebase(email: email, password: password);

       await SharedPreferencesManager.saveData(
         key: 'currentUID',
         value: userUID,
       );

      AuthServices.signInwithEmailAndPassword(email: email, password: password);
      return true;
    }
    catch(e){
      print('Error login failed ${e.toString()}');
      return false;
    }
  }
}