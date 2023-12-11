import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Redirect'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _launchWhatsApp();
            },
            child: Text('Open WhatsApp'),
          ),
        ),
      ),
    );
  }

  _launchWhatsApp() async {
    // The phone number or WhatsApp link you want to open
    String phoneNumber = "whatsapp://send?phone=1234567890";

    // Check if the WhatsApp app is installed on the device
    if (await canLaunch(phoneNumber)) {
      // Launch the WhatsApp app
      await launch(phoneNumber);
    } else {
      // If WhatsApp is not installed, show an error message
      print('WhatsApp is not installed on this device.');
    }
  }
}


