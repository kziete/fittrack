import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class User {
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  }) : assert(uid != null, 'User can only be created with a non-null uid');

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;

  factory User.fromFirebaseUser(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  @override
  String toString() =>
      'uid: $uid, email: $email, photoUrl: $photoUrl, displayName: $displayName';
}