import 'package:flutter/material.dart';

class ProfileCardAlignment extends StatelessWidget {
  final String title;
  final String subtitle;
  Image image;

  ProfileCardAlignment({this.title,this.subtitle: '', this.image});

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      image = Image.asset('assets/bg.jpg',fit: BoxFit.cover,);
    }
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(16.0),
      child: new Stack(
        children: <Widget>[
          new SizedBox.expand(
            child: new Material(
              child: image,
            ),
          ),
          new SizedBox.expand(
            child: new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          new Align(
            alignment: Alignment.bottomLeft,
            child: new Container(
                padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(title,
                        style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700)),
                    new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
                    new Text(subtitle,
                        textAlign: TextAlign.start, style: new TextStyle(color: Colors.white)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
