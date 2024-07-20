import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../Body.dart';
import 'PasswordReset.dart';
import 'RegistrationPage.dart';

class registerLogin extends StatefulWidget {
  const registerLogin({Key? key}) : super(key: key);

  @override
  State<registerLogin> createState() => _registerLoginState();
}

class _registerLoginState extends State<registerLogin> {
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF8B54C0), Color(0xFFD3CDED)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _mailController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (val) =>
                        val!.isNotEmpty ? null : "Name Should not be Empty",
                      ),
                      SizedBox(height: 20),




                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (val) =>
                        val!.isNotEmpty ? null : "Password Should not be Empty",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PasswordResetPage()),
                        );
                      },
                      child: Text(
                        'Forget Password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  },));
                }, child: Text('Login')),
                // ElevatedButton(
                //   onPressed: () async {
                //     if (_formKey.currentState!.validate()) {
                //       final String username = _mailController.text;
                //       final String password = _passwordController.text;
                //
                //
                //
                //       if (userExists) {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => TextHome()),
                //         );
                //       } else {
                //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //           content: Text('Invalid username or password'),
                //         ));
                //       }
                //     }
                //   },
                //   child: Text('Login'),
                // ),
                //
                //
                // Container(
                //
                // ),







                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail, color: Colors.white, size: 30),
                    SizedBox(width: 20),
                    Icon(Icons.chat, color: Colors.white, size: 30),
                    SizedBox(width: 20),
                    Icon(Icons.facebook, color: Colors.white, size: 30),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                    );
                  },
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegistrationPage()),
                          );
                        },
                        child: Text(
                          'Don\'t have an account? Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
