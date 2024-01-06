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
    return Scaffold(appBar: AppBar(title:Text("UDUMBANNOOR PANCHAYATH")),
      body: SafeArea(
        child: Column(
          children: [
            Image(image: AssetImage("assets/udumbannoor.jpg")),
            Image(image: AssetImage("assets/thattakuzha.jpg",),fit: BoxFit.cover ),
            ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return map();}));}, child: Text("map")),
            ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return panchayathdata();}));}, child: Text("data")),
          ],
        ),
      )
    );
  }
}
