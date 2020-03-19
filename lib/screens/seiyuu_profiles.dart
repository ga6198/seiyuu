import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seiyuu/screens/seiyuu_details.dart';
import 'package:seiyuu/util/decoration.dart';
import 'package:seiyuu/util/seiyuu.dart';
import 'package:seiyuu/widgets/drawer_only.dart';
import 'package:seiyuu/widgets/search_bar.dart';
import 'package:seiyuu/widgets/seiyuu_card.dart';

class SeiyuuProfiles extends StatefulWidget {
  SeiyuuProfiles({Key key}) : super(key: key);

  @override
  _SeiyuuProfilesState createState() => _SeiyuuProfilesState();
}

class _SeiyuuProfilesState extends State<SeiyuuProfiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profiles",
          style: Theme.of(context)
              .textTheme
              .headline4, //Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,
      ),
      drawer: DrawerOnly(),
      body: Container(
        decoration: backgroundDecoration(),
        child: Column(
          children: <Widget>[
            SearchBar(),
            //SeiyuuCard(),
            StreamBuilder(
              stream: Firestore.instance
                  .collection('seiyuu')
                  .orderBy('name', descending: false)
                  .snapshots(),

              //initialData: initialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return CircularProgressIndicator();
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasData) {
                      //retrieved document snapshot list of the seiyuu profiles
                      print("Database data retrieved");
                      List<DocumentSnapshot> seiyuuProfiles =
                          snapshot.data.documents;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: seiyuuProfiles.length,
                          itemBuilder: (BuildContext context, int index) {
                            //create seiyuu objects that will be passed to the seiyuu cards
                            DocumentSnapshot currentSeiyuu =
                                seiyuuProfiles[index];
                            Seiyuu seiyuu = Seiyuu(currentSeiyuu);

                            return SeiyuuCard(
                              seiyuu: seiyuu,
                              onTap: () {
                                print("Opening Card's Info");
                                //Move to the seiyuu details page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SeiyuuDetails(
                                      seiyuu: seiyuu,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        /*ListView(
                          children: <Widget>[
                            SeiyuuCard(onTap: () {
                              print("Opening Card's Info");
                              //Move to the seiyuu details page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeiyuuDetails(
                                    seiyuuName: "Aimi",
                                  ),
                                ),
                              );
                            }),
                            SeiyuuCard(),
                            //SeiyuuCard(),
                          ],
                        ),*/
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                }
              },
            ),
          ],
        ),
      ),
      //NOTE: May need to add a single child scroll view
    );
  }
}
