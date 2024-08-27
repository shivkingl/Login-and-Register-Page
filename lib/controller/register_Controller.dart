import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/pages/homeScreen.dart';

class SharedPreferenceshelper {
 Clicking clicking =Clicking();
 Future<void> saveData(BuildContext context ,String username, String password ) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('case01');
  String? userDataString = prefs.getString('UserData');
  print('case02');
  Map<String, dynamic> userData;
  print('case03');
  if (userDataString!= null) {
   userData = jsonDecode(userDataString);
   if(userData.containsKey(username) )
   { ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('User is already register Please LogIn')),
   );
    }else{

    userData[username] = password;
    print(userData);
    String userDataStored = jsonEncode(userData);
    await prefs.setString('UserData', userDataStored);
    print(userDataStored);
  //  clicking.touch = false;
   /* Navigator.pushReplacement(
     context,
     MaterialPageRoute(builder: (context) =>Homescreen()),
    );*/
   }
   print("Is Soted $userData");
  } else{
   userData = {};
   print("Is not Stored $userData");
   userData[username] = password;
  print(userData);
  String userDataStored = jsonEncode(userData);
  await prefs.setString('UserData', userDataStored);
 print(userDataStored);
 Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>Homescreen()),
   );}
}}




















/*Future<void> datashow()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.getString('showKey');
  Map<String, dynamic> userData = {
   "Username": "Tarun",
   "Password": "1234565789",
   "email": "tarunbharg@gmail.com"
  };

}*/