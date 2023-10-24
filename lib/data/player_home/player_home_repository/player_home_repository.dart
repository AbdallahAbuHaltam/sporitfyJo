import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';


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
          playgroundUID: playgroundData['playgroundUID'],
          date: playgroundData['date'],
          fromTime: playgroundData['fromTime'],
          toTime: playgroundData['toTime']
          );
    }).toList();
    return playgroundModels;
  }
}