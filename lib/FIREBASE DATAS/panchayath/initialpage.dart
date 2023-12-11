import 'package:flutter/material.dart';
import 'package:statemanagement/FIREBASE%20DATAS/panchayath/panchayath.dart';
import 'package:statemanagement/FIREBASE%20DATAS/panchayath/panchayathmap.dart';
class initial extends StatefulWidget {
  const initial({super.key});

  @override
  State<initial> createState() => _initialState();
}

class _initialState extends State<initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image(image: AssetImage("assets/udumbannoor.jpg")),
            Image(image: AssetImage("assets/thattakuzha.jpg")),
            ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return map();}));}, child: Text("map")),
            ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return panchayathdata();}));}, child: Text("data")),
          ],
        ),
      )
    );
  }
}
