import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  // final RatingChangingCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = 0.0, this.color});

  Widget buildStar(BuildContext context, int index){
    Icon icon;
    if(index >= rating){
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: 16.0,
      );
    }else if(index > rating -1 && index < rating){
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: 16.0,
      );
    }else{
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: 16.0,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}