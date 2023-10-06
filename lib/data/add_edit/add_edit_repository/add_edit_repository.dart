// ignore_for_file: avoid_print

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEditRepository {
  static CollectionReference playgroundCollection =
      FirebaseFirestore.instance.collection('playground');

  static Future<File?> uploadImage() async {
    File image;
    final imagePicker = ImagePicker();

    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      return image;
    } else {
      return null;
    }
  }

  static Future<bool> addPlaygroundToFireStore(
      {required PlaygroundInfo playgroundModel}) async {
    try {
      //TODO: Add userUID from shared pref here
      String ownerUID = 'will be change';

      String playgroundName = playgroundModel.playgroundName;
      String playgroundType = playgroundModel.playgroundType;

      String playgroundPrice = playgroundModel.playgroundPrice;
      String playgroundSize = playgroundModel.playgroundSize;
      String playgroundImage = playgroundModel.playgroundImage;
      bool playgroundAvailability = playgroundModel.playgroundAvailability;

      Map<String, dynamic> playgroundMap = {
        'playgroundName': playgroundName,
        'playgroundType': playgroundType,
        'playgroundPrice': playgroundPrice,
        'playgroundSize': playgroundSize,
        'playgroundImage': playgroundImage,
        'playgroundAvailability': playgroundAvailability
      };

      // await playgroundCollection.doc(ownerUID).set(playgroundMap);
      await playgroundCollection.add(playgroundMap);

      return true;
    } catch (e) {
      print('error is ____________________> $e');
      return false;
    }
  }
}
