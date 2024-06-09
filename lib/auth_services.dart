import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthServices {
  var db = FirebaseFirestore.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future<User?> signUp(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      print(firebaseUser);

      await addUserDetails(
        username.trim(),
        email.trim(),
      );

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future<User?> addUserDetails(String username, String email) async {
    try {
      await db.collection('users').doc(email).set({
        'username': username,
        'email': email,
      });
      // .whenComplete(() {
      //   Get.snackbar("Success", "Your account has been created.",
      //       snackPosition: SnackPosition.BOTTOM,
      //       backgroundColor: Colors.green.withOpacity(0.1),
      //       colorText: Colors.green);
      // });
    } catch (e) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(e.toString());

      return null;
    }
    return null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  Stream<User?> get firebaseUserStream => _auth.authStateChanges();

  Stream<String> getUserNameStream() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print('UID: ${user.email}'); // Debugging statement

      return db.collection('users').doc(user.email).snapshots().map((event) {
        if (event.exists) {
          final data = event.data() ?? {};
          print('Document data: $data'); // Debugging statement

          if (data.containsKey('username')) {
            return data['username'] as String;
          } else {
            return 'Username field not found';
          }
        } else {
          print('User document does not exist'); // Debugging statement
          return 'User document does not exist';
        }
      }).handleError((error) {
        print('Error fetching username: $error'); // Debugging statement
        return 'Error fetching username';
      });
    } else {
      print('No user signed in'); // Debugging statement
      return Stream.empty();
    }
  }
}
