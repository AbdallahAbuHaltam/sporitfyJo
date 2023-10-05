import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';

class AddEditRepository {
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
    //TODO: UPLOAD PLAYGROUND MODEL TO FIRESTORE
    return true;
  }
}
