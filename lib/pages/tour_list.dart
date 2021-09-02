import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/colors/colors.dart';
import 'package:tour_app/db/db_firestore_helper.dart';
import 'package:tour_app/models/tour_models.dart';
import 'package:tour_app/widgets/tour_item.dart';

import 'new_tour_page.dart';

class Tour_list extends StatefulWidget {
  const Tour_list({Key key}) : super(key: key);

  @override
  _Tour_listState createState() => _Tour_listState();
}

class _Tour_listState extends State<Tour_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:   Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset('images/tourbackground.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            StreamBuilder(
              stream: DBFirestoreHelper.getAllTours(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemBuilder: (context, index)=>TourItem(TourModel.fromMap(snapshot.data.docs[index].data())),
                    itemCount: snapshot.data.docs.length,

                  );
                }
                if(snapshot.hasError){
                  return Center(child: Text('Failed to fetch Data !'),);
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),
          ],
        ),

        floatingActionButton: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          transitionDuration: Duration(milliseconds: 700),
          openBuilder: (context,_) => NewTourPage(),
          closedBuilder: (context,_) => SizedBox(
            width: 60,
            height: 60,
            child: Icon(Icons.add,color: Colors.white,),
          ),
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          closedElevation: 7.0,
          closedColor: backgroundColor,
        )

    );
  }
}
