
import 'package:android_intent_plus/android_intent.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tour_app/colors/colors.dart';
import 'package:tour_app/component/placess_component.dart';
import 'package:tour_app/widgets/main_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform;
class HomePage extends StatefulWidget {
  static final routName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool isloading=false;
  @override
  Widget build(BuildContext context) {
    Widget Image_carousel = new Container(
//       here i specify the hieght of the  container
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),

      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: new Carousel(
          boxFit: BoxFit.cover,
// here we declare the images to contain
          images: [
            AssetImage("images/Coconut-Beach.jpg"),
            AssetImage("images/the_giant.jpg"),
            AssetImage("images/Alok-Ikom-Monoliths.jpg"),
            AssetImage("images/Idanre-Hills.jpg"),
            AssetImage("images/Surame-Cultural-Landscape-sokoto-dessert.jpg"),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotColor: Colors.transparent,
          dotSize: 0.0,

          dotBgColor: Colors.transparent,
          indicatorBgPadding: 6.0,
        ),
      ),
    );
    return Scaffold(drawerScrimColor: backgroundColor.withOpacity(0.2),

        drawer: MainDrawer(),
        extendBodyBehindAppBar: false,
        backgroundColor: backgroundColord,
        appBar: AppBar(
          title: Text('Tour App',style: TextStyle(color: blackcolor),),
          iconTheme: IconThemeData(color:blackcolor),
        ),
        body: ModalProgressHUD(
          inAsyncCall: isloading,color: backgroundColor,opacity: 0.4,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.0.w, 1.w, 16.w, 4.w),
                child: SizedBox(
                  height: 38.0.h,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) async {
                      if (Platform.isAndroid) {
                        setState(() {
                          isloading=true;
                        });
                        Future.delayed(const Duration(seconds: 8), () async {

// Here you can write your code
AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: 'google.navigation:q=${value}',

                        );
                        await intent.launch();
setState(() {
  isloading=false;
});


                        });

                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),

                        ),

                      prefixIcon:  Image.asset("images/SEARCH a.png",color: blackcolor,),
                      hintText:  "e.g Ogbunike Cave",
                      hintStyle: TextStyle(color:blackcolor,fontWeight: FontWeight.w900),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //       builder: (context) => Search(),
                  //     //     ));
                  //   },
                  //   child: Container(
                  //     height: 80,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.all(Radius.circular(50))
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Image.asset("images/SEARCH a.png"),
                  //         Text(
                  //           "e.g Ogbunike Cave",
                  //           style:
                  //               TextStyle(color: Colors.black38, fontSize: 16.sp),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: SizedBox(
                  height: 160.0.h,
                  child: GridTile(
                    child: Stack(children: [
                      Image_carousel,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0.r),
                            bottomRight: Radius.circular(10.0.r),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.lerp(
                                  Alignment.topLeft, Alignment.topRight, 0.5),
                              stops: [
                                0.1,
                                0.1,
                                0.1,
                                0.6
                              ],
                              colors: [
                                backgroundColor.withOpacity(1.0),
                                backgroundColor.withOpacity(1.0),
                                backgroundColor.withOpacity(1.0),
                                backgroundColor.withOpacity(0.1),
                              ]),

                          // image: DecorationImage(
                          //   image: AssetImage("assets/images/Image 2.png"),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      )
                    ]),
                    footer: Container(
                      height: 70.h,
                      color: Colors.transparent,
                      child: ListTile(
                        title: new Text(
                         "We travel the World",
                          style: TextStyle(
                              color:backgroundColord,
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: new Text(
                          "The Tourist for You",
                          style: TextStyle(
                              color: Color(0XFF033E57),
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              PlacesComponent()
            ],
          ),
        ));
  }
}
