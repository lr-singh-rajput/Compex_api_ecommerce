import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyWidgets {
  
  // Method to show TextField widget
  Widget textFieldShow(
    TextEditingController controller,
    String hint,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      obscureText: hint == 'Password', // Hide text if it's password field
      decoration: InputDecoration(
        labelText: '$hint',
        hintText: 'Enter your $hint',
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  // Method to show default email and password copy option
  Widget defaultEmailPass(
    String title,
    String value,
    String textToCopy,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title - $value'),
        // Button to copy the text to the clipboard
        InkWell(
          child: Container(
            width: 30,
            height: 30,
            child: Icon(
              Icons.copy,
              size: 14,
            ),
          ),
          onTap: () {
            // Copy the text to clipboard
            Clipboard.setData(ClipboardData(text: textToCopy));

            // Show a SnackBar for feedback
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Copied $value')),
            );
          },
        ),
      ],
    );
  }

  // Method to show an ElevatedButton
  Widget Loginbutton(
    String text,
    var authController,
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,

  ) {
    return ElevatedButton(
      onPressed: () {
        print(emailController.text);
           print(passwordController.text);
        authController(emailController.text, passwordController.text, context);
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Method to show a TextButton for navigation
  Widget textButton(BuildContext context, Widget page, String text) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(text),
    );
  }
}
