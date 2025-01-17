import 'package:e_commere_api/Controller/authController.dart';
import 'package:e_commere_api/View/HomePage.dart';
import 'package:e_commere_api/View/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Rregister extends StatelessWidget {
   Rregister({super.key});

  //final _formKey = GlobalKey<FormState>();




  // bool _isValidEmail(String email) {
  //   // Regular expression to check for Gmail
  //   final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
  //   return regex.hasMatch(email);
  // }

  @override
  Widget build(BuildContext context) {
     AuthController authController = AuthController();
     MyWidgets mywidget = MyWidgets();

      TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
    
    final String textToCopymail = "eve.holt@reqres.in";
    final String textToCopypass = "pistol";
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text(
            "Create New Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            mywidget.textFieldShow(emailController, "Email", Icons.email),
            const SizedBox(height: 10),
            mywidget.textFieldShow(passwordController, "Password", Icons.lock),
            const SizedBox(height: 20),
            mywidget.Loginbutton(
              'Register',
              authController.regiterUser,
              emailController,
              passwordController,
              context,
            ),
            const SizedBox(height: 20),
            mywidget.defaultEmailPass(
              'Default Email',
              'Email',
              textToCopymail,
              context,
            ),
            const SizedBox(height: 10),
            mywidget.defaultEmailPass(
              'Default Password',
              'Password',
              textToCopypass,
              context,
            ),
            const SizedBox(height: 20),
            mywidget.textButton(context, HomePage(), "Go to Home Page"),
          
            
          ],
        ),
      )
    );
  }
}