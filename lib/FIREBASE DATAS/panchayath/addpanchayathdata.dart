import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/FIREBASE%20DATAS/panchayath/panchayath.dart';
class addPanchayathData extends StatefulWidget {
  const addPanchayathData({super.key});

  @override
  State<addPanchayathData> createState() => _addPanchayathDataState();
}

class _addPanchayathDataState extends State<addPanchayathData> {
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection("panchayath");
  final TextEditingController ward = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController mobile_number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add panchayath members"),),
      body: ClayContainer(color: Colors.grey,
        child: Column(
          children: [
            Image(image: AssetImage("assets/panchayath.png")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ward,
                decoration: InputDecoration(
                    hintText: "Enter ward number",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white
                ),
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Enter ward member name",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white
                ),
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: mobile_number,
                decoration: InputDecoration(
                    hintText: "Enter mobile number",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              add();
            }, child: Text("ADD"))
          ],
        ),
      ),
    );
  }

  add() async
  {
    final data = await {"ward": ward.text,
      "name": name.text, "mobile": mobile_number.text
    };
    collectionReference.add(data);
    Navigator.of(context).pop(panchayathdata());
  }
}