import 'package:fittrack/services/auth.dart';
import 'package:fittrack/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/home/home_page.dart';
import 'app/signing/signin_page.dart';
import 'domain/user.dart';

class AuthContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder(
      stream: authService.onAuthStateChanged,
      initialData: null,
      builder: (context, snapshot){
        final User user = snapshot.data;
        if(user == null){
          return SignInPage();
        }else{
          final Database db = FirebaseDatabase(uid: user.uid);
          return MultiProvider(
            providers: [
              Provider<User>(create: (_) => user),
              Provider<Database>(create: (_) => db),
            ],
            child: HomePage()
          );
        }
      }
    );
  }
}
