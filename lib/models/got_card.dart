import 'dart:convert';
import 'package:gotbet/models/got_answer.dart';
import 'package:gotbet/resources.dart';
import 'package:json_annotation/json_annotation.dart';

//import 'package:siberian_wellness/utils/resources.dart';
//import 'package:http/http.dart' as http;

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
//  static Future<List<GOTCard>> fetch() async {
//    List<GOTCard> ages = [];
//    final http.Response response = await http.get(Constants.ageRanges);
//    print(utf8.decode(response.bodyBytes));
//    if (response.statusCode == 200) {
//      final jsonArray = json.decode(utf8.decode(response.bodyBytes)).cast<Map<String, dynamic>>();
//      ages = jsonArray.map<AgeRange>((json) => new AgeRange.fromJson(json)).toList();
//    }
//    return ages;
//  }
}