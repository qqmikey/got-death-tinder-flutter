import 'package:flutter/material.dart';
import 'package:gotbet/cards/swipe_feed_page.dart';
import 'package:gotbet/models/series_item.dart';

class SeriesListWidget extends StatefulWidget {
  @override
  _SeriesListWidgetState createState() => _SeriesListWidgetState();
}

class _SeriesListWidgetState extends State<SeriesListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _fetchSeries,
          child: Text('test', style: TextStyle(color: Colors.black,),),

        ),
      ),
    );
  }

  void _fetchSeries() async {
    var series = await Series.fetchAll();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return SwipeFeedPage(
        seriesItem: series[0],
      );
    }));
  }
}
