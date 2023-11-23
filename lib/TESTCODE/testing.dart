import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../APPBAR/appbar.dart';
class test extends StatelessWidget {
  test({super.key});

  final TextEditingController name = TextEditingController();
  final share = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    ListView.builder(itemBuilder:(context ,int){
      return ClayContainer(
        child: Container(
          child: Column(
            children: [
              Center(
                child: ClayContainer(
                  child: TextButton(
                      onPressed: () {},
                      child:  Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.medical_information),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("medical",style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      )
                  ),
                ),
              ),

              ClayContainer(
                child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.public),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(" Notification",style: TextStyle(color: Colors.red),),
                        ),
                      ],
                    )
                ),
              ),

              // ClayContainer(
              //   child: TextButton(
              //       onPressed: () {},
              //       child:  Column(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Icon(Icons.sports),
              //           ),
              //           Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Text("sports",style: TextStyle(color: Colors.red),),
              //           ),
              //         ],
              //       )
              //   ),
              // ),

              ClayContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child:  Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Icon(Icons.emergency),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Emergency",style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      )
                  ),
                ),
              )

            ],
          ),
        ),
      );
    }));
  }
}