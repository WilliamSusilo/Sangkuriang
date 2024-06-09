import 'package:flutter/material.dart';
// import 'package:sangkuriang/useless/test/home.dart';
import 'package:sangkuriang/mainMenu/homepage.dart';
import 'package:sangkuriang/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    return (firebaseUser == null) ? Login() : HomePage(firebaseUser);
  }
}
