import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';

class SeiyuuCard extends StatelessWidget {
  const SeiyuuCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
            ),
            height: 180,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          /*Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS),
            ),
            height: 20,
            width: MediaQuery.of(context).size.width * 0.9,
          ),*/
          /*
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildImage(),
              buildInfo(context),
            ],
          ),
          */
          buildInfo(context),
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Constants.BORDER_RADIUS),
        bottomLeft: Radius.circular(Constants.BORDER_RADIUS),
      ),
      child: Image.asset(
        "assets/images/hibiki_aimi.jpg",
        height: 180,
        width: 135,
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    /*return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Constants.BORDER_RADIUS),
              topRight: Radius.circular(Constants.BORDER_RADIUS),
            ),
          ),
        ),
        Text("test"),
        Container(height: 50, color: Colors.red),
      ],
    );*/
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.BORDER_RADIUS),
          topRight: Radius.circular(Constants.BORDER_RADIUS),
        ),
      ),
    );
  }
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
