

//THIS PAGE LET YOU SIGNUP <AND THEN IT REDIRECTED YOU TO LOGIN PAGE //
//==================================================================//
/////////////////////////////////////////////////////////////////////


import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';
import 'package:statemanagement/SIGNUPPAGE/you_are_redirected_to_loginpage_splash.dart';
import 'package:email_validator/email_validator.dart';
class signup extends StatefulWidget {

  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}
File ?  returnedimage;
class _signupState extends State<signup> {


//FOR SIGNUP YOU NEED TO ENTER USERNAME<PASSWORD AND MAIL ID//
//////////////////////////////////////////////////////////////
  //final TextEditingController username = TextEditingController();
final formkey=GlobalKey<FormState>();
   TextEditingController password = TextEditingController();
   TextEditingController email_id = TextEditingController();

  @override
  void initState() {
    super.initState();
    email_id = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email_id.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SIGN-UP "),),
      //backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/SIGNUP.gif", fit: BoxFit.fill,),
            SizedBox(height: 10,),

            //TEXTFIELDS FOR USERNAME & PASSWORD AND MAIL ID//
            //==============================================//
            Form(
              key: formkey,

              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  //          PASSWORD TEXT FIELD

                  SizedBox(height: 10,),
                  SizedBox(height: 10,),
                  //Text("EMAIL ID", style: TextStyle(fontSize: 20),),
                  TextFormField(
                    controller: email_id,
                     validator: _validateEmail,
                    decoration: InputDecoration(label: Text("e-mail")),

                    // decoration: InputDecoration(filled: true,
                    //     fillColor: Colors.grey,
                    //
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10))
                    // ),
                  ),
                 // Text("PASSWORD", style: TextStyle(fontSize: 20)),
                  TextFormField(

                    validator: _validatePassword,
                    controller: password,
                    // decoration: InputDecoration(filled: true,
                    //     fillColor: Colors.grey,
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10))
                    // ),
                    decoration: InputDecoration(label: Text("password")),
                  ),

                ],
              ),
            ),



            ///BUTTON FOR SIGNUP,IT IS REDIRECTED TO LOGIN PAGE//
            //==========================================//
            ElevatedButton(onPressed: () {
              // signup();
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context){return redirectedtologinpage();}));
              if (formkey.currentState!.validate()) {
                    // Perform sign-up or further actions
                    // For example, save the data to a database
                    // Here, we are just printing the email and password
                    print('Email: ${email_id.text}');
                    print('Password: ${password.text}');
                    signup();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return redirectedtologinpage();}));
              }



            }, child: Text("SIGN UP")),



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
        email: email_id.text,
        password: password.text,

      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context){return redirectedtologinpage();}));

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

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
     }

  // Validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
Future imagepickergallery() async{
  final _image=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(_image==null) return;
  setState(() {
    returnedimage=File(_image!.path);
  });
}
Future imagepickercamera() async{
  final _image=await ImagePicker().pickImage(source: ImageSource.camera);
  if(_image==null) return;
  setState(() {
    returnedimage=File(_image!.path);
  });
}

}







//
// class signuppage extends StatefulWidget {
//   @override
//   _signuppageState createState() => _signuppageState();
// }
//
// class _signuppageState extends State<signuppage> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;
//   bool _isObscure = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   // Validate email format
//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email';
//     }
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }
//
//   // Validate password
//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your password';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up Page'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: _validateEmail,
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   suffixIcon: IconButton(
//                     icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText: _isObscure,
//                 validator: _validatePassword,
//               ),
//               SizedBox(height: 24.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Perform sign-up or further actions
//                     // For example, save the data to a database
//                     // Here, we are just printing the email and password
//                     print('Email: ${_emailController.text}');
//                     print('Password: ${_passwordController.text}');
//                     signup();
// Navigator.of(context).push(MaterialPageRoute(builder: (context){return redirectedtologinpage();}));
//                   }
//
//                 },
//                 child: Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future signup() async
//   {
//       try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
// }
