import 'package:flutter/material.dart';
import 'package:gotbet/models/got_answer.dart';
import 'package:gotbet/models/got_card.dart';
import 'profile_card_alignment.dart';
import 'dart:math';

List<Alignment> cardsAlign = [new Alignment(0.0, 1.0), new Alignment(0.0, 0.8), new Alignment(0.0, 0.0)];
List<Size> cardsSize = new List(3);

class CardsSectionAlignment extends StatefulWidget {
  List<GOTCard> cards;

  CardsSectionAlignment(BuildContext context, {cards}) {
    cardsSize[0] = new Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.6);
    cardsSize[1] = new Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.55);
    cardsSize[2] = new Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.5);
    this.cards = cards;
  }

  @override
  _CardsSectionState createState() => new _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionAlignment> with SingleTickerProviderStateMixin {
  int frontCardindex = 0;
  int cardsCounter = 0;

  List<ProfileCardAlignment> visibleCards = new List();
  AnimationController _controller;

  final Alignment defaultFrontCardAlign = new Alignment(0.0, 0.0);
  Alignment frontCardAlign;
  double frontCardRot = 0.0;

  @override
  void initState() {
    super.initState();
    // Init cards

    var lastCardSet = false;
    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      try {
        var card = widget.cards[cardsCounter];
        visibleCards.add(new ProfileCardAlignment(
          title: card.title,
          subtitle: card.description ?? '',
          image: Image.network(
            card.getImageUrl(),
            fit: BoxFit.cover,
          ),
        ));
      } catch (e) {
        if (lastCardSet) {
          visibleCards.add(null);
        } else {
          visibleCards.add(_getFinishCard());
          lastCardSet = true;
        }
      }
    }

    frontCardAlign = cardsAlign[2];
    // Init the animation controller
    _controller = new AnimationController(duration: new Duration(milliseconds: 700), vsync: this);
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) changeCardsOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            _getCurrentCardTitle(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
        ),
        backCard(),
        middleCard(),
        frontCard(),

        // Prevent swiping if the cards are animating
        _controller.status != AnimationStatus.forward
            ? new SizedBox.expand(
                child: new GestureDetector(
                // While dragging the first card
                onPanUpdate: (DragUpdateDetails details) {
                  // Add what the user swiped in the last frame to the alignment of the card
                  setState(() {
                    // 20 is the "speed" at which moves the card
                    frontCardAlign = new Alignment(
                        frontCardAlign.x + 20 * details.delta.dx / MediaQuery.of(context).size.width,
                        frontCardAlign.y + 40 * details.delta.dy / MediaQuery.of(context).size.height);

                    frontCardRot = frontCardAlign.x; // * rotation speed;
                  });
                },
                // When releasing the first card
                onPanEnd: (_) {
                  // If the front card was swiped far enough to count as swiped
                  var rightSwipe = frontCardAlign.x > 3.0;
                  var leftSwipe = frontCardAlign.x < -3.0;
                  if (rightSwipe || leftSwipe) {
                    if (leftSwipe) {
                      print('leftSwipe');
                    }
                    if (rightSwipe) {
                      print('rightSwipe');
                    }
                    animateCards();
                    setState(() {
                      frontCardindex++;
                    });
                  } else {
                    // Return to the initial rotation and alignment
                    setState(() {
                      frontCardAlign = defaultFrontCardAlign;
                      frontCardRot = 0.0;
                    });
                  }
                },
              ))
            : new Container(),
      ],
    ));
  }

  Widget backCard() {
    return new Align(
      alignment: _controller.status == AnimationStatus.forward
          ? CardsAnimation.backCardAlignmentAnim(_controller).value
          : cardsAlign[0],
      child: new SizedBox.fromSize(
          size: _controller.status == AnimationStatus.forward
              ? CardsAnimation.backCardSizeAnim(_controller).value
              : cardsSize[2],
          child: visibleCards[2]),
    );
  }

  Widget middleCard() {
    return new Align(
      alignment: _controller.status == AnimationStatus.forward
          ? CardsAnimation.middleCardAlignmentAnim(_controller).value
          : cardsAlign[1],
      child: new SizedBox.fromSize(
          size: _controller.status == AnimationStatus.forward
              ? CardsAnimation.middleCardSizeAnim(_controller).value
              : cardsSize[1],
          child: visibleCards[1]),
    );
  }

  Widget frontCard() {
    var aligment = _controller.status == AnimationStatus.forward
        ? CardsAnimation.frontCardDisappearAlignmentAnim(_controller, frontCardAlign).value
        : frontCardAlign;

    List<GOTAnswer> answers = [];
    var answer = '';
    var opacity = 0.0;
    var scale = 1.0;
    var aligmentX = aligment.x.abs();

    if (frontCardindex < widget.cards.length) {
      answers = widget.cards[frontCardindex].answers;
    }

    if (aligmentX > 0) {
      if (answers.isNotEmpty) {
        answer = aligment.x < 0 ? answers[0].title : answers[1].title;
      }
      if (aligmentX <= 3.0) {
        opacity = aligmentX / 3.0;
      } else {
        opacity = 1.0;
      }

      var maxScale = 3.0;

      if (aligmentX <= maxScale - 1.0) {
        scale = aligmentX;
      } else {
        scale = maxScale;
      }

    }

    return new Align(
        alignment: aligment,
        child: new Transform.rotate(
          angle: (pi / 180.0) * frontCardRot,
          child: new SizedBox.fromSize(
              size: cardsSize[0],
              child: Stack(
                children: <Widget>[
                  visibleCards[0] ?? Container(),
                  Positioned.fill(
                      child: Center(
                    child: Transform.scale(
                      scale: scale,
                      child: Opacity(
                        opacity: opacity,
                        child: Text(
                          answer,
                          style: TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ))
                ],
              )),
        ));
  }

  void changeCardsOrder() {
    setState(() {
      // Swap cards (back card becomes the middle card; middle card becomes the front card, front card becomes a new bottom card)
      visibleCards[0] = visibleCards[1];
      visibleCards[1] = visibleCards[2];

      cardsCounter++;

      if (cardsCounter < widget.cards.length) {
        var card = widget.cards[cardsCounter];
        visibleCards[2] = new ProfileCardAlignment(
          title: card.title,
          subtitle: card.description,
          image: Image.network(
            card.getImageUrl(),
            fit: BoxFit.cover,
          ),
        );
      }

      if (cardsCounter > widget.cards.length) {
        visibleCards[2] = _getFinishCard();
      }

      if (cardsCounter > widget.cards.length + 1) {
        visibleCards[2] = null;
      }

      frontCardAlign = defaultFrontCardAlign;
      frontCardRot = 0.0;
    });
  }

  void animateCards() {
    _controller.stop();
    _controller.value = 0.0;
    _controller.forward();
  }

  _getFinishCard() {
    return ProfileCardAlignment(
      title: 'на этом пока всё',
    );
  }

  String _getCurrentCardTitle() {
    if (cardsCounter > widget.cards.length + 1) {
      return '';
    }
    return widget.cards[frontCardindex].question ?? '';
  }
}

class CardsAnimation {
  static Animation<Alignment> backCardAlignmentAnim(AnimationController parent) {
    return new AlignmentTween(begin: cardsAlign[0], end: cardsAlign[1])
        .animate(new CurvedAnimation(parent: parent, curve: new Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Size> backCardSizeAnim(AnimationController parent) {
    return new SizeTween(begin: cardsSize[2], end: cardsSize[1])
        .animate(new CurvedAnimation(parent: parent, curve: new Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Alignment> middleCardAlignmentAnim(AnimationController parent) {
    return new AlignmentTween(begin: cardsAlign[1], end: cardsAlign[2])
        .animate(new CurvedAnimation(parent: parent, curve: new Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Size> middleCardSizeAnim(AnimationController parent) {
    return new SizeTween(begin: cardsSize[1], end: cardsSize[0])
        .animate(new CurvedAnimation(parent: parent, curve: new Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Alignment> frontCardDisappearAlignmentAnim(AnimationController parent, Alignment beginAlign) {
    return new AlignmentTween(
            begin: beginAlign,
            end: new Alignment(
                beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0, 0.0) // Has swiped to the left or right?
            )
        .animate(new CurvedAnimation(parent: parent, curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));
  }
}
