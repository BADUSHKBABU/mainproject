

import 'package:clay_containers/clay_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagement/APPBAR/appbar.dart';
import 'package:statemanagement/FIREBASE%20DATAS/PROFILE/profile.dart';
import 'package:statemanagement/FIREBASE%20DATAS/RESTAURANT/restaurant.dart';
import 'package:statemanagement/FIREBASE%20DATAS/TAXI/taxi.dart';
import 'package:statemanagement/LOGINPAGE/login.dart';
import 'package:statemanagement/LOGINPAGE/logindata.dart';
import 'package:webview_flutter/webview_flutter.dart';



class homepage extends StatefulWidget {
  const homepage({super.key});
  static const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');
  @override
  State<homepage> createState() => _homepageState();
}
int currentpageindex=0;
class _homepageState extends State<homepage> {
  final user=FirebaseAuth.instance.currentUser!;


  bool check = true;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.google.com/maps/place/Udumbannoor,+Kerala/@9.9023451,76.8183941,15z/data=!3m1!4b1!4m6!3m5!1s0x3b07c75338a858d9:0x28dd3d3e0ad53ccb!8m2!3d9.9023471!4d76.8201976!16zL20vMGZjemp2?entry=ttu'));

  WebViewController next = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://idukki.nic.in/en/directory/grama-panchayat-udumbannoor/'));


  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<logindata>(context,listen: true);
    return Scaffold(


      ///BOTTOM NAVIGATION BAR
      //   bottomNavigationBar: NavigationBar(
      //     onDestinationSelected: (int index) {
      //       setState(() {
      //         currentpageindex = index;
      //       });
      //     },
      //     indicatorColor: Colors.amber,
      //     selectedIndex: currentpageindex,
      //     destinations: const <Widget>[
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.home),
      //         icon: Icon(Icons.home_outlined),
      //         label: 'Home',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.notifications),
      //         icon: Icon(Icons.notifications),
      //         label: 'Notifications',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Icon((Icons.abc_outlined)),
      //         icon: Icon(Icons.abc_outlined),
      //         label: 'About Us',
      //       ),
      //     ],
      //   ),

        ///       BOTTOM NAVIGATION BAR ENDS HERE
        ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

        appBar: PreferredSize(
          child: aPPBAR(),
          preferredSize: Size.fromHeight(50),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                ///              ACCOUNAME WILL BE FETCHED FROM FIREBASE AUTH
                accountName: Text(user.email!),

                ///              EMAIL ID WIL BE FETCHED FROM FIREBASE AUTH
                accountEmail: Text(user.email!),
                currentAccountPicture: CircleAvatar(),
              ),
              //Drawer Head

              //Drawer rows
              //Row1 "HOME"
              TextButton(onPressed: () {}, child: Text("HOME")),

              //ROW2 "exit"
              TextButton(onPressed: () {Exit(context);}, child: Text("Exit")),
            ],
          ),
        ),
        ///        END OF DRAWER
        ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(//OUTER LIST VIEW
              scrollDirection: Axis.vertical,
              children: [

                ///            FIRST CONATAINER CONTAINING USEFULL LINK
                ///          ============================================
                Text("UDumbannor directory",textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClayContainer(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: ListView(scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 150,width:80,child: Column(
                                children: [Text("profile"),
                                  TextButton(onPressed: (){changeprofile();}, child: Icon(Icons.person)),
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 150,width:80,child: Column(
                                children: [Text("DOCTORS"),
                                  TextButton(onPressed: (){}, child: Icon(Icons.local_hospital)),
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 150,width:80,child: Column(
                                children: [Text("Emergency"),
                                  TextButton(onPressed: (){}, child: Icon(Icons.contact_emergency)),
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 150,width:80,child: Column(
                                children: [Text("Sports"),
                                  TextButton(onPressed: (){}, child: Icon(Icons.sports_cricket)),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ///           FIST CONTAINER ENDS HERE
                //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



                ///        SECOND CONTAINER STARTS HERE
                //       ===============================
                Center(child: Text("SERVICES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),)),
                ClayContainer(spread: 10,
                  depth: 40,
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(//ADDED ROW FOR ENTIRE CONTAINER
                      scrollDirection: Axis.horizontal,
                      children: [


                        Column(///ADDING COLUMN INSIDE THE ROW , CONTAINER ITSELF IS A ROW ,WE ADDING 2 COMPONENTS IN EACH COLUMN
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("panchayath"),
                                    TextButton(onPressed: (){},child: Icon(Icons.house),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Vehicles"),
                                    TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return taxi();}));},child: Icon(Icons.car_rental),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),


                        Column(///ADDING COLUMN INSIDE THE ROW , CONTAINER ITSELF IS A ROW ,WE ADDING 2 COMPONENTS IN EACH COLUMN
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Notification"),
                                    TextButton(onPressed: (){},child: Icon(Icons.notifications),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Shops"),
                                    TextButton(onPressed: (){},child: Icon(Icons.shopping_basket),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),


                        Column(///ADDING COLUMN INSIDE THE ROW , CONTAINER ITSELF IS A ROW ,WE ADDING 2 COMPONENTS IN EACH COLUMN
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("news"),
                                    TextButton(onPressed: (){},child: Icon(Icons.newspaper_sharp),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Sports"),
                                    TextButton(onPressed: (){},child: Icon(Icons.sports_cricket),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),


                        Column(///ADDING COLUMN INSIDE THE ROW , CONTAINER ITSELF IS A ROW ,WE ADDING 2 COMPONENTS IN EACH COLUMN
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Restaurant"),
                                    TextButton(onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context){return restaurant();}));
                                    },child: Icon(Icons.restaurant),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Schools"),
                                    TextButton(onPressed: (){},child: Icon(Icons.school),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        Column(///ADDING COLUMN INSIDE THE ROW , CONTAINER ITSELF IS A ROW ,WE ADDING 2 COMPONENTS IN EACH COLUMN
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Medical \nshops",textAlign: TextAlign.center,),
                                    TextButton(onPressed: (){},child: Icon(Icons.health_and_safety),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Hospitals"),
                                    TextButton(onPressed: (){},child: Icon(Icons.local_hospital_outlined),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),


                        Column(//ADDING COLUMN INSIDE THE ROW , CONTAINER ITSELF IS A ROW ,WE ADDING 2 COMPONENTS IN EACH COLUMN
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Akshaya \nenter",textAlign: TextAlign.center,),
                                    TextButton(onPressed: (){},child: Icon(Icons.e_mobiledata),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClayContainer(curveType: CurveType.convex,
                                spread: 1,
                                width: 80,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Social \nservice"),
                                    TextButton(onPressed: (){},child: Icon(Icons.bloodtype),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ) ,
                ),
                ///        SECOND CONTAINER ENDS HERE
                ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

           Column(
            children: [


              ElevatedButton(
                 onPressed: () {
                   setState(() {
                    if (check == true) {
                       check = false;
                     } else {
                       check = true;
                     }
                   });
                 },
                 child: Text("check"),
               ),
///          CONTAINER FOR IMAGE SLIDE
           Container(
             width: MediaQuery.of(context).size.width,
             height: 180,
             color: Colors.green,
             child: ListView(
               children:[ WebViewWidget(
                 controller: check ? controller:next,
               ),
             ]
             ),

           )
             ],
           )
              ],
            ),
          ),
        )
    );
  }

  Future Exit(context) async
  {
    final share=await SharedPreferences.getInstance();
    share.clear();
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return loginpage();}));
  }

  ///PROFILE BUTTON
  changeprofile() async
  {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context){return profile();}));
  }

}

