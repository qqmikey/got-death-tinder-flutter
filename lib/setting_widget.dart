import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 64.0),
              child: RaisedButton(
                onPressed: _authVK,
                child: Text('Авторизоваться с помощью VK'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _authVK() async {

  }
}
