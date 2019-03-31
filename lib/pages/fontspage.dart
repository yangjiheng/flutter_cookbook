import 'package:flutter/material.dart';

class FontsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FontsPageState();
}

class FontsPageState extends State<FontsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fonts Page Demo"),
      ),
      body: Center(
        child: (
          Text(
            "Use Raleway fonts from awesome_package",
            style: TextStyle(
              fontFamily: "Raleway",
              package: "awesome_package"
            ),
          )
        )
      )
    );
  }
}
