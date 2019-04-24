
import 'comment.dart';

class Sneaker{
  final String title;
  final String imgPath;
  final String color;
  final String price;
  final double rate;
  final List<Comment> comments;

  Sneaker({this.title,this.price, this.color,  this.comments, this.imgPath,  this.rate});
}

final lebron = Sneaker(
  title: 'Porche Sports Lite',
  color: '#6d74e9',
  price: '84',
  imgPath: 'assets/lebron.png',
  rate: 4.5,
  comments: lebronComments
);

final blade = Sneaker(
  title: 'Blade Adidas Sports',
  color: '#eaa6ca',
  price: '96',
  imgPath: 'assets/blade.png',
  rate: 3.5,
  comments: bladeComments
);

final doubles = Sneaker(
  title: 'Black Pump Nikes',
  color: '#ec9536',
  price: '120',
  imgPath: 'assets/double.png',
  rate: 4.0,
  comments: doublesComments
);

final airmax = Sneaker(
  title: 'Yellow Airmax Lite',
  color: '#733972',
  price: '160',
  imgPath: 'assets/airmax.png',
  rate: 2.5,
  comments: airmaxComments
);