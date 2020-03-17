import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          //color: Colors.transparent,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
            //backgroundBlendMode: BlendMode.overlay,
          ),
          child: Center(
            child: Text("Hi modal sheet"),
          ),
        ),
      ),
    );
  }
}
