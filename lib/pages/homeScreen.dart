import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/controller/login_Controller.dart';
import 'package:shopping/forms/register_form.dart';
import 'package:shopping/pages/auth/login.dart';
import 'package:shopping/pages/auth/register.dart';

import '../controller/register_Controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key,});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Clicking clicking =Clicking();
  Register register = Register();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferenceshelper sharedPreferenceshelper =  SharedPreferenceshelper();
  RegisterForm registerForm = RegisterForm();
  Map<String, dynamic> data ={} ;
 // bool clicking = false;
@override
  void initState() {
    // TODO: implement initState
 showData();
 print(data);
    super.initState();

}

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false,

      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child:Text(
                    'In Below SharePrefrance Data here:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                           height: 300,
                           child: ListView.builder(
                                            itemCount: data.length,
                                            itemBuilder: (context, index) {
                                               String username = data.keys.elementAt(index);
                                                 String password = data[username];
                                                 return ListTile(
                            title: Text('Username: $username'),
                            subtitle: Text('Password: $password'),
                                                 );
                                            },
                                        ),
                         ),
                      ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
            

              clicking.registerclick();
                setState(() {

                });
                print(clicking.touch);

            
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Register()),
                  );*/         },style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
            
                    backgroundColor: Colors.grey),
                    child: Text(
                      'Register',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                    )),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Login()),
                  );         },style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
            
                    backgroundColor: Colors.grey),
                    child: Text(
                      'Logout',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                    )),
              clicking.touch ?  Container(height: 300,
                color: Colors.blue,
                child:RegisterForm(function: () async {
                  sharedPreferenceshelper.saveData(
                      context, usernameController.text,
                      passwordController.text);

                  setState(() {
                    clicking.touch = false;
                  });
                  showData();
                  usernameController.clear();
                  passwordController.clear();
                },
                usernameController: usernameController,
                    passwordController: passwordController,
                )
                ) :SizedBox()
              ],
            ),
          ),
      ),
    );
  }

  Future<Map<String, dynamic>?> showData ()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
   String?  collectData = pref.getString("UserData");
   setState(() {
   data = jsonDecode(collectData!); } );
  }

  void forUpdate (){
  setState(() {
    showData();
  });
  print(" ShowData : ${showData}");
  }
}
class Clicking{
 bool touch = false;
 bool reverse = false;
 void registerclick(){
   touch = !touch;

 }
}
