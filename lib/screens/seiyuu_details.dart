import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/seiyuu.dart';
import 'package:seiyuu/util/decoration.dart';
import 'package:seiyuu/widgets/carousel_with_indicator.dart';
import 'package:seiyuu/widgets/round_button.dart';

class SeiyuuDetails extends StatefulWidget {
  final Seiyuu seiyuu;

  SeiyuuDetails({
    Key key,
    @required this.seiyuu,
  }) : super(key: key);

  @override
  _SeiyuuDetailsState createState() => _SeiyuuDetailsState();
}

class _SeiyuuDetailsState extends State<SeiyuuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.seiyuu.name}",
          style: Theme.of(context)
              .textTheme
              .headline4, //Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: backgroundDecoration(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  //sliding images at top
                  buildImageCarousel(widget.seiyuu.imageUrls),
                  //buttons for favoriting and sharing
                  buildActionButtons(),
                  buildInfoTile(Constants.ICON_BIRTHDAY, "Birthday",
                      widget.seiyuu.birthday),
                  buildInfoTile(
                      Constants
                          .ICONS_ZODIAC["${widget.seiyuu.astrologicalSign}"],
                      "Astrological Sign",
                      widget.seiyuu.astrologicalSign),
                  buildInfoTile(Constants.ICON_BLOOD_TYPE, "Blood Type",
                      widget.seiyuu.bloodType),
                  buildInfoTile(Constants.ICON_HEIGHT, "Height",
                      "${widget.seiyuu.height} cm"),
                  buildInfoTile(
                      Constants.ICON_AGENCY, "Agency", widget.seiyuu.agency),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCarousel(List<String> imageUrls) {
    return CarouselWithIndicator(
      imageUrls: imageUrls,
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ), //Icons.favorite
        RoundButton(
          icon: Icon(Icons.share),
          onPressed: () {},
        )
      ],
    );
  }

  Widget buildInfoTile(IconData iconData, String title, String subtitle) {
    //if the seiyuu gave a value, build the tile
    if (subtitle != null && subtitle != "null") {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: standardShadow(),
          ),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData, size: 40),
              ],
            ), //Icon(Icons.shuffle),
            title: Text("${title}"),
            subtitle: Text("${subtitle}"),
          ),
        ),
      );
    }
    //if no values were given, don't return anything
    else {
      return SizedBox();
    }
  }
}
