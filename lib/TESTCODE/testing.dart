// import 'dart:async';
// import 'package:flutter/material.dart';
//
//
//
// class ClockWidget extends StatefulWidget {
//   @override
//   _ClockWidgetState createState() => _ClockWidgetState();
// }
//
// class _ClockWidgetState extends State<ClockWidget> {
//   String _currentTime="" ;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the clock with the current time
//     _updateTime();
//     // Update the time every second
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       _updateTime();
//     });
//   }
//
//   void _updateTime() {
//     setState(() {
//       _currentTime = DateTime.now().toString().substring(11, 19);
//       // Formats the time as HH:MM:SS
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       _currentTime,
//       style: TextStyle(
//         fontSize: 48.0,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class imagepick extends StatefulWidget {
  const imagepick({super.key});

  @override
  State<imagepick> createState() => _imagepickState();
}
File ? returnedimage;

class _imagepickState extends State<imagepick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("image picker"),),
          body: Column(children: [
            ElevatedButton(onPressed: (){imagepickergallery();}, child: Text("image from gallery")),
            ElevatedButton(onPressed: (){imagepickercamera();}, child: Text("image from camera")),
            returnedimage!=null ? Image.file(returnedimage!)
                :Text("pls select an image")
          ],


    ),
    );
  }

  Future imagepickergallery() async{
    final _image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(_image==null) return;
    setState(() {
      returnedimage=File(_image!.path);
    });
  }
  Future imagepickercamera() async{
    final _image=await ImagePicker().pickImage(source: ImageSource.camera);
    if(_image==null) return;
    setState(() {
      returnedimage=File(_image!.path);
    });
  }
}
