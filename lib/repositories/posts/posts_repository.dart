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
        'likes': [],
        'user': _firebaseAuth.currentUser!.displayName,
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

        print(_postsCollection);

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
          .get()
          .then((value) => {
                if (value
                    .data()!['likes']
                    .contains(_firebaseAuth.currentUser!.email))
                  {
                    FirebaseFirestore.instance
                        .collection('posts')
                        .doc(postId)
                        .update({
                      'likes': FieldValue.arrayRemove(
                          [_firebaseAuth.currentUser!.email])
                    })
                  }
                else
                  {
                    FirebaseFirestore.instance
                        .collection('posts')
                        .doc(postId)
                        .update({
                      'likes': FieldValue.arrayUnion(
                          [_firebaseAuth.currentUser!.email])
                    })
                  }
              });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  bool isLikedByUser(String postId, List<dynamic> likes) {
    bool isLiked = false;

    print("IS LIKEEEED: $_postsCollection");

    likes.forEach((element) {
      if (element == _firebaseAuth.currentUser!.email) {
        isLiked = true;
      }
    });

    return isLiked;
  }
}
