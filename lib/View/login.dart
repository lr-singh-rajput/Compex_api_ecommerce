import 'package:e_commere_api/Controller/authController.dart';
import 'package:e_commere_api/View/HomePage.dart';
import 'package:e_commere_api/View/mywidget.dart';
import 'package:e_commere_api/View/rRegister.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  Login({super.key});





  //final _formKey = GlobalKey<FormState>();
  // bool _isValidEmail(String email) {
  //   // Regular expression to check for Gmail
  //   final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
  //   return regex.hasMatch(email);
  // }

  @override
  Widget build(BuildContext context) {

  MyWidgets mywidget = MyWidgets();
  
      TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
    

    final String textToCopymail = "eve.holt@reqres.in";
    final String textToCopypass = "pistol";
    AuthController authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor:Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
            // child: Form(
        //   key: _formKey,
        //chile: column([
        //  TextFormField(
              //   controller: _emailController,
              //   decoration: InputDecoration(
              //     labelText: 'Email',
              //     hintText: 'Enter your Gmail address',
              //     prefixIcon: Icon(Icons.email),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your email';
              //     } else if (!_isValidEmail(value)) {
              //       return 'Please enter a valid Gmail address';
              //     }
              //     return null;
              //   },
              //   keyboardType: TextInputType.emailAddress,
              // ),
              //ElevatedButton(
              //   onPressed: () {
              //     print(_emailController);
              //     // authController.loginUser(
              //     //     _email.toString(), _password.toString(), context);
              //     // if (_formKey.currentState!.validate()) {
              //     //   // If the form is valid, proceed with login

              //     // }
              //   },
              //   child: Text('Login'),
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              //     textStyle: TextStyle(fontSize: 16),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              //])// ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login to Your Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 30),

            mywidget.textFieldShow(emailController,"Email",Icons.email,),
           const SizedBox(height: 10),
            mywidget.textFieldShow(passwordController, "Password", Icons.lock),
            const SizedBox(height: 20),
             mywidget.Loginbutton(
              'Login',
              authController.loginUser,
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
          
           const SizedBox(height: 20),
            mywidget.textButton(context, Rregister(), "Go to Regiter Page"),
          
            
            ],
          ),
    
      ),
    );
  }
}
