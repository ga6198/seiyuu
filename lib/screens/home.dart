import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:seiyuu/screens/seiyuu_details.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/decoration.dart';
import 'package:seiyuu/util/seiyuu.dart';
import 'package:seiyuu/widgets/custom_progress_indicator.dart';
import 'package:seiyuu/widgets/drawer_only.dart';
import 'package:seiyuu/widgets/error_display.dart';
import 'package:seiyuu/widgets/primary_card.dart';
import 'package:seiyuu/widgets/seiyuu_card.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .headline4, //Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,
      ),
      drawer: DrawerOnly(),
      body: Container(
        decoration: backgroundDecoration(),
        child: Column(children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                PrimaryCard(
                  headerContent: Center(
                    child: Text("Popular Pages",
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  bodyContent: StreamBuilder(
                    //Get the 5 seiyuu with the most pageviews
                    stream: Firestore.instance
                        .collection('pageviews')
                        .orderBy('viewCount', descending: true)
                        .limit(5)
                        .snapshots(),

                    //initialData: initialData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return CustomProgressIndicator();
                        case ConnectionState.waiting:
                          return CustomProgressIndicator();
                        default:
                          if (snapshot.hasData) {
                            //retrieved document snapshot list of the seiyuu profiles
                            print("Database data retrieved");

                            List<DocumentSnapshot> seiyuuViews =
                                snapshot.data.documents;
                            if (seiyuuViews.length <= 0) {
                              return Expanded(
                                child: ErrorDisplay(message: "Nothing to Show"),
                              );
                            } else {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: seiyuuViews.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    //create seiyuu objects that will be passed to the seiyuu cards
                                    DocumentSnapshot currentSeiyuu =
                                        seiyuuViews[index];

                                    return Text("${currentSeiyuu.documentID}");
                                  },
                                ),
                              );
                            }
                          } else {
                            return CustomProgressIndicator();
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
