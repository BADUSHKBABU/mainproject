// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// class akshaya extends StatefulWidget {
//   const akshaya({super.key});
//
//   @override
//   State<akshaya> createState() => _akshayaState();
// }
//
// class _akshayaState extends State<akshaya> {
//   final CollectionReference collectionReference=FirebaseFirestore.instance.collection("akshayacenter");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("AKSHAYA CENTERS"),),
//       body: Column(
//         children: [
//           StreamBuilder(stream:collectionReference.snapshots(),
//               builder: (context,snapshot)
//           {
//             if(snapshot.hasData)
//               {
//                 return ListView.builder(itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context,index){
//                   final DocumentSnapshot documentsnapshot=snapshot.data!.docs[index];
//                    return Container(width: 100,
//                      height: 500,color: Colors.green,
//                      child: Column(
//                        children: [
//                          Text("AKSHAYA NAME :${documentsnapshot["place"]}"),
//                          Text("CONTACT   :${documentsnapshot["mobile"]}"),
//                          Text("GMAIL :${documentsnapshot["gmail"]}"),                 ],
//                      ),
//                    );
//                     });
//
//               }
//             return CircularProgressIndicator();
//           })
//         ],
//       ),
//     );
//   }
// }
import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class akshya extends StatefulWidget {
  const akshya({super.key});

  @override
  State<akshya> createState() => _akshyaState();
}

class _akshyaState extends State<akshya> {
  final CollectionReference collectionReference=FirebaseFirestore.instance.collection("akshaya");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AKSHAYA CENTER"),shadowColor: Colors.blue,backgroundColor: Colors.blue),
      body: StreamBuilder(
        stream:collectionReference.snapshots() ,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return
              ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                    return ClayAnimatedContainer(width: MediaQuery.of(context).size.width,
                      height: 100,color: Colors.greenAccent,parentColor: Colors.black,
                      child: ListView(
                        children: [
                          //Text(documentSnapshot["place"]),
                         // Center(child: Text("AKSHAYA LOCATION: ",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                          Center(child: Text("${documentSnapshot["name"]}",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),)),
                          //Center(child: Text("CONTACT NUMBER: ",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                          Center(child: Text("${documentSnapshot["mobile"]}",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),)),
                          Center(child: Text("${documentSnapshot["contact"]}",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),)),
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

