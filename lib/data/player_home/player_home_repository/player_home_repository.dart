import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';

import '../../login_register/login_register_repo/owner_repo/owner_repository.dart';

class PLayerHomeRepository {
  static Future<List<PlaygroundInfo>> fetchAllPlaygroundFromFirestore() async {
    
    final QuerySnapshot<Map<String, dynamic>> documentsSnapshot =
        await FirebaseFirestore.instance
            .collection('playground')
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