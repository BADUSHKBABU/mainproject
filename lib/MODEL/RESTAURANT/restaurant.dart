import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/MODEL/RESTAURANT/add_restaurant.dart';


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
    height: 100,
    color: Colors.white,
    child:
    Center(
    child:  ListView(
    children: [
    // Center(child: Text("RESTAURANT NAME :",style: TextStyle(fontSize: 20,color: Colors.white,))),
    Center(child: Text(documentSnapshot["name"],style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
    Center(child: Text(documentSnapshot["place"],style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
    Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
        IconButton(onPressed: (){}, icon: Icon(Icons.location_on_rounded)),
        IconButton(onPressed: (){}, icon: Icon(Icons.message)),
      ],
    )),
    Divider(color: Colors.white,thickness: 10,)


    //Center(child: Text("MOBILE NUMBER :${documentSnapshot["mobile"]}",style: TextStyle(fontSize: 20,color: Colors.white,))),
       // Center(child: Text("  PLACE : ${documentSnapshot["place"]}",style: TextStyle(fontSize: 20,color: Colors.white,))),

    ],
    ),
    ),

    ///         BUTTON FOR ADDING RESTAURANT


    );

    });}


    )
    );
  }


}

