import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';

//utilities for decorations used across the app.
//helps keep design consistent

//ensuring the same type of shadow is used throughout the application
List<BoxShadow> standardShadow() {
  return [
    BoxShadow(
      color: Colors.black,
      blurRadius: 6.0, // has the effect of softening the shadow
      //spreadRadius: 1.0, // has the effect of extending the shadow
      offset: Offset(
        0.0, // horizontal, move right 0
        3.0, // vertical, move down 3
      ),
    ),
  ];
}

//used to make the ensure all boxes have the standard curvature
BorderRadius standardBorderRadius() {
  return BorderRadius.all(
    Radius.circular(Constants.BORDER_RADIUS),
  );
}

//used in a container to get the background color
BoxDecoration backgroundDecoration() {
  return BoxDecoration(
    gradient: backgroundGradient(),
  );
}

LinearGradient backgroundGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Constants.mainBG,
      Constants.tertiaryColor,
    ],
  );
}
