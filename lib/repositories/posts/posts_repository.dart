import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class PostsRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> uploadFile(String filePath, String fileName) async {}

  Future<void> createPost(
    String caption,
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      await storage.ref('posts/$fileName').putFile(file);
    } on FirebaseException catch (e) {
      print("ERROOOOOR: $e");
    }

    var url = await storage.ref('posts/$fileName').getDownloadURL();
    print(url);

    try {
      await FirebaseFirestore.instance.collection('posts').add({
        'caption': caption,
        'likes': 0,
        'user': _firebaseAuth.currentUser!.email,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
        'photoUrl': url,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getPosts() async {
    try {
      var posts = await FirebaseFirestore.instance.collection('posts').get();

      print(posts.docs);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
