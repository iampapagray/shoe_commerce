import 'package:favourites/model/sneaker.dart';
import 'package:favourites/star_rating.dart';
import 'package:favourites/styles.dart';
import 'package:flutter/material.dart';
import 'package:favourites/detail_page.dart';
import 'dart:math' as math;

class SneakerCard extends StatelessWidget {

  final Sneaker sneaker;

  SneakerCard({this.sneaker});

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
      padding: EdgeInsets.only(left: 8.0, right:8.0, top: 8.0, bottom:32.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(sneaker: sneaker,)));
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft ,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.transparent
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    height: 100.0,
                    width: MediaQuery.of(context).size.width / 4.5,
                    decoration: BoxDecoration(
                      color: Color(getColorHexFromStr(sneaker.color)),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 4.0,
                    child: Material(
                      color: Colors.white,
                      elevation: 20.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Icon(Icons.add)
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    child: Transform.rotate(
                      angle: - math.pi/4,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 75.0,
                          width: 140.0,
                          child: Image(
                            image: AssetImage(sneaker.imgPath), 
                            alignment: Alignment.topRight
                          ),
                        ),
                      ),
                    ),
                  )
               ],
              ),
            ),
            Container(
              height: 120,
              // alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '\$${sneaker.price}',
                    style: priceStyle,
                  ),
                  SizedBox(height:5.0),
                  Text(
                    '${sneaker.title}',
                    style: titleStyleSmall,
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    children: <Widget>[
                      Text(
                        'Review',
                        style: ratingStyle,
                      ),
                      SizedBox(width: 10.0,),
                      StarRating(rating: sneaker.rate, color: Colors.black)
                    ],
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        padding: EdgeInsets.only(top:6.0, bottom:5.0, left:10.0, right:10.0),
                        decoration: BoxDecoration(
                          color: Color(getColorHexFromStr('#a67cda')),
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0), right:Radius.circular(20.0))
                        ),
                        child: Text('Go To Cart', style:cartStyle),
                      ),
                      SizedBox(width: 15.0),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: Color(getColorHexFromStr('#35c7cc')),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Icon(Icons.delete, color: Colors.white, size: 16.0),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}