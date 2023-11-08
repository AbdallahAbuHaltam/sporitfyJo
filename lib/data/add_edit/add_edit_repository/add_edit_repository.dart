import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportify/data/add_edit/add_edit_model/main_playground_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/data/add_edit/add_edit_model/sub_playground_model.dart';
import '../../../shared_preference/shared_preference.dart';

class AddEditRepository {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference mainPlaygroundCollection =
      firestore.collection('playground');

  static Future<String?> uploadImage() async {
    File? image;
    final imagePicker = ImagePicker();

    try {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        String nameImage = basename(pickedImage.path);
        var random = Random().nextInt(100000000);
        nameImage = '$random$nameImage';

        final refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(image);

        final url = await refStorage.getDownloadURL();
        print('Image URL____________________: $url');

        return url;
      } else {
        print('No image selected.');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  static Future<bool> addPlaygroundToFirestore(
      {required SubPlaygroundModel playgroundModel}) async {
    try {
      final ownerUID =
          await SharedPreferencesManager.getData(key: 'currentUID');
      final DocumentSnapshot<Map<String, dynamic>> ownerMap =
          await firestore.collection('owner').doc(ownerUID).get();

      String playgroundName = ownerMap.data()?['playgroundName'] ?? "null";

      final playgroundNumber = playgroundModel.playgroundNumber;
      final playgroundType = playgroundModel.playgroundType;
      final playgroundUID = playgroundModel.playgroundUID;
      final playgroundPrice = playgroundModel.playgroundPrice;
      final playgroundSize = playgroundModel.playgroundSize;
      final playgroundImage = playgroundModel.playgroundImage;
      final playgroundAvailability = playgroundModel.playgroundAvailability;
      final playersNames = playgroundModel.playersNames;

      final subPlaygroundMap = {
        'playgroundNuber': playgroundNumber,
        'playgroundName': playgroundName,
        'playgroundType': playgroundType,
        'playgroundPrice': playgroundPrice,
        'playgroundSize': playgroundSize,
        'playgroundImage': playgroundImage,
        'playersNames': playersNames,
        'playgroundUID': playgroundUID,
        'playgroundAvailability': playgroundAvailability,
      };
      final CollectionReference subCollection = mainPlaygroundCollection
          .doc(ownerUID)
          .collection('subPlaygroundCollection');

      await subCollection.doc(playgroundUID).set(subPlaygroundMap);

      return true;
    } catch (e) {
      print('Error adding playground to Firestore: $e');
      return false;
    }
  }

  static Future<bool> updateEditPlayground(
      SubPlaygroundModel newPlaygroundModel) async {
    final ownerUID = await SharedPreferencesManager.getData(key: 'currentUID');

    DocumentSnapshot<Map<String, dynamic>> ownerMap =
        await firestore.collection('owner').doc(ownerUID).get();

    final playgroundName = await firestore
        .collection('owner')
        .doc(ownerUID)
        .get(ownerMap['playgroundName']);

    final playgroundNumber = newPlaygroundModel.playgroundNumber;
    final playgroundType = newPlaygroundModel.playgroundType;
    final playgroundUID = newPlaygroundModel.playgroundUID;
    final playgroundPrice = newPlaygroundModel.playgroundPrice;
    final playgroundSize = newPlaygroundModel.playgroundSize;
    final playgroundImage = newPlaygroundModel.playgroundImage;
    final playgroundAvailability = newPlaygroundModel.playgroundAvailability;
    final playersNames = newPlaygroundModel.playersNames;

    final subPlaygroundMap = {
      'playgroundNumber': playgroundNumber,
      'playgroundName': playgroundName,
      'playgroundType': playgroundType,
      'playgroundPrice': playgroundPrice,
      'playgroundSize': playgroundSize,
      'playgroundImage': playgroundImage,
      'playersNames': playersNames,
      'playgroundUID': playgroundUID,
      'playgroundAvailability': playgroundAvailability,
    };
    try {
      final mainPlaygroundCollection = firestore.collection('playground');
      final subCollection = mainPlaygroundCollection
          .doc(playgroundUID)
          .collection('subPlaygroundCollection');

      await subCollection.doc(playgroundUID).update(subPlaygroundMap);

      print('Document updated successfully');
      return true;
    } catch (error) {
      print('Error updating document: $error');
      return false;
    }
  }
}
