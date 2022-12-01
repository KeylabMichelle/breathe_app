import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class StatesRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> updateState(String state, DateTime date) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update({
        'state': FieldValue.arrayUnion([
          {"state": state, "date": date}
        ]),
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> checkState(DateTime date) async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      var states = doc.data()!['state'];
      print(states[states.length - 1]['date'].toDate().day);
      if (states[states.length - 1]['date'].toDate().day == date.day) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List> getStateHistory() async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      List<dynamic> states = doc.data()!['state'];

      states.sort((a, b) => b['date'].compareTo(a['date']));
      return states;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getAverageState() async {
    var states = await getStateHistory();

    int great = 0;
    int bad = 0;
    int fine = 0;
    int meh = 0;
    states.forEach((element) {
      if (element['state'] == 'great') {
        great++;
      } else if (element['state'] == 'bad') {
        bad++;
      } else if (element['state'] == 'fine') {
        fine++;
      } else {
        meh++;
      }
    });
    if (great > bad && great > fine && great > meh) {
      return 'Great';
    } else if (bad > great && bad > fine && bad > meh) {
      return 'Bad';
    } else if (fine > great && fine > bad && fine > meh) {
      return 'Fine';
    } else {
      return 'Meh';
    }
  }

  //get averga states for all employees
  Future<Map> getAverageStateForAll() async {
    try {
      var doc = await FirebaseFirestore.instance.collection('users').get();
      List<dynamic> states = [];
      doc.docs.forEach((element) {
        states.add(element.data()['state']);
      });
      int great = 0;
      int bad = 0;
      int fine = 0;
      int meh = 0;

      states.forEach((element) {
        element.forEach((element) {
          if (element['state'] == 'great') {
            great++;
          } else if (element['state'] == 'bad') {
            bad++;
          } else if (element['state'] == 'fine') {
            fine++;
          } else {
            meh++;
          }
        });
      });

      //stimate percentage of each state for all employees
      double greatPercentage = great / (great + bad + fine + meh) * 100;
      double badPercentage = bad / (great + bad + fine + meh) * 100;
      double finePercentage = fine / (great + bad + fine + meh) * 100;
      double mehPercentage = meh / (great + bad + fine + meh) * 100;

      if (great > bad && great > fine && great > meh) {
        return {
          'average': 'Great',
          'great': greatPercentage,
          'bad': badPercentage,
          'fine': finePercentage,
          'meh': mehPercentage
        };
      } else if (bad > great && bad > fine && bad > meh) {
        return {
          'average': 'Bad',
          'great': greatPercentage,
          'bad': badPercentage,
          'fine': finePercentage,
          'meh': mehPercentage
        };
      } else if (fine > great && fine > bad && fine > meh) {
        return {
          'average': 'Fine',
          'great': greatPercentage,
          'bad': badPercentage,
          'fine': finePercentage,
          'meh': mehPercentage
        };
      } else {
        return {
          'average': 'Meh',
          'great': greatPercentage,
          'bad': badPercentage,
          'fine': finePercentage,
          'meh': mehPercentage
        };
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
