import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/decoration.dart';

class PrimaryCard extends StatefulWidget {
  Widget headerContent;
  Widget bodyContent;

  PrimaryCard(
      {Key key, @required this.headerContent, @required this.bodyContent})
      : super(key: key);

  @override
  _PrimaryCardState createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        //padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.red, width: 1.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
          boxShadow: standardShadow(),
        ),
        height: 300, //Constants.CARD_IMAGE_HEIGHT,
        width: Constants
            .CARD_IMAGE_WIDTH, //MediaQuery.of(context).size.width * 0.9,

        child: Column(
          children: <Widget>[
            buildHeader(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 50,
      //width: Constants.CARD_WIDTH,

      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.BORDER_RADIUS),
          topRight: Radius.circular(Constants.BORDER_RADIUS),
        ),
      ),

      child: widget.headerContent,
    );
  }

  Widget buildBody() {
    return widget.bodyContent;
  }
}
