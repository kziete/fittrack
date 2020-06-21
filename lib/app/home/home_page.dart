import 'package:fittrack/app/weightpage/weight_form.dart';
import 'package:fittrack/domain/weight.dart';
import 'package:fittrack/services/auth.dart';
import 'package:fittrack/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _openForm(BuildContext context){
    final database = Provider.of<Database>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
       fullscreenDialog: true,
       builder: (_) => WeightForm(database: database)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final db = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fit Track"),
        actions: [
          FlatButton(
            child: Text("Salir"),
            onPressed: () => authService.signOut(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openForm(context),
      ),
      body: StreamBuilder<List<Weight>>(
        stream: db.weights(),
        builder: (_, snapshot){
          print(snapshot);
          if(snapshot.hasError){
            print(snapshot.error);
          }
          if(snapshot.hasData){
            final children = snapshot.data.map((weight) => Text(weight.amount.toString())).toList();
            return ListView(
              children: children,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
