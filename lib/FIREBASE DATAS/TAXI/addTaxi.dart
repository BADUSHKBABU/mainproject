import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addTaxi extends StatefulWidget {
  const addTaxi({super.key});

  @override
  State<addTaxi> createState() => _addTaxiState();
}

class _addTaxiState extends State<addTaxi> {

  final TextEditingController name=TextEditingController();
  final TextEditingController mob=TextEditingController();
  final TextEditingController place=TextEditingController();
  final TextEditingController type=TextEditingController();
  final CollectionReference collectionReference=FirebaseFirestore.instance.collection("taxi");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("ADD YOUR TAXI"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("assets/taxi.jpg")),
            Text("TAXI NAME"),
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
            ),
            SizedBox(height: 30,),
            Text("TYPE OF TAXI",),
            TextFormField(
              controller: type,
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
      "type":type.text,
      "mobile":mob.text,
      "place":place.text};
    collectionReference.add(data);
    Navigator.pop(context);

  }


}
