// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'got_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GOTCard _$GOTCardFromJson(Map<String, dynamic> json) {
  return GOTCard()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..question = json['question'] as String
    ..img = json['img'] as String
    ..answers = (json['answers'] as List)
        ?.map((e) =>
            e == null ? null : GOTAnswer.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GOTCardToJson(GOTCard instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'question': instance.question,
      'img': instance.img,
      'answers': instance.answers
    };
