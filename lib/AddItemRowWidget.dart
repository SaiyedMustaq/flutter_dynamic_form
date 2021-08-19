
import 'package:flutter/material.dart';

class AddItemRowWidget extends StatelessWidget {
  final String buttonText;
  final TextStyle textStyle;
  final double heightOfTile;

  final appbarHeight = AppBar().preferredSize.height;

  AddItemRowWidget({this.buttonText,this.textStyle, this.heightOfTile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightOfTile,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(buttonText,
            style: textStyle),
      ),
    );
  }
}
