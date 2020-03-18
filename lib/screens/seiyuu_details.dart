import 'package:flutter/material.dart';

import '../util/decoration.dart';

class SeiyuuDetails extends StatefulWidget {
  final String seiyuuName;

  SeiyuuDetails({
    Key key,
    @required this.seiyuuName,
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
          "${widget.seiyuuName}",
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
                  Text("temp"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
