import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addRestaurant extends StatefulWidget {
  const addRestaurant({super.key});

  @override
  State<addRestaurant> createState() => _addRestaurantState();
}

class _addRestaurantState extends State<addRestaurant> {

  final TextEditingController name=TextEditingController();
  final TextEditingController mob=TextEditingController();
  final TextEditingController place=TextEditingController();
  final CollectionReference collectionReference=FirebaseFirestore.instance.collection("restaurant");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(title: Text("ADD YOUR RESTAURANT"),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage("assets/restaurant.jpg")),
                Text("RESTAURANT NAME"),
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
    "mobile":mob.text,
    "place":place.text};
    collectionReference.add(data);
    Navigator.pop(context);

  }


}
