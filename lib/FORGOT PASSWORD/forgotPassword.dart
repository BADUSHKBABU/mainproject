

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/FORGOT%20PASSWORD/forgotPasswordredirect.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}



class _forgotpasswordState extends State<forgotpassword> {
  final formkey=GlobalKey<FormState>();
  final email=TextEditingController();
  @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   super.initState();
  //   email=TextEditingController();
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot password"),),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/forgotpassword.jpg"),
              SizedBox(height: 50,),
              TextFormField(
                controller: email,
                validator: _validateEmail,
                decoration: InputDecoration(
                  label: Text("E-mail"),
                  hintText: "eg: mail@gmail.com"
                ),
              ),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
          resetPassword(email.text);
          Navigator.of(context).push(MaterialPageRoute(builder: (context){return forgotPasswordRedirect();}));              }
              }, child: Text("Get link at mail-id "))
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
  }
  Future<void> resetPassword(String email) async {

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);


  }
}
