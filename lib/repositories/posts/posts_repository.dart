import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class PostsRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;

  List<dynamic> _postsCollection = [];

  List<dynamic> get postsCollection => _postsCollection;

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
      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('posts').add({
        'caption': caption,
        'tag': 'coworker',
        'likes': 0,
        'user': _firebaseAuth.currentUser!.email,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
        'photoUrl': url,
      });

      await FirebaseFirestore.instance
          .collection('posts')
          .doc(docRef.id)
          .update({
        'id': docRef.id,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getPosts(String filter) async {
    if (filter != "all") {
      try {
        await FirebaseFirestore.instance
            .collection('posts')
            .where('tag', isEqualTo: filter)
            .get()
            .then((value) => {
                  value.docs.forEach((element) {
                    _postsCollection.add(element.data());
                  })
                });

        return _postsCollection;
      } catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        await FirebaseFirestore.instance
            .collection('posts')
            .orderBy('createdAt', descending: true)
            .get()
            .then((value) => {
                  value.docs.forEach((element) {
                    _postsCollection.add(element.data());
                  })
                });

        return _postsCollection;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }

  Future<void> likePost(String postId) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update({'likes': FieldValue.increment(1)});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> unlikePost(String postId) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update({'likes': FieldValue.increment(-1)});
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
