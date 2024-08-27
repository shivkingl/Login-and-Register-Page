
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/controller/login_Controller.dart';
import 'package:shopping/controller/register_Controller.dart';
import 'package:shopping/pages/homeScreen.dart';


import 'login.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final usernameController=TextEditingController();
  final passwordController  = TextEditingController();
  SharedPreferenceshelper sharedPreferenceshelper =  SharedPreferenceshelper();
  SharedPreferenceshelp sharedPreferenceshelp = SharedPreferenceshelp();
  bool validusername = false;
  bool validpassword = false;

  void buttonVisible() {
    setState(() {
      validusername = usernameController.text.length == 10;
      validpassword = passwordController.text.length >= 8;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(onTap: (){Navigator.pop(context);},
              child: Icon(CupertinoIcons.back,color: Colors.black,)),
        ),
          body: Form(
            key: formKey,
            child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                     controller: usernameController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length < 10) {
                        return 'Phone number must be at least 10 digits';
                      }
                      validusername = true;
                    },
                    onChanged: (value) {
                      buttonVisible();
                    },
                    onSaved: (value) => usernameController.text = value!,
                  ),

          SizedBox(height: 20,
          ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',

                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please create your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                    },
                    onChanged: (value) {
                      buttonVisible();
                    },
                    onSaved: (value) => passwordController.text = value!,
                  ),
      SizedBox(height: 20,),
                  ElevatedButton( onPressed: validusername && validpassword ? () async{
      if(formKey.currentState!.validate()){
      sharedPreferenceshelper.saveData(context,usernameController.text , passwordController.text);}
                  setState(() {

                  });

                   }:null ,

                  style: ElevatedButton.styleFrom( minimumSize: Size.fromHeight(40),

                      backgroundColor: validusername && validpassword ? Colors.brown : Colors.white,), // Change button color based on validation),
                      child: Text(
                        'SignUp',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                      ),
      ),
      SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Login()),
                    );         },style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),

                      backgroundColor: Colors.grey),
                      child: Text(
                        'Login',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                      )),]),
          )
    );
  }

  Future<void> instance()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList("UserData");
  }
  }

