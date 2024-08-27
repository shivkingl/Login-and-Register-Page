import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/homeScreen.dart';

class SharedPreferenceshelp {
  Future<void> checkUsernameIsStored(BuildContext context, String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString('UserData');
    if (userDataString!= null) {
    Map<String, dynamic> userData = jsonDecode(userDataString);
    if (userData.containsKey(username)) {
      if (userData[username] == password) {
        print('Working');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homescreen() ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password is incorrect')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not found')),
      );
    }}else {
    print('Not Found');
     }
  }
  }
