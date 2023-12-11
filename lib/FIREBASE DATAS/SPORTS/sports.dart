import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class sports extends StatefulWidget {
  const sports({super.key});

  @override
  State<sports> createState() => _sportsState();
}


class _sportsState extends State<sports> {
  final CollectionReference collectionReference =FirebaseFirestore.instance.collection("sports");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sports"),backgroundColor: Colors.red,),
      body: StreamBuilder(
        stream: collectionReference.snapshots(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
              {
                return ListView.builder(itemCount: snapshot.data!.docs.length,
                    itemBuilder:(context, index){
                  final DocumentSnapshot documentSnapshot=snapshot.data!.docs[index];
                  return ClayContainer(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text(documentSnapshot["organization"]),
                        Text(documentSnapshot["contact name"]),
                        Text(documentSnapshot["phone"]),
                      ],
                    ),
                  );
                    }
                );
              }
            return Center(  child: CircularProgressIndicator());
          }


      ),
    );
  }
}
