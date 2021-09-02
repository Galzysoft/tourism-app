import 'package:flutter/material.dart';
import 'package:tour_app/auth/firebase_authentication.dart';
import 'package:tour_app/colors/colors.dart';
import 'package:tour_app/pages/login_page.dart';
import 'package:tour_app/pages/nearby_page.dart';
import 'package:tour_app/pages/tour_list.dart';
import 'package:tour_app/pages/weather_page.dart';
import 'package:tour_app/styles/text_styles.dart';
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  FirebaseAuthenticationService authenticationService;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            buildHeaderContainer(),
            ListTile(
              onTap: () => Navigator.pushNamed(context, WeatherPage.routName),
              leading: Icon(Icons.wb_cloudy),
              title: Text('Weather',style: txtWhite22,),
            ),

            ListTile(
              onTap: ()  => Navigator.pushNamed(context, NearbyPage.routName),
              leading: Icon(Icons.near_me),
              title: Text('Nearby',style: txtWhite22,),
            ),
            ListTile(
              onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (context) => Tour_list(),)),
              leading: Icon(Icons.place),
              title: Text('Tour List',style: txtWhite22,),
            ),
            ListTile(
              onTap: ()  =>   authenticationService.signOut()..then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))),
              leading: Icon(Icons.vpn_key_rounded),
              title: Text('LogOut',style: txtWhite22,),
            ),
          ],
        ),
      ),
    );
  }

 Widget buildHeaderContainer() {
    return Container(
      height: 150,
      alignment: Alignment.center,
      color: rowItemColor,
      child: RichText(
       text: TextSpan(
         text: 'T',
         style: TextStyle(color: backgroundColor,fontSize: 35, fontWeight: FontWeight.bold),
         children: [
           TextSpan(text: 'our',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
           TextSpan(text: 'A',),
           TextSpan(text: 'pp',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
         ]
       ),
      ),
    );






  }
}
