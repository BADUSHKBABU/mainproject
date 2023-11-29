import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';
import 'package:statemanagement/LOGINPAGE/logindata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:statemanagement/SECONFPAGE/seconfpage.dart';
import 'package:statemanagement/SIGNUPPAGE/signup.dart';
import 'package:statemanagement/SPLASH%20SCREEN/splash.dart';
import 'package:statemanagement/TESTCODE/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{

  //            FIREBASE INITIALISING STEP
  //=================================================================================
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //=================================================================================

  //            PROVIDER INITIALIZED
  //==================================================================================
  runApp( MultiProvider(
    providers: [ChangeNotifierProvider(create: (context)=>logindata())],
      child: MyApp()));
//====================================================================================
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: //splash(),
      homepage()
      //test()


      //THIS WILL BE ENABLED ONCE HOMEPAGE OVER //
      //========================================//
      //FIREBASE AUTHENTICATION??
      //=========================//
        // StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context,snapshot){
        //     if(snapshot.connectionState==ConnectionState.waiting)
        //     {
        //       return Center(child: CircularProgressIndicator(),);
        //     }
        //     else if(snapshot.hasData){
        //       return homepage();
        //     }
        //     else
        //       return loginpage();
        //   },
        // )

//              FIREBASE CODE ENDS HERE
//              =======================
      //loginpage()//test()
      //splash()
      //loginpage(),
    );
  }
}
