import 'package:flutter/material.dart';
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
        title: Text("Profiles"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SearchBar(),
              SeiyuuCard(),
              SeiyuuCard(),
            ],
          ),
        ),
      ),
    );
  }
}
