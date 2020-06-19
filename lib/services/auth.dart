import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/domain/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Stream<User> get onAuthStateChanged;
  Future<void> signOut();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
}

class FirebaseAuthService implements AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged
        .map((firebaseUser) => User.fromFirebaseUser(firebaseUser));
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<User> signInAnonymously() async {
    final AuthResult authResult = await _firebaseAuth.signInAnonymously();
    return User.fromFirebaseUser(authResult.user);
  }

  @override
  Future<User> signInWithGoogle() async{
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );
    GoogleSignInAccount account = await _googleSignIn.signIn();
    if(account != null){
      GoogleSignInAuthentication authentication = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      FirebaseUser _firebaseUser = (await _firebaseAuth.signInWithCredential(credential)).user;
      return User.fromFirebaseUser(_firebaseUser);
    }
  }


}