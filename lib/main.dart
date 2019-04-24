import 'package:favourites/model/sneaker.dart';
import 'package:favourites/sneaker_card.dart';
import 'package:favourites/styles.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favourites',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
@override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'My Favorites',
                  style: headingStyle,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Material(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border, size:12.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.lightBlue.shade300,
                        ),
                        child: Text(
                          '4',
                          style: favStyle,
                        ),
                      ),
                    )
                  ],
                ),
                
              ],
            ),
          ),
          Expanded(
             child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  SneakerCard(sneaker: lebron),
                  SneakerCard(sneaker: doubles),
                  SneakerCard(sneaker: blade),
                  SneakerCard(sneaker: airmax)
                ],
              ),
            ),
          )
        
        ],
      ),
    );
  }
}
