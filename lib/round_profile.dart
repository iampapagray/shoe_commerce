import 'package:flutter/material.dart';

class RoundProfile extends StatelessWidget {

  final String img;

  RoundProfile({this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 2.0
        ),
        image: DecorationImage(
          image: AssetImage(img)
        )
      )
    );
  }
}