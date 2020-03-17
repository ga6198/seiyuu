import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:seiyuu/util/constants.dart';

class SeiyuuCard extends StatelessWidget {
  const SeiyuuCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return FlutterShine(
      builder: (BuildContext context, ShineShadow shineShadow) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.red, width: 1.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
              boxShadow: shineShadow.boxShadows,
            ),
            height: Constants.CARD_IMAGE_HEIGHT,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildImage(),
                Expanded(
                  child: buildInfo(context),
                ),
              ],
            ),
          ),
        );
      },
    );
    */
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10), //EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.red, width: 1.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 6.0, // has the effect of softening the shadow
              //spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 0
                3.0, // vertical, move down 3
              ),
            ),
          ],
        ),
        height: Constants.CARD_IMAGE_HEIGHT,
        width: 330, //MediaQuery.of(context).size.width * 0.9,
        //Add a material so the inkwell splash appears on top
        child: Material(
          borderRadius:
              BorderRadius.all(Radius.circular(Constants.BORDER_RADIUS)),
          color: Colors.transparent,
          child: InkWell(
            //splashColor: Colors.blueGrey,
            onTap: () {
              print("test");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildImage(),
                Expanded(
                  child: buildInfo(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    /*return Container(
      height: Constants.CARD_IMAGE_HEIGHT,
      width: Constants.CARD_IMAGE_WIDTH,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/hibiki_aimi.jpg",
          ),
        ),
      ),
    );*/
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft:
              Radius.circular(0), //Radius.circular(Constants.BORDER_RADIUS),
          bottomLeft:
              Radius.circular(0), //Radius.circular(Constants.BORDER_RADIUS),
        ),
        child: Container(
          height: Constants.CARD_IMAGE_HEIGHT,
          width: Constants.CARD_IMAGE_WIDTH,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/hibiki_aimi.jpg",
              ),
            ),
          ),
        )
        //Image.asset(
        //"assets/images/hibiki_aimi.jpg",
        //height: Constants.CARD_IMAGE_HEIGHT,
        //width: Constants.CARD_IMAGE_WIDTH,
        //),
        );
    /*return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.BORDER_RADIUS),
          bottomLeft: Radius.circular(Constants.BORDER_RADIUS),
        ),
      ),
      child: Image.asset(
        "assets/images/hibiki_aimi.jpg",
        height: Constants.CARD_IMAGE_HEIGHT,
        width: Constants.CARD_IMAGE_WIDTH,
      ),
    );*/
  }

  //Construct the right side of the card, after the picture
  Widget buildInfo(BuildContext context) {
    return Column(
      children: <Widget>[
        //The top right bar with the seiyuu name
        Container(
          height: 50,
          width: 330 -
              Constants
                  .CARD_IMAGE_WIDTH, //MediaQuery.of(context).size.width * 0.9 - Constants.CARD_IMAGE_WIDTH,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              //topLeft: Radius.circular(Constants.BORDER_RADIUS),
              topRight: Radius.circular(Constants.BORDER_RADIUS),
            ),
          ),
          //Seiyuu Names
          child: Center(
            child: Column(
              children: <Widget>[
                //Name in English
                Text(
                  "Name Placeholder",
                  style: TextStyle(fontSize: 20),
                ),
                //Name in original characters (kana/kanji)
                Opacity(
                  opacity: 0.75,
                  child: Text(
                    "Kana Name",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        //Birthday
        buildCardRow(context, Icons.cake, "Birthday"),
        //Blood Type
        buildCardRow(context, MdiIcons.water, "Blood Type"),
        //Height
        buildCardRow(context, MdiIcons.humanMaleHeight, "Height"),
        //Agency
        buildCardRow(context, MdiIcons.briefcase, "Agency"),
      ],
    );
  }
}

Widget buildCardRow(BuildContext context, IconData icon, String info) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
    child: Container(
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(icon),
          Text(
            "${info}",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ),
  );
}

//Original Code inside padding
/*
Stack(
        children: <Widget>[
          Container(
            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
            ),
            height: 180,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
      */
