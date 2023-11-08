// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sportify/data/add_edit/add_edit_model/main_playground_model.dart';

// class PLayerHomeRepository {
//   static Future<List<MainPlaygroundModel>>
//       fetchAllPlaygroundFromFirestore() async {
//     final QuerySnapshot<Map<String, dynamic>> documentsSnapshot =
//         await FirebaseFirestore.instance.collection('playground').get();

//     List<MainPlaygroundModel> playgroundModels =
//         documentsSnapshot.docs.map((doc) {
//       Map<String, dynamic> playgroundData = doc.data();
//       return MainPlaygroundModel(
//           playgroundName: playgroundData['playgroundName'],
//           playgroundType: playgroundData['playgroundType'],
//           playgroundPrice: playgroundData['playgroundPrice'],
//           playgroundSize: playgroundData['playgroundSize'],
//           playgroundImage: playgroundData['playgroundImage'],
//           playgroundAvailability: playgroundData['playgroundAvailability'],
//           playgroundUID: playgroundData['playgroundUID'],
//           playgroundNumber: playgroundData['playgroundNumber'],
//           ownerUID: playgroundData['ownerUID']);
//     }).toList();
//     return playgroundModels;
//   }
// }
