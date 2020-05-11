import 'package:flutter/material.dart';

import 'details.dart';

void main() {
  runApp(PastaApp());
}

class PastaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasta App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BrowsePastaPage(title: 'Pasta'),
    );
  }
}

class BrowsePastaPage extends StatefulWidget {
  BrowsePastaPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BrowsePastaPageState createState() => _BrowsePastaPageState();
}

class _BrowsePastaPageState extends State<BrowsePastaPage> {
  void _navigateToDetails(String picture, String name) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(picture, name)),
      );
    });
  }

  final imagesDir = "graphics/";
  final foodNames = ["Focaccia", "Pizza", "Shrimp scampi", "Spaghetti", "Pasta"];
  String activeTab = "Focaccia";

  final foodPics = [
    "tomato_bread.jpg",
    "pizza.jpg",
    "shrimp_pasta.jpg",
    "mmmm_food.jpg",
    "pasta.jpg",
  ];

  List<Widget> createTabs() {
    List<Widget> tabWidgets = [];
    for (final tabName in foodNames) {
      var tabStyle = TextStyle(fontSize: 18);
      if (tabName == activeTab) {
        tabStyle = TextStyle(
            fontSize: 18,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(0xFF, 0x5E, 0x32, 0xFF));
      }
      tabWidgets.add(Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            tabName,
            style: tabStyle,
          )));
    }
    return tabWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 0xF5, 0xF5, 0xF5),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 56, left: 32, right: 32, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Pasta",
                  style: Theme.of(context).textTheme.headline4,
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Menu clicked"),
                    ));
                  },
                )
              ],
            ),
          ),
          FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Search here",
                          fillColor: Color.fromARGB(0xFF, 0xA8, 0xA8, 0xA8),
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 16),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: createTabs(),
                  ))),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: () {
                List<Widget> pics = [];
                for (var i = 0; i < foodPics.length; i++) {
                  final foodName = foodNames[i];
                  var foodPic = foodPics[i];
                  pics.add(makeFoodPic(context, foodPic, foodName));
                }
                return pics;
              }(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Desserts",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
          ),
        ],
      ),
    );
  }

  Widget makeFoodPic(BuildContext context, String foodPic, String foodName) {
    return GestureDetector(
      onTap: () => {_navigateToDetails(foodPic, foodName)},
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$14",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.white,
                        size: 32,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Text("View",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32)),
                          color: Colors.deepPurpleAccent),
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(imagesDir + foodPic),
                    fit: BoxFit.fitHeight)),
          )),
    );
  }
}
