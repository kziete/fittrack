import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fittrack/domain/weight.dart';
import 'package:flutter/foundation.dart';

abstract class Database{
  Future<void> addWeight(Map<String, dynamic> map);
  Stream<List<Weight>> weights();
}

class FirebaseDatabase implements Database{
  FirebaseDatabase({
    @required this.uid
  });
  String uid;

  @override
  Future<void> addWeight(Map<String, dynamic> data) async {
    final path = '/users/$uid/weights';
    final docRef = Firestore.instance.collection(path).document();
    await docRef.setData(data);
  }

  @override
  Stream<List<Weight>> weights(){
    final path = '/users/$uid/weights';
    print(path);
    return Firestore.instance.collection(path)
        .snapshots()
        .map<List<Weight>>((snapshot) => snapshot.documents.map<Weight>(
          (snap) => Weight.fromMap(snap)
        ).toList());
  }
}