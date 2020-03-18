import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/decoration.dart';

class SeiyuuCard extends StatelessWidget {
  final VoidCallback onTap;

  const SeiyuuCard({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10), //EdgeInsets.all(10),
      //Align and SizedBox needed to keep shape when placed inside Expanded widget
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: Constants.CARD_IMAGE_HEIGHT,
          width: 330,
          child: Container(
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.red, width: 1.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
              boxShadow: standardShadow(),
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
                  print("Seiyuu Card Tapped");
                  //call the passed in function, which opens seiyuu details
                  onTap();
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
