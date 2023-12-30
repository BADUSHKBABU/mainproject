import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/FIREBASE%20DATAS/RESTAURANT/add_restaurant.dart';

class restaurant extends StatefulWidget {
  const restaurant({super.key});

  @override
  State<restaurant> createState() => _restaurantState();
}

class _restaurantState extends State<restaurant> {
  final CollectionReference hotel= FirebaseFirestore.instance.collection("restaurant");
  @override
  Widget build(BuildContext context) {
///       READING DATA FROM DATABASE
///       ************************
    return   Scaffold(
      appBar: AppBar(title: Text("RESTAURANTS"),backgroundColor: Colors.orange,
        actions: [
        IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return addRestaurant();}));}, icon: Icon(Icons.add),
        )],),
      body:StreamBuilder(
          stream: hotel.snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              print(snapshot.error);
            }
            if (!snapshot.hasData)
            {


            return Center(child: CircularProgressIndicator(semanticsLabel: "CONTENT IS LOADING..",));
          }

    return ListView.builder(
    itemCount:snapshot.data!.docs.length,
    itemBuilder: (context,index){
    final DocumentSnapshot documentSnapshot=snapshot.data!.docs[index];

    return ClayContainer(
    width: MediaQuery.of(context).size.width/6,
    height: MediaQuery.of(context).size.height/6,
    color: Colors.white,
    child:
    Container(
    color: Colors.grey,
    child: Center(
    child:  Column(mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Text("RESTAURANT NAME :${documentSnapshot["name"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),
    Text("MOBILE NUMBER :${documentSnapshot["mobile"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),
    Text("  PLACE : ${documentSnapshot["place"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),

    ],
    ),
    )
    ),

    ///         BUTTON FOR ADDING RESTAURANT


    );

    });}


    )
    );
  }
}

// Container(
// width: MediaQuery.of(context).size.width/4,
// height: MediaQuery.of(context).size.height/4,
// color: Colors.white,
// child:
// Container(
// color: Colors.grey,
// child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(child: Column(
// children: [
// Text("RESTAURANT NAME : ${documentSnapshot["name"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),
// Text("  MOBILE NUMBER : ${documentSnapshot["mobile"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),
// Text("  PLACE : ${documentSnapshot["place"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),
// ],
// ),),
// ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return addRestaurant();}));}, child: Column(
// children: [
// Text("ADD YOUR RESTAURANT",style: TextStyle(color: Colors.black),),
// IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.backspace))
// ],
// ))
// ],
// )
// ),