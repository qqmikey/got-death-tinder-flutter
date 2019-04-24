// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return Episode()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..showtime = json['showtime'] as String
    ..img = json['img'] as String
    ..status = json['status'] as int
    ..cards = (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : GOTCard.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'showtime': instance.showtime,
      'img': instance.img,
      'status': instance.status,
      'cards': instance.cards
    };
