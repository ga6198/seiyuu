import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seiyuu/util/decoration.dart';
import 'package:seiyuu/util/seiyuu.dart';

class SeiyuuMarker extends StatelessWidget {
  final Seiyuu seiyuu;

  const SeiyuuMarker({Key key, @required this.seiyuu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Container(
      decoration: backgroundDecoration(),
      child: Text("${seiyuu.name}"),
    );*/
    //use a stack to place the seiyuu picture on top of the icon
    return Stack(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Theme.of(context).accentColor,
          size: 100,
        ),
        Positioned(
          left: 25,
          top: 12.5,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(seiyuu.imageUrls[0]),
          ),
        ),
      ],
    );
  }
}
