import "package:flutter/material.dart";

class WidgetFadePage extends StatefulWidget {
  @override
  WidgetFadePageState createState() => WidgetFadePageState();
}

class WidgetFadePageState extends State<WidgetFadePage> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Fade Page"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: Duration(milliseconds:  500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            visible = !visible;
          });
        },
        tooltip: 'Toogle opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
  
}