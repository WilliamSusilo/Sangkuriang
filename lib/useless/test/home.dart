import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sangkuriang/auth_services.dart';

class Home extends StatelessWidget {
  final User user;
  Home(this.user, {super.key});
  final authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            Text(user.uid),
            ElevatedButton(
                onPressed: () async {
                  await authServices.signOut();
                },
                child: Text("signOut"))
          ],
        ),
      ),
    );
  }
}
