import 'package:flutter/material.dart';

class RoundNavButton extends StatelessWidget {

  final String number;
  final String color; 
  final double size;

  RoundNavButton({this.size, this.number, this.color});

  int getColorHexFromStr(String colorStr){
    colorStr = "FF" + colorStr;
    colorStr =colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (var i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57){
        val += (hexDigit - 48) * (1 << (4 * (len -1 -i)));
      }else if (hexDigit >= 65 && hexDigit <= 70){
        val += (hexDigit - 55) * (1 << (4 * (len -1 -i)));
      }else if (hexDigit >= 97 && hexDigit <= 102){
        val += (hexDigit - 87) * (1 << (4 * (len -1 -i)));
      }else{
        throw new FormatException("An error occured converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:4.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Color(getColorHexFromStr(color)),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(number, 
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white
              )),
        ),
      ),
    );
  }
}