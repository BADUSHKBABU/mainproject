import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
class contactus extends StatefulWidget {
  const contactus({super.key});

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("ADD YOUR BUISNESS"),),
      body: Column(
        children: [

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


  // Encode the message for the URL
  // String encodedMessage = Uri.encodeComponent(buisness);
  // String encodedMessage1 = Uri.encodeComponent(_name);
  // String encodedMessage2 = Uri.encodeComponent(mobilenumber);
  //
  // // Construct the full WhatsApp URL with the phone number and message
  // String whatsappUrl = "$phoneNumber&text= buisnesss type:\n $encodedMessage,\n\n name:\n $encodedMessage1 ,\n\n phone:\n $encodedMessage2 ";
  // // String whatsappUrl1 = "$phoneNumber&text=$encodedMessage1";
  // // String whatsappUrl2 = "$phoneNumber&text=$encodedMessage2";

  try {
    // Attempt to launch the WhatsApp app with the specified phone number and message
    await launch(phoneNumber);

  } catch (e) {
    // Handle any exceptions or errors
    print('Error launching WhatsApp: $e');
    // Optionally, you can provide a fallback or show an error message to the user
  }
}