import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference brewCollection =
  FirebaseFirestore.instance.collection("brews");

  Future updateUserData(String name, String strength) async {
    Map<String, String> data = {
      'name': name,
      'strength': strength,
    };

    return await brewCollection.doc(uid).set(data);
  }}