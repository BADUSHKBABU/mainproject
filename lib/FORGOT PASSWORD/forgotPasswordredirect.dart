import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';

class forgotPasswordRedirect extends StatefulWidget {
  const forgotPasswordRedirect({super.key});

  @override
  State<forgotPasswordRedirect> createState() => _forgotPasswordRedirectState();
}

class _forgotPasswordRedirectState extends State<forgotPasswordRedirect> {
  @override
  void initState() {
    // TODO: implement initState
navigatetologinpage();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/please wait.gif",fit: BoxFit.contain),),
    );
  }

  Future navigatetologinpage() async{
   await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){return loginpage();}), (route) => false);
  }
}
