// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) {
  return Series()
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

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'showtime': instance.showtime,
      'img': instance.img,
      'status': instance.status,
      'cards': instance.cards
    };
