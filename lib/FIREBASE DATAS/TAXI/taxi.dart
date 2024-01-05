import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/FIREBASE%20DATAS/RESTAURANT/add_restaurant.dart';

import 'addTaxi.dart';

class taxi extends StatefulWidget {
  const taxi({super.key});

  @override
  State<taxi> createState() => _taxiState();
}

class _taxiState extends State<taxi> {
  final CollectionReference hotel= FirebaseFirestore.instance.collection("taxi");
  @override
  Widget build(BuildContext context) {
    ///       READING DATA FROM DATABASE
    ///       ************************
    return   Scaffold(
      appBar: AppBar(title: Text("TAXI"),backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return addTaxi();}));}, icon: Icon(Icons.add),
          )],),
      body:StreamBuilder(
        stream: hotel.snapshots(),
        builder: (context,snapshot){
          if (snapshot.hasData)
          {
            return ListView.builder(
                itemCount:snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  final DocumentSnapshot documentSnapshot=snapshot.data!.docs[index];

                  return

                    ClayContainer(
                      width: MediaQuery.of(context).size.width/6,
                      height: 100,
                      color: Colors.white,
                      child:
                      Container(
                          color: Colors.black,
                          child: ListView(
                            children: [
                                    Center(child: Text(documentSnapshot["name"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                                    Center(child: Text(documentSnapshot["place"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                                    Center(child: Text(documentSnapshot["type"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                                    Center(child: Text(documentSnapshot["mobile"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                            Divider(thickness: 10,color: Colors.white,)
                            ],
                          )
                      ),

                      ///         BUTTON FOR ADDING RESTAURANT


                    );

                });
          }
          return CircularProgressIndicator();
        },

      ),
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