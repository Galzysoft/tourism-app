import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:nkm_app/single_elements/single_new_arival_collections_sub_cartegory.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/colors/colors.dart';
import 'package:tour_app/listitems/singleplaceitem.dart';
import 'package:tour_app/models/places_models.dart';

class PlacesComponent extends StatefulWidget {
  final String sub_cartegory;
  bool vertical_orient;

  PlacesComponent({Key key, this.sub_cartegory, this.vertical_orient})
      : super(key: key);

  @override
  _PlacesComponentState createState() => _PlacesComponentState();
}

class _PlacesComponentState extends State<PlacesComponent> {
  List<dynamic> prod;
  bool isloading = true;

  // Fetch content from the json file
  Future<void> readJson() async {
    // to delay the   execution
    // await Future.delayed(Duration(seconds: 8));
    final String response = await rootBundle.loadString('images/places.json');
    print("yesmehnnnnooooo$response");

    // final data = await json.decode(response);
    // List <dynamic> list= json.decode
    if (response.isNotEmpty) {
      setState(() {
        if (response.isNotEmpty) {
          prod = jsonDecode(response);
          isloading = false;
          print("yesooooo$prod");
        }
      });
    }

    //
    // sproducts_list = Discover_featured_mode.fromJson(prod[0]).;
  }

  @override
  void initState() {
    readJson();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading == true
        ? Center(
            child: CircularProgressIndicator(
              color: backgroundColor,
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height ,
            child: new GridView.builder(
                shrinkWrap: true,
                // physics: ScrollPhysics()
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prod.length,
                padding: EdgeInsets.only(
                  bottom: 0.w,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // number of elements in the horizontal axis
                    crossAxisCount: 2,
                    // vertical spacing single sub widget
                    // mainAxisSpacing: 4,
                    // horizontal spacing single sub widget
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.8
                    // item aspect ratio
                    ),
                itemBuilder: (BuildContext contex, int index) {
                  print( PlaceModel.fromMap(prod[index]).description) ;
                  return Container(
                    child: SinglePlaceItem(PICTURE: PlaceModel.fromMap(prod[index]).picture ,
                      title: PlaceModel.fromMap(prod[index]).title,
                      FAVOURITE: true,
                      DESCRIPTION: PlaceModel.fromMap(prod[index]).description,
                      LOCATION: PlaceModel.fromMap(prod[index]).location,
                      RATING: PlaceModel.fromMap(prod[index]).rating,
                    ),
                  );
                }));
  }
}
