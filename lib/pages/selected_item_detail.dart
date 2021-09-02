import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tour_app/colors/colors.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';


enum WidgetMarker { addition, review, about }

class selected_item_detail extends StatefulWidget {
  final String title;
  final String PICTURE;
  final String LOCATION;
  final double RATING;
  final bool FAVOURITE;
  final String DESCRIPTION;



  const selected_item_detail(
      {Key key, this.title, this.PICTURE, this.LOCATION, this.RATING, this.FAVOURITE, this.DESCRIPTION})
      : super(key: key);

  @override
  _selected_item_detailState createState() => _selected_item_detailState();
}

class _selected_item_detailState extends State<selected_item_detail> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.review;
  int no = 1;  bool isfav = false,    isselected_additional = false;
   bool isincr = false, isdecrese = false;
  bool isloading=false;
  @override
  void initState() {
    // TODO: implement initState
    isfav = widget.FAVOURITE;

    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0.h),
        child: AppBar(
          centerTitle: true,
          title: new Text(widget.title,style: TextStyle(fontSize: 20.sp,color: blackcolor),),
          actions: <Widget>[
//            IconButtons are been used to  specify buttons thett contains icons expetially in appbar eg serch button is an Iconsbutton

            SizedBox(
              width: 10.0.w,
            ),
          ],
        ),
      ),
      body: ModalProgressHUD(


        inAsyncCall: isloading,color: backgroundColor,opacity: 0.4,
        child: ListView(padding: EdgeInsets.only(bottom: 110.w),
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: SizedBox(
                height: 380.h,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 300.h,
                      child: GridTile(
                        header: Row(
                          children: [   Padding(
                            padding:  EdgeInsets.all(8.0.w),
                            child: CircleAvatar(
                              child: InkWell(
                                  child:Image.asset("images/ENLARGE.png",height: 50.h,width: 50.w,
                                  ),
                                  onTap: () {}),
                              backgroundColor: Colors.white70,
                            ),
                          ),
                            Padding(
                              padding:  EdgeInsets.all(8.0.w),
                              child: CircleAvatar(
                                child: InkWell(
                                    child:Image.asset("images/SHARE.png",height: 50.h,width: 50.w,
                                    ),
                                    onTap: () {}),
                                backgroundColor: Colors.white70,
                              ),
                            ),    Padding(
                              padding:  EdgeInsets.all(8.0.w),
                              child:  CircleAvatar(
                                child: InkWell(
                                    child:isfav==false?Image.asset("images/HEART.png",height: 50.h,width: 50.w,
                                        color: Colors.pinkAccent):Image.asset("images/FAVOURITE 1.png",height: 50.h,width: 50.w,
                                        color: Colors.pinkAccent),
                                    onTap: () {       setState(() {
                                      if (isfav == false) {
                                        isfav = true;
                                      } else {
                                        isfav = false;
                                      }
                                    });}),
                                backgroundColor: Colors.white70,
                              ),
                            ),


                          ],
                        ),
                        child: Container(
                          height: 300.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.r)),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage(widget.PICTURE),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 5,
                      right: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(8.0.w),
                            child: Container(
                              height: 100.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  border:
                                      Border.all(color: Colors.white.withOpacity(0.3), width: 5.w),
                                  color: blackcolor.withOpacity(0.3)),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(8.0.w),
                            child: Container(
                              height: 100.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  border:
                                      Border.all(color: Colors.white.withOpacity(0.3), width: 5.w),
                                  color: blackcolor.withOpacity(0.3)),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(8.0.w),
                            child: Container(
                              height: 100.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  border:
                                      Border.all(color: Colors.white.withOpacity(0.3), width: 5.w),
                                  color: blackcolor.withOpacity(0.3)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(8.0.w, 0.w, 8.w, 0.w),
              child: Text(
                "${widget.DESCRIPTION}",
                textAlign: TextAlign.justify,style:TextStyle(  fontSize: 14.sp,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: 'L',
                    style: TextStyle(color: backgroundColor,fontSize: 20, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: 'ocation :',style: TextStyle(color: blackcolor,fontWeight: FontWeight.normal)),
                      TextSpan(text: ' ',),
                      TextSpan(text: '  ${widget.LOCATION}',style: TextStyle(color:blackcolor,fontWeight: FontWeight.normal)),
                    ]
                ),
              ),
            ),



            Padding(
              padding:
              EdgeInsets.fromLTRB(16.0.w, 16.w, 16.w, 4.w),
              child: SizedBox(
                height: 56.h,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () async {
                    if (Platform.isAndroid) {
                      setState(() {
                        isloading=true;
                      });
                      Future.delayed(const Duration(seconds: 8), () async {

// Here you can write your code
                        AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: 'google.navigation:q=${widget.LOCATION}',

                        );
                        await intent.launch();
                        setState(() {
                          isloading=false;
                        });


                      });

                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                           backgroundColor,
                           blackcolor,
                          ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0.r),
                        topRight: Radius.circular(20.0.r),
                        bottomLeft: Radius.circular(20.0.r),
                        bottomRight: Radius.circular(20.0.r),
                      ),
                    ),
                    child: Center(
                      child: new Text(
                        "View on Map",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
