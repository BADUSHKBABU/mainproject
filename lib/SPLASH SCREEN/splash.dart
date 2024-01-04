import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';


import '../homepage/seconfpage.dart';
class splash extends StatefulWidget {
  const splash({super.key});


  @override
  State<splash> createState() => _splashState();

}

class _splashState extends State<splash> {
  @override
  void initState() {
 splashscreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Container(child: CircularProgressIndicator(),))
    );
  }

  Future splashscreen() async
  {
    await Future.delayed(Duration(seconds: 5));
    logincondition();

  }

  Future logincondition() async
  {
      final share=await SharedPreferences.getInstance();
      final checkingCondition=share.getBool(data);
      // var name=share.getString(key)
      if(checkingCondition==null || checkingCondition==false)
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){return loginpage();}));
        }
      else
        {
          // final share=await SharedPreferences.getInstance();
          // share.getString(data);
          Navigator.of(context).push(MaterialPageRoute(builder: (context){return homepage();}));
        }
  }
}
