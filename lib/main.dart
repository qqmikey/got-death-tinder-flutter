import 'package:flutter/material.dart';
import 'package:gotbet/cards/swipe_feed_page.dart';
import 'package:gotbet/rating_widget.dart';
import 'package:gotbet/series_list_widget.dart';
import 'package:gotbet/setting_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    SeriesListWidget(),
    RatingWidget(),
    SettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOT'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), title: Text('Эпизоды')),
          BottomNavigationBarItem(icon: Icon(Icons.grade), title: Text('Рейтинг')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Настройки')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
