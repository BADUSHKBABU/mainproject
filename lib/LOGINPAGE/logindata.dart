import 'package:flutter/material.dart';
class logindata extends ChangeNotifier
{
  late String name="";



  getdatafromloginpage(value)
  {
    name=value;
    notifyListeners();
  }


}