import 'package:flutter/material.dart';
import 'package:seiyuu/screens/seiyuu_profiles.dart';
import 'package:seiyuu/util/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seiyuu',
      theme: Constants.mainTheme,
      home: SeiyuuProfiles(),
    );
  }
}
