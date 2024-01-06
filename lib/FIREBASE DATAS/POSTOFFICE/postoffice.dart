import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/FIREBASE%20DATAS/POSTOFFICE/add_postoffice.dart';
import 'package:statemanagement/FIREBASE%20DATAS/RESTAURANT/add_restaurant.dart';

class postoffice extends StatefulWidget {
  const postoffice({super.key});

  @override
  State<postoffice> createState() => _postofficeState();
}

class _postofficeState extends State<postoffice> {
  final CollectionReference postoffice= FirebaseFirestore.instance.collection("postoffice");
  @override
  Widget build(BuildContext context) {
    ///       READING DATA FROM DATABASE
    ///       ************************
    return   Scaffold(
      appBar: AppBar(title: Text("POST OFFICE"),backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return addpostoffice();}));}, icon: Icon(Icons.add),
          )
        ],),
      body:StreamBuilder(
        stream: postoffice.snapshots(),
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
                      color: Colors.yellowAccent,
                      child:
                      ListView(
                        children: [
                          Center(
                            child: Container(height:800,child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${documentSnapshot["name"]}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                                Text("${documentSnapshot["mobile"]}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                                Text("${documentSnapshot["place"]}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                                //Text("  PLACE : ${documentSnapshot["location"]}",style: TextStyle(fontSize: 20,color: Colors.white,)),

                              ],
                            ),),
                          ),

                        ],
                      ),

                      ///         BUTTON FOR ADDING RESTAURANT


                    );

                });
          }
          return Center(child: CircularProgressIndicator(semanticsLabel: "CONTENT IS LOADING..",));
        },

      ),
    );

  }
}