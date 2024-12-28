import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/services/auth/auth-service.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =TextEditingController();

  // register method
  void register() async {
    //get auth services
    final authService = AuthService();

    //check if password match -> create user
    if (passwordController.text == confirmPasswordController.text){
      //try creating user
      try{
        await authService.signUpWithEmailPassword(emailController.text,passwordController.text,);
      }

      //display any error
      catch(e){
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
        );
      }
    }
    //if password dont match-> show error
    else{
       showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords dont match!"),
          )
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
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //slogan
            Text(
              "Lets create an account",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            //email
            MyTextField(
              controller:  emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),
            //password TextField
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            //confirm password TextField
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            //sign in MyButton
            MyButton(
              text: "sign Up",
              onTap: register,
            ),
            const SizedBox(height: 25),
            //already have an account? log in here!
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account",
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
            )
          ],
        ),
      ),
    );
  }
}
