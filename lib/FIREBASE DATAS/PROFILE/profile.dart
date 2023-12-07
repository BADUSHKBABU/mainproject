import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  // final FirebaseFirestore
  final TextEditingController user=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController pasw =TextEditingController();

  final firebase= FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PROFILE"),),
      body: SingleChildScrollView (
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        
              children: [
                Image.asset("assets/udumbannoor.jpg"),
                Text("User Name:"),
                TextFormField(
                  controller: user,
                  decoration: InputDecoration(hintText: "User name" ,fillColor:Colors.white,filled: true,
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 30,),
                Text("Mail Id:"),
                TextFormField(
                  controller: mail,
                  decoration: InputDecoration(hintText: "E-mail" ,fillColor:Colors.white,filled: true,
                    border: OutlineInputBorder()
                  ),
                ),
              ElevatedButton(onPressed: (){}, child: Text("update"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
