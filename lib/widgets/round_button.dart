import 'package:flutter/material.dart';
import 'package:seiyuu/util/decoration.dart';

class RoundButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const RoundButton({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: standardShadow(),
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
