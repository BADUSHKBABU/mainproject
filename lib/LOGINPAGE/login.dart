import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/APPBAR/appbar.dart';
import 'package:statemanagement/LOGINPAGE/logindata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/SIGNUPPAGE/signup.dart';
import 'package:statemanagement/Sharedpreference/savedata.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../TESTCODE/testing.dart';
import '../homepage/homepage.dart';

final data="userLoginCredential";
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}
final formkey=GlobalKey<FormState>();
class _loginpageState extends State<loginpage> {
  bool noid = false;


  //          CREATING BLUEPRINT OF FIREBASE DATA AS collection
  //==================================================================
  final CollectionReference collection = FirebaseFirestore.instance.collection(
      "USER CREDENTIALS"); //CREATED A COLLECTION WITH NAME "USER CREDENTIALS"
  //==================================================================


  // TEXT EDITING CONTROLER FOR USERNAME,PASSWORD,AND MAIL
  //=================================================================

  final password = TextEditingController();
  final email = TextEditingController();

  //=================================================================
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<logindata>(context, listen: true);

    return Scaffold(appBar: AppBar(backgroundColor: Colors.grey,
      title: Text("Hello Udumbannoor",),),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height, width: MediaQuery
            .of(context)
            .size
            .width,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover,
              image: Image
                  .asset("assets/udumbannoor.jpg",
                  height: MediaQuery
                      .of(context)
                      .size
                      .height, width: MediaQuery
                      .of(context)
                      .size
                      .width)
                  .image,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/udumbannoor.jpg"),
              SingleChildScrollView(

                //GLASSMORPHIC CONTAINER
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: GlassmorphicContainer(width:MediaQuery.of(context).size.width,blur: 20,border:20,borderGradient:LinearGradient(colors: [Colors.white10]),borderRadius: 20,height: 400,linearGradient:LinearGradient(colors: [Colors.greenAccent]) ,
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Text("LOGIN TO KNOW ALL ABOUT UDUMBANNOOR",

                              //LOGIN TEXTFIELD
                        //                                          ====================
                              //USER NAME TEXT FIELD
                              style: TextStyle(
                                  fontSize: 20, color: Colors.yellow),),
                            TextFormField(
                              controller: email,
                              validator: _validateEmail,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))
                              ),
                            ),
                            SizedBox(height: 10,),


                            //          PASSWORD TEXT FIELD
                            TextFormField(
                              controller: password,
                              validator: _validatePassword,
                              obscureText: true,
                              decoration: InputDecoration(filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))
                              ),
                            ),


                            ///                                            LOGIN BUTTON
                        //                                           ==============
                            ElevatedButton(onPressed: () {
                              if(formkey.currentState!.validate()){
                                login(context);
                              }


                              // savelogincredential(context);
                              // provider.getdatafromloginpage(username.text);
                            }, child: Text("login")),


                        //                                            SIGNUP BUTTON
                        //                                          =================
                            Text("New to the app? \nSignup", style: TextStyle(
                                fontSize: 20, color: Colors.green),),
                            ElevatedButton(onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return
                                      signup();
                                    //signuppage();
                                    //Signup on test.dart for testing code ...original at signup
                                  }));
                            },
                                child: Text("Signup")),
                            // Text(login())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//     SANING SHAREDPREFERENCE
  Future savelogincredential(context) async
  {
    final share = await SharedPreferences.getInstance();
    share.setBool(data, true);
  }

  //  FOR SAVING USERNAME:=
  savecredential(data) async
  {
    final share = await SharedPreferences.getInstance();
    share.setString("data", data);
  }


//FIREBASE AUTHENTICATION
  login(context) async
  {
    showDialog(context: context, barrierDismissible: false, builder: (context) {
      return Center(child: CircularProgressIndicator());
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,

      );
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return homepage();
          }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ckeckinglogin(context);

        print('No user found for that email.');
      }

      else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print(e);
    }
  }

  ckeckinglogin(context) {
    if (noid == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("no username found")));
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
  }
}
