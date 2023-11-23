import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aPPBAR extends StatefulWidget {
  const aPPBAR({super.key});

  @override
  State<aPPBAR> createState() => _aPPBARState();
}

class _aPPBARState extends State<aPPBAR> {
  @override
  Widget build(BuildContext context) {
    return
       AppBar(title: Text("HELLO UDUMBANNOOR",style: TextStyle(fontSize: 20,color: Colors.grey )));

  }
}
