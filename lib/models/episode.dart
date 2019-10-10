import 'dart:convert';
import 'package:gotbet/models/got_card.dart';
import 'package:gotbet/resources.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'episode.g.dart';
var jwt  = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6InJvb3QxMjIzIiwiZXhwIjoxNTU2ODEwNjQ3LCJlbWFpbCI6IiJ9.5uOzRiPoTsVuGUU4wrBkLA2lDSni5OwZki4Dur2_OvA';

@JsonSerializable()
class Episode {
  Episode();

  int id;
  String title;
  String showtime;
  String img;
  int status;
  List<GOTCard> cards;

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  String getImageUrl() {
    return '${Constants.urls.base}$img';
  }

  static Future<List<Episode>> fetchAll() async {
    List<Episode> cards = [];
    final http.Response response = await http.get(Constants.urls.episodes, headers: {'Authorization': 'Bearer $jwt'});
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      final jsonArray = json.decode(utf8.decode(response.bodyBytes)).cast<Map<String, dynamic>>();
      cards = jsonArray.map<Episode>((json) => new Episode.fromJson(json)).toList();
    }
    return cards;
  }

  Future<Episode> fetch() async {
    var url = Constants.urls.episodes;
    final http.Response response = await http.get('$url/$id', headers: {'Authorization': 'Bearer $jwt'});
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return new Episode.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    }
    return null;
  }
}
