import 'package:fittrack/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Logear!"),
            onPressed: ()=> authService.signInWithGoogle(),
          ),
        ),
      ),
    );
  }
}
