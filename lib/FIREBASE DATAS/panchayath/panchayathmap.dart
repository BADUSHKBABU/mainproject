import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {

  bool check = true;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://en.wikipedia.org/wiki/Udumbannoor"));

  WebViewController next = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.google.co.in/maps/@9.8898181,76.8418892,3201m/data=!3m1!1e3?hl=en&entry=ttu'));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: ElevatedButton(
            onPressed: () {
              setState(() {
                if (check == true) {
                  check = false;
                } else {
                  check = true;
                }
              });
            },
            child: Text("next"),
          ),
        ),
        body: WebViewWidget(
          controller: check ? controller : next,
        ),
      )
    );
  }
}
