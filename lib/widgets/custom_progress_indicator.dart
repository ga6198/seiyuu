import 'package:flutter/material.dart';

// used to display loading screens
class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container left in if customization needed
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
