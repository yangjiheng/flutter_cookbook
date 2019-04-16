import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "../models/global_vars.dart" as globals;
import "./loginpage.dart";
import "./animationpage.dart";
import "./widgetfadepage.dart";
import "./snackbarpage.dart";
import "./fontspage.dart";
import "./orientationpage.dart";
import "./themepage.dart";
import "./customfontpage.dart";
import "package:shared_preferences/shared_preferences.dart";

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            globals.isLoggedIn ? Text(widget.title) :RaisedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children:<Widget>[
            DrawerHeader(
              child: globals.isLoggedIn ? Text(globals.username) :Text("Click to Login"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("Show Animation Demo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationPage()));
              },
            ),
            ListTile(
              title: Text("Show widget fade demo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WidgetFadePage()));
              },
            ),
            ListTile(
              title: Text("SnackBar demo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SnackbarPage()));
              },
            ),
            ListTile(
              title: Text("Fonts demo"),
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FontsPage()));
              }
            ),
            ListTile(
              title: Text("Orientation demo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrientationPage()));
              },
            ),
            ListTile(
              title: Text("Theme Font demo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThemePage()));
              },
            ),
            ListTile(
              title: Text("Custom font demo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:  (context) => CustomFontPage()));
              },
            )
          ]
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Beijing",
    "Shanghai",
    "Guangzhou"
  ];

  final recentCities = [
    "Beijing"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon:Icon(Icons.clear), onPressed: (){
        
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: (){
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentCities:cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: () {
        showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(
        text: TextSpan(
          text: suggestionList[index].substring(0, query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [ TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey)
          )]
        )
      ),
    ),itemCount: suggestionList.length,);
  }
}
