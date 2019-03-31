import "package:flutter/material.dart";
import "pages/homepage.dart";
import "models/global_vars.dart" as globals;

void main() => runApp(FlutterCookbook());

class FlutterCookbook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Cookbook",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(title: globals.appName),
    );
  }
}
