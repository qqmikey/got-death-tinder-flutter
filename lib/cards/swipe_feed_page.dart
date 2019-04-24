import 'package:flutter/material.dart';
import 'package:gotbet/models/got_card.dart';
import 'package:gotbet/models/series_item.dart';
import 'cards_section_alignment.dart';

class SwipeFeedPage extends StatefulWidget {
  Series seriesItem;

  SwipeFeedPage({this.seriesItem});

  @override
  _SwipeFeedPageState createState() => new _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {
  bool showAlignmentCards = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: new IconButton(onPressed: () {}, icon: new Icon(Icons.chevron_left, color: Colors.white)),
              title: Text(
                widget.seriesItem.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              child: Text(
                'test',
                style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600),
              ),
            ),
            CardsSectionAlignment(
              context,
              cards: widget.seriesItem.cards,
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
