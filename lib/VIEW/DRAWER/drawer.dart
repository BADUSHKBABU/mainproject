import 'package:flutter/material.dart';

import '';
import 'package:clay_containers/clay_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:statemanagement/ADD%20YOUR%20BUISNESS/addyourbuisness.dart';

import 'package:statemanagement/MODEL/FUNCTIONS/currenttime.dart';
import '';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(

                ///              ACCOUNAME WILL BE FETCHED FROM FIREBASE AUTH
                accountName: Text(user.email!),

                ///              EMAIL ID WIL BE FETCHED FROM FIREBASE AUTH
                accountEmail: Text(user.email!),
                currentAccountPicture: CircleAvatar(),
              ),
              //Drawer Head

              //Drawer rows
              //Row1 "HOME"
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(
                    child: TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){return homepage();}));}, child: Text("HOME"))),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(child: TextButton(onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return addbuisness();
                      }));
                }, child: Text("ADD YOUR BUISNESS"))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(child: TextButton(onPressed: () {
                  contactUs();
                }, child: Text("CONTACT US"))),

              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(child: TextButton(onPressed: () {
                  Exit(context);
                }, child: Text("Exit"))),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(child: TextButton(onPressed: () {sendEmail()
                ;
                }, child: Text("Feedback"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: time(),
              )
            ],
          ),
        ),,
    );
  }

}
