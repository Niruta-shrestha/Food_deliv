import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/services/auth/auth-service.dart';
import 'package:flutter_app/models/user_model.dart'; // Import the UserModel

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final numberController = TextEditingController();

  // Register method
  void register() async {
    // Get auth services
    final authService = AuthService();

    // Check if password match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // Try creating user
      try {
        // Sign up user with email and password
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        // After successful registration, save the user data to Firestore
        UserModel user = UserModel(
          email: emailController.text,
          userName: usernameController.text,
          number: numberController.text,

        );

        // Save user data to Firestore
        final userService = UserService();
        await userService.saveUser(user);
        print("Data saved Sucessfully");
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Registration Successful!"),
          ),
        );
      } catch (e) {
        // Display any errors during sign-up
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // If passwords don't match -> show error
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // Slogan
            Text(
              "Let's create an account",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // Email
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),
            MyTextField(
              controller: usernameController,
              hintText: "UserName",
              obscureText: false,
            ),

            const SizedBox(height: 10),
            MyTextField(
              controller: numberController,
              hintText: "Contact Number",
              obscureText: false,
            ),

            const SizedBox(height: 10),
            // Password TextField
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Confirm password TextField
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            // Sign up MyButton
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),
            const SizedBox(height: 25),
            // Already have an account? Log in here!
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
