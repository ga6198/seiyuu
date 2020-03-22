import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String message;

  const ErrorDisplay({Key key, this.message = "Error"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Icon(MdiIcons.emoticonSad, size: 48),
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage("assets/images/kudoharu_sad.png"),
        ),
        Text(message, style: Theme.of(context).textTheme.headline4),
      ],
    );
  }
}
