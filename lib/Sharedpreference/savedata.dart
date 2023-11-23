import 'package:shared_preferences/shared_preferences.dart';


savedata(String savedata) async
{
  final SharedPreferences share= await SharedPreferences.getInstance();
  share.setString("data", savedata);
}

getdata() async
{
  final SharedPreferences share=await SharedPreferences.getInstance();
  var gwtData=share.getString("data");
  return gwtData;
}