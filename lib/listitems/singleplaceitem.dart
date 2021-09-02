
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tour_app/colors/colors.dart';
import 'package:tour_app/pages/selected_item_detail.dart';
class SinglePlaceItem extends StatefulWidget {
  final String PICTURE;
  final String LOCATION;
  final String title;
  final String TAG;
  final double RATING;
  final bool FAVOURITE;
  final String DESCRIPTION;
  

//   HERE LETS CREATE A CONSTRUCTOR
  SinglePlaceItem(
      {this.LOCATION,
      this.PICTURE,
      this.TAG,
      this.title,
      this.RATING,
      this.FAVOURITE, this.DESCRIPTION});

  @override
  _SinglePlaceItemState createState() => _SinglePlaceItemState();
}

class _SinglePlaceItemState extends State<SinglePlaceItem> {

  bool isfav = false;

  @override
  void initState() {
    // TODO: implement initState
    isfav = widget.FAVOURITE;

    super.initState();
  }


  Color mycolorLOCATION(String tag) {
    Color color;
    if (tag == "NEW") {
      color = Color(0xFF00AFEF);
      return color;
    } else if (tag == "HOT") {
      color = Color(0xFF00AFEF);
      return color;
    } else if (tag == "-20%") {
      color = Color(0xFF00AFEF);
      return color;
    }
    return color;
  }




  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: new Text("hero1"),
      child: Padding(
        padding:  EdgeInsets.only(left: 6.0.w,right: 6.0.w,bottom: 12.0.w),
        child: Container(
          height: MediaQuery.of(context).size.height,

          width:MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0.r),
                ),
                color: Colors.white,
                child: Container(

                  height: MediaQuery.of(context).size.height,

                  width:170.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0.r),
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(widget.PICTURE), fit: BoxFit.fill)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0.r),
                    bottomRight: Radius.circular(10.0.r),
                  ),

                ),
              ),
              Positioned(
                top:-19.w,
            right: 1.w,left: 1.w,bottom: 1.w,
                child: SizedBox(height: MediaQuery.of(context).size.height,

                  width:MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext
                              context) =>

                                  selected_item_detail(
                                    PICTURE:
                                    widget.PICTURE,
                                    LOCATION: widget.LOCATION,
                                    title: widget.title,DESCRIPTION: widget.DESCRIPTION,
                                    RATING: widget.RATING,
                                  )));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0.w, bottom: 0.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row( mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 6.0.w),
                                  child: IconButton(
                                      icon: isfav == false
                                          ? Icon(
                                        Icons.favorite,
                                        color: Colors.black38,
                                        size: 20.sp,
                                      )
                                          : Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 20.sp,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (isfav == false) {
                                            isfav = true;
                                          } else {
                                            isfav = false;
                                          }
                                        });
                                      }),
                                ),
                                Expanded(
                                    child: Center(
                                      child: SizedBox(
                                        height: 5.h,
                                      ),
                                    )),

                              ],
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                                  height: 12.h,
                               )),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(8.0.w,20.w,0.w,4.w),
                                  child: Text(
                                    "${widget.title}",softWrap: true,
                                    style: TextStyle(
                                        color:Colors.white
                                          ,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                      child: SizedBox(
                                        height: 5.h,
                                      ),
                                    )),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
