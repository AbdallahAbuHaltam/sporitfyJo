import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/add_edit/add_edit_model/main_playground_model.dart';
import 'package:sportify/data/add_edit/add_edit_model/sub_playground_model.dart';
import 'package:sportify/shared_preference/shared_preference.dart';

import '../../login_register/login_register_repo/owner_repo/owner_repository.dart';

class OwnerHomeRepository {
  // static Future<List<SubPlaygroundModel>>
  //     fetchAllPlaygroundFromFirestore() async {
  //   String currentOwnerUID =
  //       await LoginOwnerRegisterationRepository.getOwnerUID(key: 'currentUID');

  //   final QuerySnapshot<Map<String, dynamic>> documentsSnapshot =
  //       await FirebaseFirestore.instance
  //           .collection('playground')
  //           .where('ownerUID', isEqualTo: currentOwnerUID)
  //           .get();

  //   List<SubPlaygroundModel> playgrounds = [];

  //   return playgrounds;
  // }

  static Future<List<SubPlaygroundModel>> fetchSubPlaygrounds() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final CollectionReference mainPlaygroundCollection =
        firestore.collection('playground');
    String currentOwnerUID =
        await SharedPreferencesManager.getData(key: 'currentUID');

    final QuerySnapshot<Map<String, dynamic>> subPlaygroundSnapshot =
        await mainPlaygroundCollection
            .doc(currentOwnerUID)
            .collection('subPlaygroundCollection')
            .get();

    List<SubPlaygroundModel> playgroundModels =
        subPlaygroundSnapshot.docs.map((doc) {
      Map<String, dynamic> playgroundMap = doc.data();
      return SubPlaygroundModel(
          playgroundNumber: playgroundMap['playgroundNumber'] ?? '',
          playgroundType: playgroundMap['playgroundType'] ?? '',
          playgroundPrice: playgroundMap['playgroundPrice'] ?? '',
          playgroundSize: playgroundMap['playgroundSize'] ?? '',
          playgroundImage: playgroundMap['playgroundImage'] ?? '',
          playgroundAvailability: playgroundMap['playgroundAvailability'] ?? '',
          playgroundUID: playgroundMap['playgroundUID'] ?? '');
    }).toList();

    return playgroundModels;
  }

  static Future<bool> deletePlayground() async {
    final ownerUID = await SharedPreferencesManager.getData(key: 'currentUID');
    try {
      await FirebaseFirestore.instance
          .collection('playground')
          .doc(ownerUID)
          .delete();
      return true;
    } catch (e) {
      print('Error : $e');
      return false;
    }
  }
}
