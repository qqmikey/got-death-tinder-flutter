import 'package:flutter/material.dart';
import 'package:gotbet/cards/swipe_feed_page.dart';
import 'package:gotbet/series_list_widget.dart';

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
      home: SeriesListWidget(),
    );
  }
}
