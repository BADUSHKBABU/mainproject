import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addpostoffice extends StatefulWidget {
  const addpostoffice({super.key});

  @override
  State<addpostoffice> createState() => _addpostofficeState();
}

class _addpostofficeState extends State<addpostoffice> {

  final TextEditingController name=TextEditingController();
  final TextEditingController mob=TextEditingController();
  final TextEditingController place=TextEditingController();
  final CollectionReference collectionReference=FirebaseFirestore.instance.collection("postoffice");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("ADD POST OFFICE"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("assets/India_Post_Logo.svg.PNG")),
            Text("post office"),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
            SizedBox(height: 30,),
            Text("MOBILE NUMBER",),
            TextFormField(
              controller: mob,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey
              ),

            ),   SizedBox(height: 30,),
            Text("LOCATION"),
            TextFormField(
              controller: place,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),

            // Text("PLACE"),
            // TextFormField(
            //   controller: place,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       filled: true,
            //       fillColor: Colors.grey
            //   ),
            // ),
            ElevatedButton(onPressed: (){Add();}, child: Text("ADD"))
          ],
        ),
      ),


    );
  }

  Future Add() async{
    final data={"name":name.text,
      "mobile":mob.text,
      "place":place.text
    };
    collectionReference.add(data);
    Navigator.pop(context);

  }


}
