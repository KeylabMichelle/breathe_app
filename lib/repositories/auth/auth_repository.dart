import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(value.user!.uid)
                    .set({
                  'firstName': firstName,
                  'lastName': lastName,
                  'email': email,
                  'uid': value.user!.uid,
                  'createdAt': DateTime.now(),
                  'updatedAt': DateTime.now(),
                }).then((value) => {
                          FirebaseAuth.instance.currentUser!
                              .updateDisplayName('$firstName $lastName')
                        })
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      print('email: $email, password: $password');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(FirebaseAuth.instance.currentUser!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception(e.toString());
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
