import 'package:cloud_firestore/cloud_firestore.dart';

class Weight{
  Weight({
    this.amount,
    this.date,
  });
  double amount;
  DateTime date;

  static fromMap(DocumentSnapshot map){
    return Weight(
      amount: map.data['amount'].toDouble(),
    );
  }
  Map toMap(){
    return {
      'amount': amount,
      'date': date.toIso8601String()
    };
  }
}