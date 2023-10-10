import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/login_register/login_register_models/owner/owner_model.dart';

import '../../../../shared_preference/shared_preference.dart';
import '../auth/firebase_auth.dart';

class LoginOwnerRegisterationRepository{


static Future<void> saveOwnerData({required String ownerUID})async{
    const String userType = 'owner';

    await SharedPreferencesManager.saveData(key: 'currentUID', value: ownerUID);
    await SharedPreferencesManager.saveData(key: 'currentType', value: userType);

  }

  static Future<String> getOwnerUID({required String key})async{
    String playerUid=await SharedPreferencesManager.getData(key: key);

    return playerUid;
  }

  static Future<bool> isOwnerDataUploadedToFirestore({required OwnerInfo ownerModel})async{
    String email = ownerModel.ownerEmail;
    String password = ownerModel.ownerPassword;
    String name = ownerModel.ownerName;
    String phoneNumber = ownerModel.ownerPhone;
     try {
      await AuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      String userUID =
          await AuthServices.fetchUserUIDFromFirebase(email: email, password: password);

      CollectionReference owner =
          FirebaseFirestore.instance.collection('owner');

      Map<String, dynamic> ownerDataForFirestore = {
        'Email': email,
        'Password':password,
        'Name': name,
        'Phone number': phoneNumber,
        'ownerUID': userUID,
      };
      await LoginOwnerRegisterationRepository.saveOwnerData(
          ownerUID: userUID);
       await owner.doc(userUID).set(ownerDataForFirestore);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static void removeData( String key) {
    SharedPreferencesManager.removeData(key:key);
  }

}

