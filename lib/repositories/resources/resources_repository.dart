import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

class ResourcesRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;

  List<dynamic> _resourcesCollection = [];

  List<dynamic> get resourcesCollection => _resourcesCollection;

  Future<List<dynamic>> getResources() async {
    try {
      await FirebaseFirestore.instance
          .collection('resources')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          _resourcesCollection.add(doc.data());
        });
      });
    } catch (e) {
      throw Exception(e.toString());
    }

    return _resourcesCollection;
  }
}
