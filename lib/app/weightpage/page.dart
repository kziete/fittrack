import 'package:fittrack/app/weightpage/list.dart';
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  WeightPage({Key key}) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  _WeightPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: WeightList()
    );
  }
}
