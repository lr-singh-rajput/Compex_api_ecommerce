import 'dart:convert';

import 'package:e_commere_api/View/HomePage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
//import 'package:http/http.dart;

class AuthController {
  final baseUrl = 'https://reqres.in/api/login';
    final regiterUrl = 'https://reqres.in/api/register';


//   final baseUrl = 'http://restapi.adequateshop.com/api';
// final loginUrl = "https://recruitment-api.pyt1.stg.jmr.pl/login";

  Future<void> loginUser(String gmail, String pass ,context) async {
    try {
       final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': gmail, 'password': pass},

      
      );

      if (response.statusCode == 200) {

        var data = jsonDecode(response.body.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('token cheching')));
        //print(data);
        if(data["token"] == 'QpwL5tke4Pnpja7X4'){
          //print('$data');
         Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      );
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('login successfully $data')));
          //print(data);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('token not mach')));
          print('tokan not mach');
        }
        
      
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('faild Login')),
        );
        print('faild to login');
      }
    } catch (e) {
      print('error catch block');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('error$e')),
      );
    }
  }



Future<void> regiterUser(String gmail, String pass ,context) async {
    try {
       final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: ({'email': gmail, 'password': pass}),
      );
      if (response.statusCode == 200 ) {
        print("login");
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      );
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('login successfully')));
      } else {
        print('faild');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('faild Register User')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('error$e')),
      );
    }
  }
}
