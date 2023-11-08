import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:sportify/shared_preference/shared_preference.dart';

import '../../login_register/login_register_models/owner/owner_model.dart';

class ProfileRepository {
  static Future<PlayerInfo> customerInformation() async {
    String currentUserKey =
        await SharedPreferencesManager.getData(key: 'currentUID');
    FirebaseFirestore data = FirebaseFirestore.instance;

    DocumentSnapshot<Map<String, dynamic>> playerMap =
        await data.collection('player').doc(currentUserKey).get();
    PlayerInfo playerInformation = PlayerInfo(
        playerEmail: playerMap['Email'],
        playerPassword: playerMap['Password'],
        playerUUId: playerMap['playerUID'],
        playerName: playerMap['Name'],
        playerGender: playerMap['Gender'],
        playerPhone: playerMap['Phone number'],
        playerAge: playerMap['Age']);
    return playerInformation;
  }

  static Future<OwnerInfo> ownerInformation() async {
    String currentUserKey =
        await SharedPreferencesManager.getData(key: 'currentUID');
    FirebaseFirestore data = FirebaseFirestore.instance;

    DocumentSnapshot<Map<String, dynamic>> ownerMap =
        await data.collection('owner').doc(currentUserKey).get();
    OwnerInfo ownerInformation = OwnerInfo(
        ownerEmail: ownerMap['Email'],
        ownerPassword: ownerMap['Password'],
        playgroundName: ownerMap['Name'],
        ownerUUId: ownerMap['ownerUID'],
        ownerPhone: ownerMap['Phone number']);
    return ownerInformation;
  }

  static Future<bool> updateNameOfUser(String newName, bool isOwner) async {
    String userUID = await SharedPreferencesManager.getData(key: 'currentUID');

    if (isOwner) {
      try {
        await FirebaseFirestore.instance
            .collection('owner')
            .doc(userUID)
            .update({'Name': newName});
        print('Document updated successfully');
        return true;
      } catch (error) {
        print('Error updating document: $error');
        return false;
      }
    } else {
      try {
        await FirebaseFirestore.instance
            .collection('player')
            .doc(userUID)
            .update({'Name': newName});
        print('Document updated successfully');
        return true;
      } catch (error) {
        print('Error updating document: $error');
        return false;
      }
    }
  }
}
