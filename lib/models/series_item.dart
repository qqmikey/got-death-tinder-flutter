import 'dart:convert';
import 'package:gotbet/models/got_card.dart';
import 'package:gotbet/resources.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'series_item.g.dart';
var jwt  = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6InJvb3QxMjIzIiwiZXhwIjoxNTU2NzIzMTUxLCJlbWFpbCI6IiJ9.sGvl7utvukJiGKvrlCC_FqPhhAZh82e5lqLvROJb82Y';

@JsonSerializable()
class Series {
  Series();

  int id;
  String title;
  String showtime;
  String img;
  int status;
  List<GOTCard> cards;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesToJson(this);

  String getImageUrl() {
    return '${Constants.urls.base}$img';
  }

  static Future<List<Series>> fetchAll() async {
    List<Series> cards = [];
    final http.Response response = await http.get(Constants.urls.series, headers: {'Authorization': 'Bearer $jwt'});
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      final jsonArray = json.decode(utf8.decode(response.bodyBytes)).cast<Map<String, dynamic>>();
      cards = jsonArray.map<Series>((json) => new Series.fromJson(json)).toList();
    }
    return cards;
  }

  Future<Series> fetch() async {
    var url = Constants.urls.series;
    final http.Response response = await http.get('$url/$id', headers: {'Authorization': 'Bearer $jwt'});
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return new Series.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    }
    return null;
  }
}
