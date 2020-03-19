import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/decoration.dart';

class SeiyuuImage extends StatelessWidget {
  final String imageUrl;

  const SeiyuuImage({Key key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = EdgeInsets.all(8.0);

    return Stack(
      children: <Widget>[
        Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: standardBorderRadius(),
            boxShadow: standardShadow(),
            image: DecorationImage(
              fit: BoxFit.cover,
              //give the first network image as the main one
              image: CachedNetworkImageProvider(
                imageUrl,
                errorListener: () {
                  print("Could not load image");
                },
              ),
            ),
          ),
        ),
        Container(
          margin: margin,
          /*decoration: BoxDecoration(
            borderRadius: standardBorderRadius(),
          ),*/
          child: Material(
            /*borderRadius: standardBorderRadius(),*/
            color: Colors.transparent,
            child: InkWell(
              borderRadius: standardBorderRadius(),
              onTap: () {
                print("Image tapped");
              },
            ),
          ),
        ),
      ],
    );
  }
}
