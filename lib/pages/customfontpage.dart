import "package:flutter/material.dart";

class CustomFontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom font page")
      ),
      body: Center(
        child: Text(
          "Railway font sample",
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
      )
    );
  }
}