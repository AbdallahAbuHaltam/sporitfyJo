
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:sportify/data/login_register/login_register_repo/auth/firebase_auth.dart';
import 'package:sportify/shared_preference/shared_preference.dart';

class LoginPlayerRegisterationRepository{
  static Future<void> savePlayerData({required String playerUID})async{
    const String userType = 'player';

    await SharedPreferencesManager.saveData(key: 'currentUID', value: playerUID);
    await SharedPreferencesManager.saveData(key: 'currentType', value: userType);

  }

  static Future<String> getPlayerUID({required String key})async{
    String playerUid=await SharedPreferencesManager.getData(key: key);

    return playerUid;
  }

  static Future<bool> isPlayerDataUploadedToFirestore({required PlayerInfo playerModel})async{
    String email = playerModel.playerEmail;
    String password = playerModel.playerPassword;
    String name = playerModel.playerName;
    String gender=playerModel.playerGender;
    int age = playerModel.playerAge;
    int phoneNumber = playerModel.playerPhone;
     try {
      await AuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      String userUID =
          await AuthServices.fetchUserUIDFromFirebase(email: email, password: password);

      CollectionReference player =
          FirebaseFirestore.instance.collection('player');

      Map<String, dynamic> playerDataForFirestore = {
        'Email': email,
        'Password':password,
        'Name': name,
        'Age': age,
        'Gender': gender,
        'Phone number': phoneNumber,
        'playerUID': userUID,
      };
      await LoginPlayerRegisterationRepository.savePlayerData(
          playerUID: userUID);
      player.doc(userUID).set(playerDataForFirestore);
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
