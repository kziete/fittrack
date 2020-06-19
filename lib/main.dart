import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'auth_container.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
        create: (context) => FirebaseAuthService(),
        child: MaterialApp(
          title: 'Fit Track',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthContainer(),
        ),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the app.home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignInAccount _currentUser;
  FirebaseUser firebaseUser;
  Widget currentPage = WeightPage();

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser == null) {
        exit(0);
      }
      _loggedFlow();

    });
    _googleSignIn.signIn();
  }

  Future<void> _loggedFlow() async {
    GoogleSignInAuthentication googleAuth = await _currentUser.authentication;
    print(googleAuth);
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential);
    FirebaseUser _firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
    setState(() {
      firebaseUser = _firebaseUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(firebaseUser.toString()),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Pesos'),
              onTap: () {
                setState((){
                  currentPage = WeightPage();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Mala Comida'),
              onTap: () {
                setState((){
                  currentPage = BadFoodPage();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: currentPage,
    );
  }
}*/
