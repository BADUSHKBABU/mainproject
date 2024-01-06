import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addmedicalshop extends StatefulWidget {
  const addmedicalshop({super.key});

  @override
  State<addmedicalshop> createState() => _addmedicalshopState();
}

class _addmedicalshopState extends State<addmedicalshop> {

  final TextEditingController name=TextEditingController();
  final TextEditingController mob=TextEditingController();
  final TextEditingController place=TextEditingController();
  final CollectionReference collectionReference=FirebaseFirestore.instance.collection("medicalshop");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("ADD YOUR MEDICALSHOP"),actions: [IconButton(onPressed: (){addmedicalshop();}, icon: Icon(Icons.add))],),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image(image: AssetImage("assets/restaurant.jpg")),
            Text("CONTACT NAME"),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
            SizedBox(height: 30,),
            Text("CONTACT NUMBER",),
            TextFormField(
              controller: mob,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
            SizedBox(height: 30,),
            Text("PLACE"),
            TextFormField(
              controller: place,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey
              ),
            ),
            ElevatedButton(onPressed: (){Add();}, child: Text("ADD"))
          ],
        ),
      ),


    );
  }

  Future Add() async{
    final data={"name":name.text,
      "number":mob.text,
      "place":place.text};
    collectionReference.add(data);
    Navigator.pop(context);

  }


}
