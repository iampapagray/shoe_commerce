import 'package:favourites/model/sneaker.dart';
import 'package:favourites/round_nav_button.dart';
import 'package:favourites/round_profile.dart';
import 'package:flutter/material.dart';
import 'package:favourites/styles.dart';
import 'package:favourites/star_rating.dart';
import 'dart:math' as math;

class DetailPage extends StatefulWidget {

  final Sneaker sneaker;

  DetailPage({this.sneaker});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Material(
                elevation: 10.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Stack(
              // fit: StackFit.expand,
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 210.0,
                  // color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 54.0, bottom: 24.0),
                    child: Material(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.crop_rotate),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      height: 150.0,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                        color: Color(getColorHexFromStr(widget.sneaker.color)),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerRight,
                      // height: 50.0,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right:24.0),
                            child: Text("\$ " + widget.sneaker.price, 
                                style: priceStyle.copyWith(fontSize: 42.0 ),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Review',
                                style: ratingStyle,
                              ),
                              SizedBox(width: 10.0,),
                              StarRating(rating: widget.sneaker.rate, color: Colors.black)
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                RoundNavButton(size: 40.0, color: '#c3c3c3', number: '6'),
                                RoundNavButton(size: 40.0, color: widget.sneaker.color, number: '7'),
                                RoundNavButton(size: 40.0, color: widget.sneaker.color, number: '8'),
                                RoundNavButton(size: 40.0, color: widget.sneaker.color, number: '9'),
                                RoundNavButton(size: 40.0, color: widget.sneaker.color, number: '10'),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                RoundNavButton(size: 25.0, color: '#000000', number: ''),
                                RoundNavButton(size: 25.0, color: widget.sneaker.color, number: ''),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 45.0,
                  right: 80.0,
                  child: Transform.rotate(
                    angle: - math.pi/6,
                    child:Container(
                      alignment: Alignment.bottomLeft,
                      // height: 150.0,
                      width: 225.0,
                      // width: 220.0,
                      // color: Colors.red,
                      child: Image(
                        image: AssetImage(widget.sneaker.imgPath), 
                        alignment: Alignment.center
                      )
                    )
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.sneaker.title,
              style: detailsTitleStyle
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left:8.0, right:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'People Said',
                  style: detailsTitleStyle.copyWith(color: Color(getColorHexFromStr(widget.sneaker.color))),
                ),
                Container(
                  width: 130.0,
                  child: Stack(
                    children: <Widget>[
                      RoundProfile(img: 'assets/profile1.jpg'),
                      Positioned(
                        left:20.0,
                        child: RoundProfile(img: 'assets/profile2.png')
                      ),
                      Positioned(
                        right:30.0,
                        child: RoundProfile(img: 'assets/profile3.jpg')
                      ),
                      Positioned(
                        right:50.0,
                        child: RoundProfile(img: 'assets/profile4.png')
                      ),
                      Align(alignment: Alignment.topRight, child: Text('+ 45', style: TextStyle(color: Color(getColorHexFromStr(widget.sneaker.color)))))
                    ],
                  )
                )
              ],
            ),
          ),
          // SizedBox(height:10.0),
          Expanded(
            child: ListView.builder(
              itemCount: widget.sneaker.comments.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 5.0),
                  child: Container(
                    height: 140.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Color(getColorHexFromStr(widget.sneaker.color)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0
                              ),
                              image: DecorationImage(
                                image: AssetImage(widget.sneaker.comments[index].userImg)
                              )
                            )
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(widget.sneaker.comments[index].user, style: userNameStyle),
                              ),
                              Text(widget.sneaker.comments[index].date, style: ratingStyle.copyWith(color: Colors.white)),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  widget.sneaker.comments[index].desc,
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.justify,
                                  style: commentStyle,
                                ),
                              )
                            ],  
                          ),
                        )
                      ],
                    )
                  )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}