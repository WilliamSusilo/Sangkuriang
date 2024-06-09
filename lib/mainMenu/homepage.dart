import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sangkuriang/auth_services.dart';
import 'education.dart';
import 'profile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user, {super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  User? user;

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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 32),
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
                        "Hi, $username",
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
              ],
            ),
            SizedBox(height: 28),
            Row(
              children: [
                SizedBox(width: 32),
                Text(
                  'Dashboard',
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
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '97',
                        style: TextStyle(fontSize: 128, fontFamily: "Arial"),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(-10, 30),
                                child: Text(
                                  'PPM',
                                  style: TextStyle(
                                      fontSize: 30, fontFamily: "Arial"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Status: Aman',
                    style: TextStyle(fontSize: 26, fontFamily: "Arial"),
                  ),
                  SizedBox(height: 64),
                  Row(
                    children: [
                      SizedBox(width: 32),
                      Text(
                        'Butuh Bantuan?',
                        style: TextStyle(fontSize: 26, fontFamily: "Arial"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          color: Color.fromARGB(255, 112, 112, 112),
                          width: 1.0)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(300.0, 50.0)),
                    ),
                    child: const Text(
                      'Hubungi 112',
                      style: TextStyle(
                        color: Color.fromRGBO(103, 80, 164, 1.0),
                      ),
                    ),
                    onPressed: () {
                      launch('tel:112');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
            icon: Stack(
              children: [
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(232, 222, 248, 1.0),
                  ),
                  child: Icon(Icons.home_outlined, color: Colors.black),
                ),
                SizedBox(height: 35),
              ],
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.menu_book_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationPage(user!)),
                );
              },
            ),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(user!)),
                );
              },
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
