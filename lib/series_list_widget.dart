import 'package:flutter/material.dart';
import 'package:gotbet/cards/swipe_feed_page.dart';
import 'package:gotbet/models/series_item.dart';

class SeriesListWidget extends StatefulWidget {
  @override
  _SeriesListWidgetState createState() => _SeriesListWidgetState();
}

class _SeriesListWidgetState extends State<SeriesListWidget> {
  List<Series> _series = [];

  @override
  void initState() {
    super.initState();
    _fetchSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            title: Text('Список серий'),
          ),
          Expanded(
            child: ListView(
              children: _series.map((s) => SeriesListCell(episode: s, onTap: _openSeriesDetailed)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _fetchSeries() async {
    var series = await Series.fetchAll();
    setState(() {
      _series = series;
    });
  }

  _openSeriesDetailed(Series episode) async {
    var _episode = await episode.fetch();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return SwipeFeedPage(
        episode: _episode,
      );
    }));
  }
}

class SeriesListCell extends StatelessWidget {
  Series episode;
  Function(Series episode) onTap;

  SeriesListCell({this.episode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(episode.title),
      onTap: () {
        onTap(episode);
      },
    );
  }
}
