import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function showNum;

  CustomButton(this.text, this.showNum);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          onPressed: () {
            showNum(text);
          },
        ),
      ),
    );
  }
}
