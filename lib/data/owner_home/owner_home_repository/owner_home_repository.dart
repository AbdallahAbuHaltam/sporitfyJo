import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';

class OwnerRepository {
  static Future<List<PlaygroundInfo>> fetchAllPlaygroundFromFirestore() async {
    final QuerySnapshot<Map<String, dynamic>> documentsSnapshot =
        await FirebaseFirestore.instance.collection('cars').get();

    List<PlaygroundInfo> playgroundModels = documentsSnapshot.docs.map((doc) {
      Map<String, dynamic> playgroundData = doc.data();
      return PlaygroundInfo(
          playgroundName: playgroundData[''],
          playgroundType: playgroundData[''],
          playgroundPrice: playgroundData[''],
          playgroundSize: playgroundData[''],
          playgroundImage: playgroundData[''],
          playgroundAvailability: playgroundData['']);
    }).toList();
    return playgroundModels;
  }
}