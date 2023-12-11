import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/FIREBASE%20DATAS/panchayath/addpanchayathdata.dart';
import 'package:statemanagement/FIREBASE%20DATAS/panchayath/panchayathmap.dart';
class panchayathdata extends StatefulWidget {
  const panchayathdata({super.key});

  @override
  State<panchayathdata> createState() => _panchayathdataState();
}

class _panchayathdataState extends State<panchayathdata> {
  final CollectionReference collectionReference=FirebaseFirestore.instance.collection("panchayath");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PANCHAYATH OFFICE"),),floatingActionButton: FloatingActionButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return addPanchayathData();}));},child: Icon(Icons.add),),
      body: StreamBuilder(
        stream:collectionReference.snapshots() ,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return
                ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                      return Container(width: 100,
                        height: 100,color: Colors.grey,
                        child: Column(
                          children: [
                            Text(documentSnapshot["ward"]),
                            Text(documentSnapshot["name"]),
                            Text(documentSnapshot["mobile"]),
                          ],
                        ),
                      );

                    }
                    );

          }
          return Center(child: CircularProgressIndicator());
        },


      ),
    );
  }
}
