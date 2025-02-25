// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/admin/home_admin.dart';

import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/services/auth/auth-service.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 void login() async {
    // Get instance of auth service
    final authService = AuthService();

    // Try sign in
    try {
      await authService.signInWithUsernamePassword(
          usernameController.text, passwordController.text,);
      // You might want to navigate to another page on successful login
    } catch (e) {
      // Display error
      showDialog(
       // ignore: use_build_context_synchronously
        context: context ,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200, width: 200),
                  // Logo
                  Image.asset(
                    'bike.gif',
                    fit: BoxFit.values[1],
                    height: 200,
                  ),
                  const SizedBox(height: 50),
                  // Slogan
                  Text(
                    "Sajilo Delivery App",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Email
                  MyTextField(
                    controller: usernameController,
                    hintText: "Admin",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // Password TextField
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  // Sign in MyButton
                  MyButton(
                    onTap: login,
                    text: "Log In",
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()["username"] != usernameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content:
                  Text("Invalid Username", style: TextStyle(fontSize: 18.0))));
        } else if (result.data()["password"] !=
            passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content:
                  Text("Invalid Password", style: TextStyle(fontSize: 18.0))));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminHome()));
        }
      });
    });
  }
}
