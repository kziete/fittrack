import 'package:fittrack/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class WeightForm extends StatefulWidget {
  WeightForm({
    @required this.database
  });
  final Database database;

  @override
  _WeightFormState createState() => _WeightFormState();
}

class _WeightFormState extends State<WeightForm> {
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('Guardar'),
            onPressed: () => _saveWeight(context),
          ),
        ],
      ),
    );
  }

  void _saveWeight(BuildContext context) {
    widget.database.addWeight({
     'amount': double.parse(_amountController.text)
    });
    Navigator.pop(context);
  }
}
