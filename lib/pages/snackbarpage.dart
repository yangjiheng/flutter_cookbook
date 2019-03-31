import "package:flutter/material.dart";

class SnackbarPage extends StatefulWidget {
  SnackbarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => SnackbarPageState();
}

class SnackbarPageState extends State<SnackbarPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key:mScaffoldState,
      appBar: AppBar(
        title: Text("Snackbar Demo"),
      ),
      body: (
        RaisedButton(
          onPressed: () {
            final snackBar = new SnackBar(content: new Text('Yay! A SnackBar!'));
            mScaffoldState.currentState.showSnackBar(snackBar);
          },
          child: Text('Show SnackBar')
        )
      )
    );
  }
}
