import 'package:firebase_database/firebase_database.dart';

final firebaseInstance = FirebaseDatabase.instance.reference();

final historyRef = firebaseInstance.child('user_history');
final feedRef = firebaseInstance.child('feeds');
final groupRef = firebaseInstance.child('groups');
final offerRef = firebaseInstance.child('offers');
final userRef = firebaseInstance.child('users');
