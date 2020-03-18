import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seiyuu/screens/seiyuu_details.dart';
import 'package:seiyuu/util/decoration.dart';
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

            Expanded(
              child: ListView(
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
              ),
            ),
          ],
        ),
      ),
      //NOTE: May need to add a single child scroll view
    );
  }
}
