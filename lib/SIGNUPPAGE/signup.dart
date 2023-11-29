

//THIS PAGE LET YOU SIGNUP <AND THEN IT REDIRECTED YOU TO LOGIN PAGE //
//==================================================================//
/////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';
import 'package:statemanagement/SIGNUPPAGE/you_are_redirected_to_loginpage_splash.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

//FOR SIGNUP YOU NEED TO ENTER USERNAME<PASSWORD AND MAIL ID//
//////////////////////////////////////////////////////////////
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email_id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/udumbannoorgate.jpg", fit: BoxFit.fill,),
            SizedBox(height: 10,),

            //TEXTFIELDS FOR USERNAME & PASSWORD AND MAIL ID//
            //==============================================//
            Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("USER NAME", style: TextStyle(fontSize: 20)),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))
                  ),
                ),
                SizedBox(height: 10,),

                //          PASSWORD TEXT FIELD
                Text("PASSWORD", style: TextStyle(fontSize: 20)),
                TextField(
                  controller: password,
                  decoration: InputDecoration(filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                Text("EMAIL ID", style: TextStyle(fontSize: 20),),
                TextField(
                  controller: email_id,
                  decoration: InputDecoration(filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))
                  ),
                ),

              ],
            ),


//  WHEN CLICK SIGNUP TO SHOULD SAVED IN FIREBASE DATABASE(FIREBASE NOT ADDED THOUGH (23/11/2023))//
////////////////////////////////////////////////////////////////////////////////////////////////////
            //BTTON FOR SIGNUP,IT IS REDIRECTED TO LOGIN PAGE//
            //==========================================//
            ElevatedButton(onPressed: () {
              signup();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return redirectedtologinpage();
              }));

            }, child: Text("SIGN UP"))

          ],
        ),
      ),
    );
  }

  Future signup() async
  {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: username.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
