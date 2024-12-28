import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/services/auth/auth-service.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final  emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login method
  void login() async {
    // Get instance of auth service
    final authService = AuthService();

    // Try sign in
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text,);
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

  // Forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("User tapped forgot password."),
      ),
    );
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
                const SizedBox(height: 50),
                // Logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
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
                  controller: emailController,
                  hintText: "Email",
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
                const SizedBox(height: 10),
                // Forgot password button
                GestureDetector(
                  onTap: forgotPw,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Member or not?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a Member?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
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
        ),
      ),
    );
  }
}
