import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(this.foodPic, this.foodName, {Key key}) : super(key: key);

  final String foodPic;
  final String foodName;

  @override
  _DetailsPageState createState() => _DetailsPageState(foodPic, foodName);
}

class _DetailsPageState extends State<DetailsPage> {
  final String foodPic;
  final String foodName;
  final imagesDir = "graphics/";

  _DetailsPageState(this.foodPic, this.foodName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(imagesDir + foodPic), fit: BoxFit.fitHeight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: Padding(
                  padding: EdgeInsets.only(top: 48, left: 16),
                  child: Row(children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
                  ])),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(foodName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Text("\$14",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Text(
                      "Focaccia is a flat oven-baked Italian bread product similar in style and texture to pizza dough. Focaccia can be used as a side to many meals or as sandwich bread. Focaccia al rosmarino is a common focaccia style in Italian cuisine that may be served as an antipasto, appetizer, table bread, or snack.",
                      strutStyle: StrutStyle(height: 2),
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.deepPurpleAccent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Text("Purchase",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
