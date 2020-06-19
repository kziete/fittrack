import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('weights').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                var formatter = DateFormat('yyyy-MM-dd HH:ii');
                String date = formatter.format(document['date'].toDate());
                return new ListTile(
                  title: new Text(document['amount'].toString()),
                  subtitle: new Text(date),
                );
              }).toList(),
            );
        }
      },
    );
  }
}