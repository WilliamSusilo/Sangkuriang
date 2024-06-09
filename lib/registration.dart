import 'package:flutter/material.dart';
import 'package:sangkuriang/auth_services.dart';
import 'package:sangkuriang/wrapper.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;

  final AuthServices authServices = AuthServices();

  final TextEditingController emailController = TextEditingController(text: "");

  final TextEditingController passwordController =
      TextEditingController(text: "");

  final TextEditingController usernameController =
      TextEditingController(text: "");

  final TextEditingController confirmedPasswordController =
      TextEditingController(text: "");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmedPasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Registrasi",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 100),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Input Username
                    buildTextField(
                      controller: usernameController,
                      label: "Username",
                      prefixIcon: Icons.person,
                    ),

                    SizedBox(height: 40),

                    // Input Email
                    buildEmailField(
                      controller: emailController,
                      label: "Email",
                      prefixIcon: Icons.email,
                    ),

                    SizedBox(height: 40),

                    // Input Password
                    buildPasswordTextField(
                      controller: passwordController,
                      label: "Password",
                    ),

                    SizedBox(height: 40),

                    // Input Confirmed Password
                    buildPasswordTextField(
                      controller: confirmedPasswordController,
                      label: "Confirm your Password",
                    ),

                    SizedBox(height: 40),

                    // Registration Button
                    buildRegisterButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 80,
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Color(0xff79747E)),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Harap isi kolom ini';
          }
          return null;
        },
      ),
    );
  }

  Widget buildEmailField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 80,
      ),
      child: TextFormField(
          controller: controller,
          style: TextStyle(color: Color(0xff79747E)),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Validasi format email menggunakan built-in validator
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap isi kolom ini';
            }
            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                .hasMatch(value)) {
              return 'Format email tidak valid';
            }
            return null;
          }),
    );
  }

  Widget buildPasswordTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 80,
      ),
      child: TextFormField(
        obscureText: _isObscure,
        controller: controller,
        style: TextStyle(color: Color(0xff79747E)),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
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
            return 'Harap isi kolom ini';
          }
          return null;
        },
      ),
    );
  }

  Widget buildRegisterButton() {
    return Container(
      width: 300,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff6750A4)),
        child: Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onPressed: () async {
          print('Register button pressed');

          if (_formKey.currentState!.validate()) {
            print('Form is valid');

            if (passwordController.text != confirmedPasswordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Password tidak sesuai'),
                ),
              );
              return;
            }

            print('Starting registration process...');

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(child: CircularProgressIndicator());
              },
              barrierDismissible: false,
            );

            try {
              final result = await authServices.signUp(
                emailController.text,
                passwordController.text,
                usernameController.text,
              );

              Navigator.pop(context); // Close the loading dialog

              if (result != null) {
                print('Registration successful. Navigating to the next page.');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Wrapper()),
                );
              } else {
                print('Authentication failed');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Authentication failed'),
                  ),
                );
              }
            } catch (e) {
              print('Error during registration: $e');

              // Handle Firestore Permission Denied error
              if (e.toString().contains("PERMISSION_DENIED")) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Permission denied. Check Firestore security rules.'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Registration failed. Please try again later.'),
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }
}
