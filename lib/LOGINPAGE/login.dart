import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/APPBAR/appbar.dart';
import 'package:statemanagement/LOGINPAGE/logindata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:statemanagement/SECONFPAGE/seconfpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/SIGNUPPAGE/signup.dart';
import 'package:statemanagement/Sharedpreference/savedata.dart';
import 'package:firebase_auth/firebase_auth.dart';

final data="userLoginCredential";
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


  //          CREATING BLUEPRINT OF FIREBASE DATA AS collection
  //==================================================================
  final CollectionReference collection = FirebaseFirestore.instance.collection(
      "USER CREDENTIALS"); //CREATED A COLLECTION WITH NAME "USER CREDENTIALS"
  //==================================================================


  // TEXT EDITING CONTROLER FOR USERNAME,PASSWORD,AND MAIL
  //=================================================================
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  //=================================================================


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
                    child: Column(
                      children: [
                        Text("LOGIN TO KNOW ALL ABOUT UDUMBANNOOR",

                          //LOGIN TEXTFIELD
//                                          ====================
                          //USER NAME TEXT FIELD
                          style: TextStyle(
                              fontSize: 20, color: Colors.yellow),),
                        TextField(
                          controller: username,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))
                          ),
                        ),
                        SizedBox(height: 10,),


                        //          PASSWORD TEXT FIELD
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))
                          ),
                        ),


//                                            LOGIN BUTTON
//                                           ==============
                        ElevatedButton(onPressed: () {
                           login();

                                                                    // Navigator.of(context).push(
                                                                    //     MaterialPageRoute(builder: (context) {
                                                                    //       return homepage();
                                                                    //     }));
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
                                return signup();
                              }));
                        },
                            child: Text("Signup")),
                      ],
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
  login() async
  {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print(e);
    }
  }
}
