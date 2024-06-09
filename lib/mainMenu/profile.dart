import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sangkuriang/auth_services.dart';
import 'package:sangkuriang/wrapper.dart';
import 'homepage.dart';
import 'education.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage(this.user, {super.key});
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  User? user;
  int _currentIndex = 2;
  final authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final fetchedUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = fetchedUser; // Update the user variable
    });
  }

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 32),
              Text(
                'Profil Saya',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: "Arial",
                  height: 2.0,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                ),
                SizedBox(height: 128),
                Icon(
                  Icons.person_outline_rounded,
                  size: 120.0,
                ),
                SizedBox(height: 16),
                StreamBuilder<String>(
                  stream: AuthServices().getUserNameStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error loading username: ${snapshot.error}");
                    }

                    if (!snapshot.hasData) {
                      return Text("Loading username...");
                    }

                    final username = snapshot
                        .data!; // Safe access assuming you've handled errors/emptiness

                    if (username != 'User document does not exist') {
                      // Display the username (use appropriate styling and layout)
                      return Text(
                        username,
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: "Arial",
                          height: 2.0,
                        ),
                      );
                    } else {
                      if (user?.displayName == null) {
                        return Text(
                          "Hi, Anonymous",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Arial",
                            height: 2.0,
                          ),
                        );
                      } else {
                        return Text(
                          "Hi, ${user?.displayName}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Arial",
                            height: 2.0,
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(
                        color: Color.fromARGB(255, 112, 112, 112), width: 1.0)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(300.0, 50.0)),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Color.fromRGBO(103, 80, 164, 1.0),
                    ),
                  ),
                  onPressed: () async {
                    await authServices.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(243, 237, 247, 1.0),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(firebaseUser!)),
                );
              },
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.menu_book_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducationPage(firebaseUser!)),
                );
              },
            ),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(232, 222, 248, 1.0),
                  ),
                  child: Icon(Icons.person_outlined, color: Colors.black),
                ),
                SizedBox(height: 35),
              ],
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
