import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_cookbook/utils/http_request.dart';
// import "../models/global_vars.dart" as globals;
import "../utils/http_request.dart" as HttpRequest;

class Result {
  
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  static final formKey = new GlobalKey<FormState>();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      key: new Key("username"),
      decoration: new InputDecoration(labelText: "username"),
      autocorrect: false,
      validator: (val) => val.isEmpty ? "username can not be empty" : null,
      onSaved: (val) => this.username = val,
    );

    final passwordField = TextFormField (
      key: new Key("password"),
      decoration: new InputDecoration(labelText: "password"),
      autocorrect: false,
      validator: (val) => val.isEmpty ? "password can not be empty" : null,
      onSaved: (val) => this.password = val,
    );

    final loginButton = RaisedButton(
      child: const Text("Login"),
      onPressed: () {
        runHttpRequest();
      }
    );

    final body = Container(
      child: Column(
        children: <Widget>[usernameField, passwordField, loginButton],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login")
      ),
      body: body
    );
  }
  Future runHttpRequest() async {
    HttpRequestUtil httpRequest = new HttpRequestUtil(requestURL: "http://localhost:8080/", method: HttpRequest.RequestMethod.HTTP_GET);
    Map<String, dynamic> requestResult = await httpRequest.performRequest();
    return requestResult;
  }
}

