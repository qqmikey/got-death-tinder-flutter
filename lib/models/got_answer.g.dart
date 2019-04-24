// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'got_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GOTAnswer _$GOTAnswerFromJson(Map<String, dynamic> json) {
  return GOTAnswer()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..question = json['question'] as String
    ..img = json['img'] as String
    ..isCorrect = json['is_correct'] as bool;
}

Map<String, dynamic> _$GOTAnswerToJson(GOTAnswer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'question': instance.question,
      'img': instance.img,
      'is_correct': instance.isCorrect
    };
