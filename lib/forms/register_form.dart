import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final Function()? function;
  final TextEditingController? usernameController;
  final TextEditingController? passwordController;

  RegisterForm({this.function, this.usernameController, this.passwordController});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _validUsername = false;
  bool _validPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: widget.usernameController,
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
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _validUsername = value.length == 10;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: widget.passwordController,
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
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _validPassword = value.length >= 8;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validUsername && _validPassword ? widget.function : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(60),
                  backgroundColor: _validUsername && _validPassword ? Colors.brown : Colors.white,
                ),
                child: Text(
                  'SignUp',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}