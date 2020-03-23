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
import 'package:seiyuu/widgets/popular_pages_card.dart';
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
                PopularPagesCard(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
