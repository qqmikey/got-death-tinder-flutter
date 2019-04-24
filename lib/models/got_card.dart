import 'dart:convert';
import 'package:gotbet/models/got_answer.dart';
import 'package:gotbet/resources.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'got_card.g.dart';

@JsonSerializable()
class GOTCard {
  GOTCard();

  int id;
  String title;
  String description;
  String question;
  String img;
  List<GOTAnswer> answers;

  factory GOTCard.fromJson(Map<String, dynamic> json) => _$GOTCardFromJson(json);

  Map<String, dynamic> toJson() => _$GOTCardToJson(this);

  String getImageUrl() {
    return '${Constants.urls.base}$img';
  }

  Future<bool> sendAnwer({int index}) async {
    var url = Constants.urls.episodes;
    var answerId = answers[index].id;
    final http.Response response = await http.post('$url/$id/answers/$answerId');
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}