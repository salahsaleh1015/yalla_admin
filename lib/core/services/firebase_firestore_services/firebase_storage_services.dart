


import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseStorageServices {

  Future<String> uploadImageToFirebase(File imageFile) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(imageFile);

      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Upload error: $e");
      rethrow; // Propagate the exception to the caller
    }
  }


  Future<void> deleteImageFromFirebase(String imageUrl) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(imageUrl);

      await ref.delete();

      print("Image deleted successfully");
    } catch (e) {
      print("Delete error: $e");
      rethrow;
    }
  }
}