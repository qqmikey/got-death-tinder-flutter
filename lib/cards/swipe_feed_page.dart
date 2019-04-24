import 'package:flutter/material.dart';
import 'package:gotbet/models/got_card.dart';
import 'package:gotbet/models/series_item.dart';
import 'cards_section_alignment.dart';

class SwipeFeedPage extends StatefulWidget {
  Series episode;

  SwipeFeedPage({this.episode});

  @override
  _SwipeFeedPageState createState() => new _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {
  bool showAlignmentCards = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.episode.getImageUrl()), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: new IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: new Icon(Icons.chevron_left, color: Colors.white)),
              title: Text(
                widget.episode.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            CardsSectionAlignment(
              context,
              cards: widget.episode.cards,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
