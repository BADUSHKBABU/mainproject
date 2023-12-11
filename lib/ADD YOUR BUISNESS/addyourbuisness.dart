import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
class addbuisness extends StatefulWidget {
  const addbuisness({super.key});

  @override
  State<addbuisness> createState() => _addbuisnessState();
}
final TextEditingController buisnessname=TextEditingController();
final TextEditingController name=TextEditingController();
final TextEditingController mobile=TextEditingController();
class _addbuisnessState extends State<addbuisness> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: buisnessname,
              decoration: InputDecoration(
                hintText: "Enter your buisness",
                border: OutlineInputBorder()
              ),
          ), TextFormField(
            controller: name,
              decoration: InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder()
              ),
          ), TextFormField(
            controller: mobile,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                border: OutlineInputBorder()
              ),
          ),
          ElevatedButton(onPressed: (){_openWhatsAppWithMessage();}, child: Text("SEND"))

        ],
      ),
    );
  }
}



_openWhatsAppWithMessage() async {
  // The phone number or WhatsApp link you want to open
  String phoneNumber = "whatsapp://send?phone=8156865011";

  // The message you want to send (optional)
  String buisness = buisnessname.text;
  String _name=name.text;
  String mobilenumber=mobile.text;

  // Encode the message for the URL
  String encodedMessage = Uri.encodeComponent(buisness);
  String encodedMessage1 = Uri.encodeComponent(_name);
  String encodedMessage2 = Uri.encodeComponent(mobilenumber);

  // Construct the full WhatsApp URL with the phone number and message
  String whatsappUrl = "$phoneNumber&text=$encodedMessage, $encodedMessage1 , $encodedMessage2";
  // String whatsappUrl1 = "$phoneNumber&text=$encodedMessage1";
  // String whatsappUrl2 = "$phoneNumber&text=$encodedMessage2";

  try {
    // Attempt to launch the WhatsApp app with the specified phone number and message
    await launch(whatsappUrl);

  } catch (e) {
    // Handle any exceptions or errors
    print('Error launching WhatsApp: $e');
    // Optionally, you can provide a fallback or show an error message to the user
  }
}