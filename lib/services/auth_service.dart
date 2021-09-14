import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/screens/new_feed_screen.dart';
import 'package:flutter_clone_intagram/screens/sign_in_screen.dart';
import 'package:flutter_clone_intagram/utils/routes.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;
  static Future<void> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').doc(signedInUser.uid).set({
          'name': name,
          'email': email,
          'profileImageUrl': '',
          'bio': '',
        });
        Navigator.pushReplacementNamed(context, MyRoutes.newFeedRouter);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Future<void> signIn(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
