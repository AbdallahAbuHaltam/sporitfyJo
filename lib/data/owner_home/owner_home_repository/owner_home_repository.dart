import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';

import '../../login_register/login_register_repo/owner_repo/owner_repository.dart';

class OwnerHomeRepository {
  static Future<List<PlaygroundInfo>> fetchAllPlaygroundFromFirestore() async {
    String currentOwnerUID =
        await LoginOwnerRegisterationRepository.getOwnerUID(key: 'currentUID');
    final QuerySnapshot<Map<String, dynamic>> documentsSnapshot =
        await FirebaseFirestore.instance
            .collection('playground')
            .where('ownerUID', isEqualTo: currentOwnerUID)
            .get();

    List<PlaygroundInfo> playgroundModels = documentsSnapshot.docs.map((doc) {
      Map<String, dynamic> playgroundData = doc.data();
      return PlaygroundInfo(
          playgroundName: playgroundData['playgroundName'],
          playgroundType: playgroundData['playgroundType'],
          playgroundPrice: playgroundData['playgroundPrice'],
          playgroundSize: playgroundData['playgroundSize'],
          playgroundImage: playgroundData['playgroundImage'],
          playgroundAvailability: playgroundData['playgroundAvailability'],
          playgroundUID: playgroundData['playgroundUID']);
    }).toList();
    return playgroundModels;
  }
}