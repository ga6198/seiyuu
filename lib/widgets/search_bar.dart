import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/decoration.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          height: 50,
          width: Constants.CARD_WIDTH,
          //color: Colors.transparent,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Theme.of(context).backgroundColor,
            boxShadow: standardShadow(),
            //backgroundBlendMode: BlendMode.softLight,
            /*[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0, // has the effect of softening the shadow
                  spreadRadius: 10.0, // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                ),
              ],*/
            //backgroundBlendMode: BlendMode.overlay,
            //gradient: backgroundGradient(),
          ),
          child: Center(
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    size: 35,
                  ),
                ],
              ),
              /*title: Center(
                child: Text(
                  "Search",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),*/
            ),
          ), /*Center(
            child: Text("Search bar placeholder"),
          ),*/
        ),
      ),
    );
  }
}
