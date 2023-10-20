import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../shared_preference/shared_preference.dart';

class AddEditRepository {
  static CollectionReference playgroundCollection =
      FirebaseFirestore.instance.collection('playground');

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
      {required PlaygroundInfo playgroundModel}) async {
    try {
      final playgroundName = playgroundModel.playgroundName;
      final playgroundType = playgroundModel.playgroundType;
      final playgroundUID = playgroundModel.playgroundUID;
      final date = playgroundModel.date;
      final fromTime = playgroundModel.fromTime;
      final toTime = playgroundModel.toTime;

      final playgroundPrice = playgroundModel.playgroundPrice;
      final playgroundSize = playgroundModel.playgroundSize;
      final playgroundImage = playgroundModel.playgroundImage;
      final playgroundAvailability = playgroundModel.playgroundAvailability;

      final ownerUID =
          await SharedPreferencesManager.getData(key: 'currentUID');

      final playgroundMap = {
        'playgroundName': playgroundName,
        'playgroundType': playgroundType,
        'playgroundPrice': playgroundPrice,
        'playgroundSize': playgroundSize,
        'playgroundImage': playgroundImage,
        'playgroundAvailability': playgroundAvailability,
        'ownerUID': ownerUID,
        'playgroundUID': playgroundUID,
        'date': date,
        'fromTime': fromTime,
        'toTime': toTime
      };

      await playgroundCollection.doc(ownerUID).set(playgroundMap);

      return true;
    } catch (e) {
      print('Error adding playground to Firestore: $e');
      return false;
    }
  }

  static Future<bool> updateEditPlayground(
      PlaygroundInfo newPlaygroundModel) async {
    String ownerUIID =
        await SharedPreferencesManager.getData(key: 'currentUID');
    Map<String, dynamic> playgroundDataForFirestore = {
      'playgroundName': newPlaygroundModel.playgroundName,
      'playgroundType': newPlaygroundModel.playgroundType,
      'playgroundPrice': newPlaygroundModel.playgroundPrice,
      'playgroundSize': newPlaygroundModel.playgroundSize,
      'playgroundImage': newPlaygroundModel.playgroundImage,
      'playgroundAvailability': newPlaygroundModel.playgroundAvailability,
      'ownerUID': ownerUIID,
      'playgroundUID': newPlaygroundModel.playgroundUID,
      'date': newPlaygroundModel.date,
      'fromTime': newPlaygroundModel.fromTime,
      'toTime': newPlaygroundModel.toTime
    };
    try {
      await playgroundCollection
          .doc(ownerUIID)
          .update(playgroundDataForFirestore);
      print('Document updated successfully');
      return true;
    } catch (error) {
      print('Error updating document: $error');
      return false;
    }
  }
}
