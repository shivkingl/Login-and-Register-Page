import 'package:flutter/material.dart';
import 'package:shopping/pages/auth/register.dart';

import '../../controller/login_Controller.dart';
import '../homeScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPreferenceshelp sharedPreferenceshelp = SharedPreferenceshelp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key:loginKey,
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
                  return 'Please  enter register mobile number';
                }
                return null;
              },
            ),

            SizedBox(height: 20,),
            Center(
              child: TextFormField(
                controller:passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',


                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                },


              ),
            ),SizedBox(height: 40,),
            ElevatedButton( onPressed: ()async{
if(loginKey.currentState!.validate()){
 sharedPreferenceshelp.checkUsernameIsStored(context, usernameController.text,passwordController.text);}
setState(() {
});
              },
    style: ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(50),

    backgroundColor: Colors.grey),
    child: Text(
    'Submit',
    style: const TextStyle(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
    ),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Register()),
              );         },style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),

                backgroundColor: Colors.grey),
                child: Text(
                  'Register',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                )),

            SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
