import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sangkuriang/auth_services.dart';
import 'package:sangkuriang/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  final authServices = AuthServices();

  final TextEditingController emailController = TextEditingController(text: "");

  final TextEditingController passwordController =
      TextEditingController(text: "");

  final TextEditingController usernameController =
      TextEditingController(text: "");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Text(
              "Detektor Kebocoran Gas",
              style: TextStyle(
                fontSize: 28,
              ),
            ),

            SizedBox(height: 50),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Input Email
                  Container(
                    width: 300,
                    height: 80,
                    child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Color(0xff79747E)),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        // Validasi format email menggunakan built-in validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap isi kolom ini';
                          }
                          if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(height: 20),

                  // Input Password
                  Container(
                    width: 300,
                    height: 80,
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Color(0xff79747E)),
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harap isi kolom Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  // Login Button
                  Container(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6750A4)),
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Lakukan aksi login jika form valid
                          authServices.signIn(
                              emailController.text, passwordController.text);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Google Login
            Container(
              width: 300,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      )),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Color(0xff6750A4),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Masuk dengan Google",
                      style: TextStyle(
                          color: Color(0xff6750A4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                onPressed: () {
                  authServices.signInWithGoogle();
                },
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Register
                TextButton(
                  child: Text(
                    "Daftar Akun",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    authServices.signUp(emailController.text,
                        passwordController.text, usernameController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),

                // Anonymous Login
                TextButton(
                  child: Text(
                    "Masuk sebagai Anonymous",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () async {
                    await authServices.signInAnonymous();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
