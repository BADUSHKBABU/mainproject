

//THIS CODE IS REDIRECTED YOU TO LOGIN PAGE ONCE YOU SIGNUP
//============================================================
import 'package:flutter/material.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';
class redirectedtologinpage extends StatefulWidget {
  const redirectedtologinpage({super.key});

  @override
  State<redirectedtologinpage> createState() => _redirectedtologinpageState();
}

class _redirectedtologinpageState extends State<redirectedtologinpage> {
  @override
  void initState() {
    navigateToLoginPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("YOU will be  REDIRECTED TO LOGIN PAGE ",style: TextStyle(fontSize: 20),),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  Future navigateToLoginPage() async
  {
   // Duration(seconds: 5);
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return loginpage();}));
  }
}
